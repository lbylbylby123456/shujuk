jQuery(document).ready(function() {

	console.log("js初始化执行开始！");
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	QuickSidebar.init(); // init quick sidebar
	Demo.init(); // init demo features
	Frame.init(module,sub);
	Page.init();
	console.log("js初始化执行完毕！");

});
var module="questionary";
var sub="forum";
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
            //for(var i=0;i<4;i++){
                showRecord(list[i]);
        }
        $("#record_list_div").html(html);
    };
    var showRecord = function(json){
        var id = json[0];
        //var image = "../../assets/module/img/public/wkbj.jpg";
        var title = json[1];
        var content = json[2];
        //var createTime = json[3];
        //var status = json[4];
        var type=json[3];
        var createTime = json[4];
        var status = json[6];
        var me = json[10];

        html = html + "						<tr>";
        html = html + "																<td>"+title+"</td>";
        html = html + "																<td>" +content+"</td>";
        html = html + "																<td>" +createTime+"</td>";
        //html = html + "																<td>" + createTime+ "</td>";
        //html = html + "																<td>" +status+"</td>";
        html=html+"														</tr>";
        //html上面几句删除了应有的分号
    };

	return {
		init: function() {
            initData();
           initChardiv();
		}
	}
}();//Page
/*================================================================================*/
