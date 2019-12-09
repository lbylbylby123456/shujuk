/**
 * Created by H on 2019/6/14.
 */
//$('#daterange-btn').daterangepicker({
//        ranges: {
//            '今天': [moment(), moment()],
//            '本周': [moment().startOf('week'), moment().endOf('week')],
//            '本月': [moment().startOf('month'), moment().endOf('month')],
//            '今年': [moment().startOf('year'), moment().endOf('year')]
//        },
//        startDate: moment(),
//        endDate: moment().endOf('month')
//    },
//    function(start, end) {
//        $('#daterange-btn span').html(start.format('MMMM D, YYYY') + ' - ' + end.format('MMMM D, YYYY'));
//        alert(start.format('YYYYMMDD') + " " + end.format('YYYYMMDD'));
//    }
//);
//

var initTimePeriod=function(){
    var today=new Date();
    var thisYear=today.getFullYear();
    var thisMonth=today.getMonth()+1;
    var firstDay=thisYear+'-'+thisMonth+'-01'+" 00:00:00";
    var today =thisYear+'-'+thisMonth+'-'+today.getDate()+" 23:59:59";
    //firstDay=ComponentsPickers.formatDate(ComponentsPickers.parseDate(firstDay),"yyyy-MM-dd")+" 00:00:00";
    //var nowDay=ComponentsPickers.formatDate(today,"yyyy-MM-dd")+" 23:59:59";
    $('#time_to').datetimepicker({
        weekStart: 1,
        todayBtn: true,
        autoclose: true,
        todayHighlight: 1,
        startView: 2,
        forceParse: 1,
        minView:0,
        inline: false,
        showApplyButton: true,
        //showMeridian: 1,
        format: 'yyyy-mm-dd hh:ii:ss'
    });
    $('#time_from').datetimepicker({
        weekStart: 1,
        todayBtn: true,
        autoclose: true,
        todayHighlight: 1,
        startView: 2,
        forceParse: 1,
        minView:0,
        inline: false,
        showApplyButton: true,
        //showMeridian: 1,
        format: 'yyyy-mm-dd hh:ii:ss'
    });

    $("#time_from").val(firstDay);
    $("#time_to").val(today);
}

function compareTime(logintime, logouttime) {
    if (logintime.length > 0 && logouttime.length > 0) {
        var logintimeTemp = logintime.split(" ");
        var logouttimeTemp = logouttime.split(" ");

        var arrloginDate = logintimeTemp[0].split("-");
        var arrlogoutDate = logouttimeTemp[0].split("-");

        var arrloginTime = logintimeTemp[1].split(":");
        var arrlogoutTime = logouttimeTemp[1].split(":");

        var allLoginDate = new Date(arrloginDate[0], arrloginDate[1], arrloginDate[2], arrloginTime[0], arrloginTime[1], arrloginTime[2]);
        var allLogoutDate = new Date(arrlogoutDate[0], arrlogoutDate[1], arrlogoutDate[2], arrlogoutTime[0], arrlogoutTime[1], arrlogoutTime[2]);

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

function submitStatQuery(){
    if(checkInput()==true){
        $("#page_form").submit();
    }
}

initTimePeriod();
console.log("stat ok");