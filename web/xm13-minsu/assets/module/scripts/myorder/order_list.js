var module="myorder";
var sub="file";
jQuery(document).ready(function() {
	console.log("js初始化执行开始！");
   // Frame.init(module,sub);
    Page.init();
    Record.init();
	console.log("js初始化执行完毕！");
});
/*================================================================================*/
//关于页面的控件生成等操作都放在Page里，和Record独立，Record主要是和记录集交互
var Record=function(){
    var initRecordList = function(){
        getRecord();
    };

    var getRecord=function(){
        $.post("../"+module+"_"+sub+"_servlet_action?action=get_record",function(json){
            console.log(JSON.stringify(json));
            Page.showResult(json);
        });
    };
    var sortRecord=function(index,sortName){
        $.post("../"+module+"_"+sub+"_servlet_action?action=get_record&sort_index="+index+"&order_by="+sortName,function(json){
            console.log(JSON.stringify(json));
            Page.showResult(json);
        });
    };
      return {
        init: function() {
            initRecordList ();
        },
        sortRecord:function(index,sortName){
            sortRecord(index,sortName);
        }

    }
}();
var Page = function() {
    var html="";
    var initDate=function(){
        $('#begin_time').datetimepicker({
            Date:'yyyy-mm-dd',
            format: 'yyyy-mm-dd',
            language:'zh-CN',
            autoclose:true,
            minView:'month',
            maxView:1,
            todayBtn:'linked',
            showMeridian:false
        }).on('changeDate',function(e){
            var startTime = e.date;
            $('#end_time').datetimepicker('setStartDate',startTime);
        });
        $('#end_time').datetimepicker({
            Date:'yyyy-mm-dd',
            format: 'yyyy-mm-dd',
            language:'zh-CN',
            autoclose:true,
            minView:'month',
            maxView:1,
            todayBtn:'linked',
            showMeridian:false
        }).on('changeDate',function(e){
            var endTime = e.date;
            $('#begin_time').datetimepicker('setEndDate',endTime);
        });
    };
    var showResult=function(json){
        if(json!=null){
            var list=json.aaData;
            html="													<div><span id=\"tip_div\"></span>";
            for(var i=0;i<list.length;i++){
                showList(list[i]);
            }
            html=html+"													</div>";
            $("#record_list_div").html(html);
        }
    };
    var showList=function(json){
        var id=json[0];
        //var image="../assets/module/img/public/wkbj.jpg";
        var status=json[9];
        var orderType=json[2];
        var orderPrice=json[6];
        var beginTime=json[4];
        var endTime=json[5];
        var createTime=json[3];
        var orderUser=json[7];
        var userConnect=json[8];
        var orderID=json[1];
        var me=json[10];
        html=html+"														<tr>";
        html=html+"                                             <td>"+orderID+"</td>";
        html=html+"                                             <td>"+orderType+"</td>";
        html=html+"                                             <td>"+beginTime+"</td>";
        html=html+"                                             <td>"+endTime+"</td>";
        html=html+"                                             <td>"+orderUser+"</td>";
        html=html+"                                             <td>"+userConnect+"</td>";
        html=html+"                                             <td>"+orderPrice+" ";
        if(status=="未支付")
        {
            html = html + "(未支付)";
        }
        else{
            html=html+"(已支付)";
        }
        html=html+"   </td>";
        //html=html+"                                             <td><div onclick=\"Page.deleteRecord("+id+");\" class=\"btn_1 rounded\"> 删除</div>  <div onclick=\"Page.modifyRecord("+id+");\" class=\"btn_1 rounded\">修改</div>";
        html=html+"                                             <td><div onclick=\"Page.deleteRecord("+id+");\" class=\"btn_1 rounded\"> 删除</div>";
        html=html+"                                             </td>";
        html=html+"														</tr>";
    };
    var deleteRecord=function(id){
        if(confirm("您确定要删除该订单吗？")){
            if(id>-1){
                $.post("../"+module+"_"+sub+"_servlet_action?action=delete_record&id="+id,function(json){
                    if(json.result_code==0){
                        window.location.reload();
                        alert("已经删除该订单！");
                    }
                })
            }
        }
    };
    var sortRecord=function(index) {
        //Record.sortRecord(index);
        var sortName="";
        var sort1=$("#sort_01").val();
        var sort2=$("#sort_02").val();
        if(sort1!="orderPrice"){
            sort1="convert("+sort1+" using gbk)";
        }
        if(sort2!="orderPrice"){
            sort2="convert("+sort2+" using gbk)";
        }
        console.log("排序参数："+sort1+"    "+sort2);
        if(index==1) sortName=sort1;
        if(index==2) sortName=sort1+','+sort2;
        Record.sortRecord(index,sortName);
    };
    var modifyRecord=function(id){
          window.location.href="order_view.jsp?id="+id;
    };
    var addRecord=function(){
        if(checkInput()==true){
            page_form.action="../"+module+"_"+sub+"_servlet_action";
            page_form.submit();
        }
    };
    var checkInput=function(){
        var bOk=true;
        var orderPrice=$("#orderPrice").val();
        var orderUser=$("#orderUser").val();
        var userConnect=$("#userConnect").val();
        var beginTime=document.getElementById('begin_time').value;
        var endTime=document.getElementById('end_time').value;
        if(orderPrice==null || orderPrice==""){
           window.alert("订单价格不能为空！");bOk=false;
        }else if(orderUser==null || orderUser==""){
            window.alert("房客名不能为空！");bOk=false;
        }else if(userConnect==null || userConnect==""){
            window.alert("联系方式不能为空！");bOk=false;
        }else if(beginTime==null || beginTime==""){
            window.alert("入住时间不能为空！");bOk=false;
        }else if(endTime==null || endTime==""){
            window.alert("退房时间不能为空！");bOk=false;
        }
        return bOk;
    };
    var printList=function(){
      window.location.href="order_print.jsp";
    };
    var statistic=function(){
        window.location.href="order_statistic_query.jsp";
    };
    var queryRecord=function(){
        window.location.href="order_query.jsp";
    };
    var exportList=function(){
        bOk=confirm("下载需消耗流量，确定是否下载");
        if(bOk==true) {
            window.location.href = "../" + module + "_" + sub + "_servlet_action?action=export_record";
        }
    };
    var initButton=function(){
        $('#addButton').click(function() {Page.addRecord();});
        $('#print_button').click(function() {Page.printList();});
        $('#export_button').click(function() {Page.exportList();});
        $('#query_button').click(function() {Page.queryRecord();});
        $('#statistic_button').click(function() {Page.statisticRecord();});
    };
               return {
                   init: function() {
                            initDate();
                            initButton();
                   },
                   deleteAlbum:function(id){
                        deleteAlbum(id);
                   },
                   modifyRecord:function(id){
                       modifyRecord(id);
                   },
                   addRecord:function(){
                       addRecord();
                   },
                   sortRecord:function(index){
                       sortRecord(index);
                   },
                   showResult:function(json){
                       showResult(json);
                   },
                   printList:function(){
                       printList();
                   },
                   exportList:function(){
                       exportList();
                   },
                   deleteRecord:function(id){
                       deleteRecord(id);
                   },
                   queryRecord:function(){
                       queryRecord();
                   },
                   statisticRecord:function(){
                       statistic();
                   }

               }
}();//Page

