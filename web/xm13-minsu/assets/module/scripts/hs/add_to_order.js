/**
 * Created by H on 2019/6/30.
 */
function add_to_order(){
    console.log("aaaaa");
    //alert("clicked");
    if(checkInput()==true){
        $("#page_form").submit();
    }

}

var initTimePeriod=function(){
    var today=new Date();
    var thisYear=today.getFullYear();
    var thisMonth=today.getMonth()+1;
    var thisDay = today.getDate();
    var firstDay=thisYear+'-'+thisMonth+'-'+thisDay;
    today.setDate(today.getDate()+1);
    var tomorrow = today.getFullYear()+'-'+(today.getMonth()+1) +'-'+today.getDate();
    //firstDay=ComponentsPickers.formatDate(ComponentsPickers.parseDate(firstDay),"yyyy-MM-dd")+" 00:00:00";
    //var nowDay=ComponentsPickers.formatDate(today,"yyyy-MM-dd")+" 23:59:59";
    $('#time_to').datetimepicker({
        weekStart: 1,
        todayBtn: true,
        autoclose: true,
        todayHighlight: 1,
        startView: 2,
        forceParse: 1,
        minView:2,
        inline: false,
        showApplyButton: true,
        //showMeridian: 1,
        format: 'yyyy-mm-dd'
    });
    $('#time_from').datetimepicker({
        weekStart: 1,
        todayBtn: true,
        autoclose: true,
        todayHighlight: 1,
        startView: 2,
        forceParse: 1,
        minView:2,
        inline: false,
        showApplyButton: true,
        //showMeridian: 1,
        format: 'yyyy-mm-dd'
    });

    $("#time_from").val(firstDay);
    $("#time_to").val(tomorrow);
}

function compareTime(logintime, logouttime) {
    if (logintime.length > 0 && logouttime.length > 0) {
        var logintimeTemp = logintime.split(" ");
        var logouttimeTemp = logouttime.split(" ");

        var arrloginDate = logintimeTemp[0].split("-");
        var arrlogoutDate = logouttimeTemp[0].split("-");

        var allLoginDate = new Date(arrloginDate[0], arrloginDate[1], arrloginDate[2]);
        var allLogoutDate = new Date(arrlogoutDate[0], arrlogoutDate[1], arrlogoutDate[2]);

        if (allLoginDate.getTime() >= allLogoutDate.getTime()) {
            return false;
        } else {
            return true;
        }
    } else {
        return false;
    }
}
function checkInput(){
    var bOk=true;
    var timeFrom=$("#time_from").val();
    var timeTo = $("#time_to").val();
    console.log(timeFrom);
    if(timeFrom==null || timeFrom==""){Frame.showMsg("时间范围不能为空！");bOk=false;};

    if(compareTime(timeFrom,timeTo) == false){
        alert("开始时间不能晚于结束时间");
        bOk = false;
    }
    return bOk;
};

initTimePeriod();
//console.log("stat ok");