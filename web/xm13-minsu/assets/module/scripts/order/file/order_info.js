var module="order";
var sub="file";
jQuery(document).ready(function() {
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	QuickSidebar.init(); // init quick sidebar
	Demo.init(); // init demo features
	ComponentsDropdowns.init();
	ComponentsPickers.init();	//这个本页面要编写对应的对象
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
    var list=new Array();
   // list info new list();
	var initRecordStyle = function() {
	};
	var initRecordList = function(){
		getRecord();
	}
	var getRecord = function(){
		var id=$("#id").val();
		getRecordViewById(id);
	}
	var getRecordViewById = function(id){
		var url="../../"+module+"_"+sub+"_servlet_action?action=get_record_view&id="+id+"&exist_resultset=1";
		getRecordView(url);
	}
	var getRecordViewByIndex = function(index){
		var url="../../"+module+"_"+sub+"_servlet_action?action=get_record_view&index="+index+"&exist_resultset=1";
		getRecordView(url);
	}
	var getRecordView = function(url){
		Metronic.startPageLoading({message: '正在查询中，请稍候...'});	//开始等待动画
		$.post(url,function(json){
			if(json.result_code==0){
				Record.userId=json.user_id;
				Record.userName=json.user_name;
				Record.firstId=json.first;
				Record.prevId=json.prev;
				Record.nextId=json.next;
				Record.lastId=json.last;
				Record.totalCount=json.total;
				Record.currentId=json.current_index;
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
		window.location.href="order_info.jsp?id="+id;
	};
	var deleteRecord = function(id){
		if(confirm("您确定要删除这条记录吗？")){
			if(id>-1){
				$.post("../../"+module+"_"+sub+"_servlet_action?action=delete_record&id="+id,function(json){
					if(json.result_code==0){
						window.location.href="order_list.jsp";
						alert("已经从数据表删除该记录！");
					}
				})
			}
		}
	};
    var getInfo=function(json){
        var orderType=json[2];
        var orderPrice=json[6];
        var beginTime=json[4];
        var endTime=json[5];
        var createTime=json[3];
        var orderUser=json[7];
        var userConnect=json[8];
        var orderID=json[1];
        var status=json[12];
        list[0]=orderID;//0
        list[1]=orderPrice;//1
        list[2]=orderType;//2
        list[3]=orderUser;//3
        list[4]=createTime;//4
        list[5]=beginTime;//5
        list[6]=endTime;//6
        list[7]=status;//7
        list[8]=userConnect;//8
    };
	var exportRecord=function(){
        //var id=json[0];
        var orderType=list[2];
        var orderPrice=list[1];
        var beginTime=list[5];
        var endTime=list[6];
        var createTime=list[4];
        var orderUser=list[3];
        var userConnect=list[8];
        var orderID=list[0];
        var status=list[7];
        var bOk;
        bOk=confirm("下载需消耗流量，确定是否下载");
        if(bOk==true) {
            window.location.href = "../../" + module + "_" + sub + "_servlet_action?action=download_record&orderType=" + orderType + "&orderPrice=" + orderPrice + "&orderUser=" + orderUser + "&begin_time=" + beginTime + "&end_time=" + endTime + "&create_time=" + createTime + "&orderID=" + orderID + "&status=" + status + "&userConnect=" + userConnect;
        }
        };
	var search=function(){
		page_form.submit();
	}
	var first=function(){
		getRecordViewByIndex(Record.firstId);
	}
	var prev=function(){
		getRecordViewByIndex(Record.prevId);
	}
	var next=function(){
		getRecordViewByIndex(Record.nextId);
	}
	var last=function(){
		getRecordViewByIndex(Record.lastId);
	}
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
		first:function(){first();},
		prev:function(){prev();},
		next:function(){next();},
		last:function(){last();},
		exportRecord:function(){
			exportRecord();
		},
		search:function(){
			search();
		},
        getInfo:function(json){
            getInfo(json);
        }
	};
}();//Record;
/* ================================================================================ */
//关于页面的控件生成等操作都放在Page里，和Record独立，Record主要是和记录集交互
var Page = function() {
	var html="";
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
		$('#export_button').click(function() {Page.exportRecord();});
		$('#first_button').click(function() {Page.first();});
		$('#prev_button').click(function() {Page.prev();});
		$('#next_button').click(function() {Page.next();});
		$('#last_button').click(function() {Page.last();});
        $('#modify_button').click(function() {Page.modifyRecord()});
        $('#print_button').click(function() {Page.printRecord();});
	};
	var addRecord=function(){
		window.location.href=sub+"_add.jsp";
	}
	var showResult=function(json){
		var title="记录显示";
		if($("#title_div")) $("#title_div").html(title);
		if(json!=null){
			var list=json.aaData;
			var tip="当前查询到了 "+list.length+" 条记录";
			tip=tip+"，现在是第 "+(parseInt(Record.currentId)+1)+" 条记录。";
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
	var showRecord = function(json){
        var id=json[0];
        var image="../../assets/module/img/public/wkbj.jpg";
        var orderType=json[2];
        var orderPrice=json[6];
        var beginTime=json[4];
        var endTime=json[5];
        var createTime=json[3];
        var orderUser=json[7];
        var userConnect=json[8];
        var orderID=json[1];
        var me=json[10];
        var status=json[12];
        html=html+"														<div style=\"clear:both;width:100%;margin-top:5px;border:0px solid blue;\">";
        html=html+"															<div style=\"float:left;border:0px solid green;\">";
        html=html+"																<img src=\""+image+"\" style=\"width:100px;height:auto;border-radius:50%!important;border:0px solid red;\">";
        html=html+"															</div>";
        html=html+"															<div style=\"display:table-cell;margin-left:10px;margin-right:10px;margin-top:10px;margin-bottom:10px;border:0px solid blue;\"><p>";
        html=html+"																<span>订单号："+orderID+"</span><p>";
        html=html+"																<span>房间类型："+orderType+"</span><p>";
        html=html+"																<span>订单创建时间："+createTime+"</span><p>";
        html=html+"																<span>入住时间："+beginTime+"</span><p>";
        html=html+"																<span>退房时间："+endTime+"</span><p>";
        html=html+"																<span>订单价格："+orderPrice+"</span><p>";
        html=html+"																<span>房客："+orderUser+"</span><p>";
        html=html+"																<span>联系方式："+userConnect+"</span><p>";
        html=html+"																<span>订单状态："+status+"</span><p>";
        Record.getInfo(json);
	};
	var help=function(){
		var strUrl=location.pathname;
		window.open('../../help/online/new_win_help.jsp?page_url='+strUrl, 'big', 'fullscreen=yes');
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
		id=$("#id").val();
		Record.deleteRecord(id);
	};
	var viewRecord=function(id){
		Record.viewRecord(id);
	};
	var modifyRecord=function(id){
		window.location.href="order_view.jsp?id="+id;
	};
	var searchRecord=function(){
		window.location.href="order_query.jsp";
	};
    var printRecord=function(){
        var id=$("#id").val();
       // console.log(id);
      //  window.alert(id);
      //  window.location.href="../../" + module + "_" + sub + "_servlet_action?action=get_record&id="+id;
        window.location.href="order_print.jsp?id="+id;
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
	};
    var findRecord=function(){
        window.location.href="order_info.jsp?id="+id;
    };
	var returnBack=function(){
        window.location.href="order_list.jsp";
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
        printRecord:function(){
            printRecord();
        },
		deleteRecord:function(id){
			deleteRecord(id);
		},
        findRecord:function(id){
            findRecord(id);
        },
		viewRecord:function(id){
			viewRecord(id);
		},
        modifyRecord:function(){
            var id=$("#id").val();
            modifyRecord(id);
            console.log("id is:"+id);
        },
		first:function(){Record.first();},
		prev:function(){Record.prev();},
		next:function(){Record.next();},
		last:function(){Record.last();},
		searchRecord:function(){
			searchRecord();
		},
		exportRecord:function(){
			Record.exportRecord();
		},
		reload:function(){
			window.location.reload();
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
