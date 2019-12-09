jQuery(document).ready(function() {

	console.log("js初始化执行开始！");
	Page.init();
	console.log("js初始化执行完毕！");

});
var module="album";
var sub="file";
/*================================================================================*/
//关于页面的控件生成等操作都放在Page里，和Record独立，Record主要是和记录集交互
var Page = function() {
    var html="";
    var initData=function(){
        var url="../"+module+"_"+sub+"_servlet_action?action=get_record";
        console.log("生成的url："+url);
        $.post(url,function(json){
             console.log(JSON.stringify(json));
             showResult(json);
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
        var album_id=json[1];
        var album_info=json[2];
        var create_time=json[3];
        html=html+"														<tr>";
        html=html+"                                             <td>"+album_id+"</td>";
        html=html+"                                             <td>"+album_info+"</td>";
        html=html+"                                             <td>"+create_time+"</td>";
        html=html+"</tr>";
    };
	return {
		init: function() {
            initData();

		}
	}
}();//Page
/*================================================================================*/
