jQuery(document).ready(function() {
	console.log("result.js:js初始化执行开始！");
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	QuickSidebar.init(); // init quick sidebar
	Demo.init(); // init demo features
	Frame.init(module,sub);
	Page.init();
	console.log("result.js:js初始化执行完毕！");
});
var module="article";
var sub="file";
/*================================================================================*/
//关于页面的控件生成等操作都放在Page里，和Record独立，Record主要是和记录集交互
var Page = function() {
	var handleReturnEvent=function(){
		$('#return_button').click(function() {
			var redirectUrl=$("#redirect_url").val();
			var redirectParam=$("#redirect_param").val();
			var redirectParamName=$("#redirect_param_name").val();
			if(redirectUrl!=null){
				if(redirectParamName!=undefined &&redirectParamName!=null){
					window.location.href=redirectUrl+"?"+redirectParamName+"="+redirectParam;
				}else{
					window.location.href=redirectUrl;
				}
			}
		});
		$('#download_button').click(function() {
			Page.download();
		});
	}
	var download=function(){
		var fileName=$("#fileName").val();
		//  console.log("dfsfdfsf:"+fileName);
		var bOk;
		bOk=confirm("下载需要消耗流量，请确定是否下载")
		if(fileName != "null" && bOk==true){
			var url = "../../upload/"+fileName;
			window.open(url);
		}
	};
	return {
		init: function() {
			handleReturnEvent();
		},
		download:function(){
			download();
		}
	}
}();//Page
/*================================================================================*/
