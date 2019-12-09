var module="questionary";
var sub="forum";
jQuery(document).ready(function() {
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	QuickSidebar.init(); // init quick sidebar
	Demo.init(); // init demo features
	ComponentsDropdowns.init();
	Frame.init(module,sub);
	Page.init();
	Record.init();
});
/*================================================================================*/
var Record = function() {
	var userId=undefined;
	var userName=undefined;
	var userRole=undefined;
	var userAvatar=undefined;
	var initRecordStyle = function() {
	};
	var initRecordList = function(){
		getRecord();
	}
	var getRecord = function(){
		Metronic.startPageLoading({message: '正在查询中，请稍候...'});	//开始等待动画
		var id=$("#id").val();
		var existResultset=$("#exist_resultset").val();
		var url="../../"+module+"_"+sub+"_servlet_action?action=get_record&id="+id+"&exist_resultset="+existResultset;
		$.post(url,function(json){
			if(json.result_code==0){
				Record.userId=json.user_id;
				Record.userName=json.user_name;
				Record.userRole=json.user_role;
				Record.userAvatar=json.user_avatar;
				Page.showResult(json);
			}else{
				if(Page!=null){
					Page.processError(json);
				}
			}
			Metronic.stopPageLoading();	//停止等待动画
		}).error(function(xhr,errorText,errorType){
	        alert('错误信息：'+errorText+",错误类型："+errorType);
	    });
	};
	var viewRecord=function(id){
		window.location.href="forum_view.jsp?id="+id+"&exist_resultset=1";
	};
	var deleteRecord = function(id){
		if(confirm("您确定要删除这条记录吗？")){
			if(id>-1){
				$.post("../../"+module+"_"+sub+"_servlet_action?action=delete_record&id="+id,function(json){
					if(json.result_code==0){
						var count=json.count;
						var amount=json.amount;
						initRecordList();
						initRecordStyle();
						alert("已经从数据表删除该记录！");
					}
				})
			}
		}
	};
	var exportRecord1=function(){
		if(confirm("导出之前，必须在指定的分区创建对应的目录，否则导出会出错！\r\n请在导出前确保目录C:\\upload\\project\\export存在，如果没有就创建一个。\r\n请问条件符合了吗？")){
			window.location.href="../../"+module+"_"+sub+"_servlet_action?action=export_record&exist_resultset=1";
	//	window.location.href = "../../" + module + "_" + sub + "_servlet_action?action=download_record&exist_resultset=1";
		}
	};
	var exportRecord=function(){
		bOk=confirm("下载需消耗流量，确定是否下载");
		if(bOk==true) {
			//window.location.href="../../"+module+"_"+sub+"_servlet_action?action=download_record";
			window.location.href="../../"+module+"_"+sub+"_servlet_action?action=export_record";
		}
	};

	var sortRecord=function(index,sortName){
      //  console.log("hh"+index);
		var id=$("#id").val();
		var url="../../"+module+"_"+sub+"_servlet_action?action=get_record&id="+id+"&sort_index="+index+"&order_by="+sortName;
		$.post(url,function(json){
             console.log("返回的sortRecord"+JSON.stringify(json));
             Page.showResult(json);
		});
	};

	var search=function(){
		page_form.submit();
	};
	return {
		init: function() {
			initRecordList();
			initRecordStyle();
		},
		deleteRecord:function(id){
			deleteRecord(id);
		},
		viewRecord:function(id){
			viewRecord(id);
		},
		exportRecord:function(){
			exportRecord();
			//downloadRecord();
		},
		sortRecord:function(index,sortName){
			console.log("Record的sortRecord入口：索引："+index+",排序依据："+sortName);
			sortRecord(index,sortName);
		},
		search:function(){
			search();
		}
	};
}();//Record;
/* ================================================================================ */
//关于页面的控件生成等操作都放在Page里，和Record独立，Record主要是和记录集交互
var Page = function() {
	var html="";
	var layout=1;
	var initPageStyle = function() {
		hideFrameNav();
	};
	var hideFrameNav=function(){
		//根据需要隐藏掉一些不需要的面板
		//隐藏顶部菜单栏
		//$("#page_top_div").hide();
		//隐藏旁边的菜单栏
		//$("#page_sidebar_wrapper_div").hide();
		//隐藏风格设置栏
		$("#style_customizer_div").hide();
		//隐藏page header
		$("#page_header_div").hide();
		//隐藏page 底部
		$("#page_footer_div").hide();
		var displaySidebar=true;
		if(!displaySidebar){
			if($("body").hasClass("page-container-bg-solid")){
				$("body").removeClass("page-sidebar-closed-hide-logo page-container-bg-solid");
				$("body").addClass("page-full-width");
			}else{}
		}
		//隐藏提醒图标
		$("#header_inbox_bar").hide();
		$("#header_calendar_bar").hide();
	};
	var processError=function(json){
		if(Frame!=null)
			Frame.processError(json);
	};
	var handleButtonEvent=function(){
		$('#return_button').click(function() {Page.confirmBack();});
		$('#search_button').click(function() {Page.searchRecord();});
		$('#delete_button').click(function() {Page.deleteRecord();});
		$('#add_button').click(function() {Page.addRecord();});
		$('#submit_button').click(function() {Page.submitRecord();});
		$('#tools_menu_reload').click(function() {Page.reload();});
		$('#help_button').click(function() {Page.help();});
	//	$('#addWJ_button').click(function() {Page.addWJ();});
		$('#export_button').click(function() {Page.exportRecord();});
		$('#statistic_button').click(function() {Page.statisticRecord();});
		$('#layout_button').click(function() {Page.layoutRecord();});
		$('#print_button').click(function() {Page.printRecord();});
		//$('#write_button').click(function() {Page.writeRecord();});
	};
	var addRecord=function(){
		window.location.href=sub+"_add.jsp";
	}
    var addWJ=function(){
	window.location.href="../addWJ/addWJ.jsp";
    }

	var writeRecord=function(){
		window.location.href="../home/home.jsp";
	}

	var showResult=function(json){
		var title="记录显示";
		if($("#title_div")) $("#title_div").html(title);
		if(json!=null){
			var list=json.aaData;
			var tip="当前查询到了 "+list.length+" 条记录";
			if($("#tip_div")) $("#tip_div").html(tip);
			if($("#record_list_tip")) $("#record_list_tip").html(tip);
			showRecordList(list);
		}
	};
	var showRecordList=function(list){
		html="													<div><span id=\"tip_div\"></span>";
		for(var i=0;i<list.length;i++){
			showRecord(list[i]);
		}
		html=html+"													</div>";
		$("#record_list_div").html(html);
	};


	var showRecord = function(json) {
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
		html = html + "																<td>" + createTime+ "</td>";
		//html = html + "																<td>" +type+ "</td>";
		//html = html + "																<td>" +status+ "</td>";
		//if (me == "1")
		//{
		//	html = html + "													<td><div><button  type=\"button\" class=\"btn red\" onclick=\"Page.deleteRecord(" + id + ");\">删除</button>";
		//	html = html + "													<button  type=\"button\" class=\"btn blue\" onclick=\"Page.modifyRecord(" + id + ");\">修改</button>";
		//}
		//html = html + "														<button  type=\"button\" class=\"btn green\" onclick=\"Page.viewRecord(" + id + ");\">详细信息</button>";
		//html = html+"                                                        </td>";
		//html = html + "														</td>";
		//html = html + "						</tr>";
		//html=html+"                                             <td><div onclick=\"Page.deleteRecord("+id+")\" class=\"btn btn-xs purple\"> 删除<i onclick=\"Page.deleteRecord("+id+")\" class=\"fa fa-trash-o\"></i></div>";
		//html=html+"                      <div onclick=\"Page.modifyRecord("+id+")\" class=\"btn btn-xs green\">修改 <i onclick=\"Page.modifyRecord("+id+")\" class=\"fa fa-edit\"></i></div>";
		html=html+"                      <td> <div onclick=\"Page.viewRecord("+id+")\" class=\"btn btn-xs yellow\">查看 <i onclick=\"Page.viewRecord("+id+")\" class=\"fa fa-search\"></i></div>";
		html=html+"                          </td>";
		html=html+"														</tr>";
        //html上面几句删除了应有的分号

	}
	var help=function(){
		var strUrl=location.pathname;
		window.open('../forumguest/forum_print1.jsp?page_url='+strUrl, 'big', 'fullscreen=yes');
	}
	var submitRecord=function(){
		if(checkInput()==true){
			page_form.action="../../"+module+"_"+sub+"_servlet_action";
			page_form.submit();
		}
	};
	var checkInput=function(){
		var bOk=true;
		var action=$("#action").val();
		if(action==null || action==""){Frame.showMsg("名称不能为空！");bOk=false;};
		return bOk;
	};
	var deleteRecord=function(id){
		Record.deleteRecord(id);
	};
	var viewRecord=function(id){
		Record.viewRecord(id);
	};
	var modifyRecord=function(id){
		window.location.href="forum_view.jsp?id="+id;
	};
	var searchRecord=function(){
		window.location.href="forum_query.jsp";
	};
	var statisticRecord=function(){
		window.location.href="forum_statistic.jsp";
	}
	var layoutRecord=function(){
		if(layout==1)
			window.location.href="record_list.jsp";
		if(layout==2)
			window.location.href="forum_list.jsp";
	}
	var printRecord=function(){
		window.location.href="forum_print.jsp?exist_resultset=1";
	};
	var sortRecord=function(index){
		console.log(index);
		var sortName=undefined;
		if(index==1)sortName=$("#sort_01").val();
		if(index==2)sortName=$("#sort_01").val()+','+$("#sort_02").val();
		if(index==3)sortName=$("#sort_01").val()+','+$("#sort_02").val()+','+$("#sort_03").val();
		Record.sortRecord(index,sortName);
	};
	var confirmBack=function(){
		DraggableDialog.setId("confirm_back");
		DraggableDialog.setCancel(Page.onCancel);
		DraggableDialog.setButtonTitle("确定","取消");
		DraggableDialog.setOk(Page.returnBack);
		DraggableDialog.showMsg("确定要返回上一页吗？","提示");
	};
	var onCancel=function(){
		DraggableDialog.close();
	}
	var returnBack=function(){
		history.go(-1);
	};
	return {
		init: function() {
			initPageStyle();
			handleButtonEvent();
		},
		processError:function(json){
			processError(json);
		},
		showResult:function(json){
			showResult(json);
		},
		showRecordList:function(list){
			showRecordList(list);
		},
		submitRecord:function(){
			submitRecord();
		},
		addRecord:function(){
			addRecord();
		},
		//writeRecord:function(){
		//	writeRecord();
		//},
		deleteRecord:function(id){
			deleteRecord(id);
		},
		viewRecord:function(id){
			viewRecord(id);
		},
		searchRecord:function(){
			searchRecord();
		},
		exportRecord:function(){
			Record.exportRecord();
		},
		statisticRecord:function(){
			statisticRecord();
		},
		printRecord:function(){
			printRecord();
		},
		//print1Record:function(){
		//	print1Record();
		//},
		modifyRecord:function(id){
			modifyRecord(id);
		},
		reload:function(){
			window.location.reload();
		},
		layoutRecord:function(){
			layoutRecord();
		},
		sortRecord:function(index) {
			sortRecord(index);
		},
		confirmBack:function(){
			confirmBack();
		},
		returnBack:function(){
			returnBack();
		},
		onCancel:function(){
			onCancel();
		},
		help:function(){
			help();
		}
	}
}();//Page
/*================================================================================*/
