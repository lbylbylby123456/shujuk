jQuery(document).ready(function() {

	console.log("js初始化执行开始！");
	Page.init();
	console.log("js初始化执行完毕！");

});
var module="order";
var sub="file";
/*================================================================================*/
//关于页面的控件生成等操作都放在Page里，和Record独立，Record主要是和记录集交互
var Page = function() {
    var html="";
    var initData=function(){
        var id=$("#id").val();
        var url="../../"+module+"_"+sub+"_servlet_action?action=get_record&id="+id;
        console.log("生成的url："+url);
        $.post(url,function(json){
             console.log(JSON.stringify(json));
             showResult(json);
           //  initChardiv(json);
        });
    };
    var showResult=function(json){
        if(json!=null){
            var list=json.aaData;
            showRecordList(list);
        }
    };
    var showRecordList=function(list){
        for(var i=0;i<list.length;i++){
            showRecord(list[i]);
        }
        $("#record_list_div").html(html);
    };
    var showRecord = function(json){
        var status=json[12];
        var orderType=json[2];
        var orderPrice=json[6];
        var beginTime=json[4];
        var endTime=json[5];
        var createTime=json[3];
        var orderUser=json[7];
        var userConnect=json[8];
        var orderID=json[1];
        html=html+"														<tr>";
        html=html+"                                             <td>"+orderID+"</td>";
        html=html+"                                             <td>"+createTime+"</td>";
        html=html+"                                             <td>"+orderType+"</td>";
        html=html+"                                             <td>"+beginTime+"</td>";
        html=html+"                                             <td>"+endTime+"</td>";
        html=html+"                                             <td>"+orderUser+"</td>";
        html=html+"                                             <td>"+userConnect+"</td>";
        html=html+"                                             <td>"+orderPrice+" &nbsp; ";
        if(status=="已支付"){
            html=html+"（已支付）";
        }else{
            html=html+"  （未支付）";
        }
        html=html+"</td>";
        html=html+"</tr>";
    };
	return {
		init: function() {
            initData();

		}
	}
}();//Page
/*================================================================================*/
