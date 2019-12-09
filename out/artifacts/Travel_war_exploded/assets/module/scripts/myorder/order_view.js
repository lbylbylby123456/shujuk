var module="myorder";
var sub="file";
jQuery(document).ready(function() {
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
	};
	var getRecord = function(){
		var id=$("#id").val();
		getRecordViewById(id);
	};
	var getRecordViewById = function(id){
		var url="../"+module+"_"+sub+"_servlet_action?action=get_record_view&id="+id;
		getRecordView(url);
	};
	var getRecordViewByIndex = function(index){
		var url="../"+module+"_"+sub+"_servlet_action?action=get_record_view&index="+index+"&exist_resultset=1";
		getRecordView(url);
	};
	var getRecordView = function(url){
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
		}).error(function(xhr,errorText,errorType){
	        alert('错误信息：'+errorText+",错误类型："+errorType);
	    });
	};
	var viewRecord=function(id){
		window.location.href="order_view.jsp?id="+id;
	};
	var deleteRecord = function(id){
		if(confirm("您确定要删除这条记录吗？")){
			if(id>-1){
				$.post("../"+module+"_"+sub+"_servlet_action?action=delete_record&id="+id,function(json){
					if(json.result_code==0){
						window.location.href="order_list.jsp";
						alert("已经从数据表删除该记录！");
					}
				})
			}
		}
	};
	var exportRecord=function(){
		window.location.href="../"+module+"_"+sub+"_servlet_action?action=export_record&exist_resultset=1";
	}
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
		}
	};
}();//Record;
/* ================================================================================ */
//关于页面的控件生成等操作都放在Page里，和Record独立，Record主要是和记录集交互
var Page = function() {
	var html="";
	var initPageStyle = function() {
        $('#begin_time').datetimepicker({
            Date:'yyyy-mm-dd',
            format: 'yyyy-mm-dd',
            language:'zh-CN',
            autoclose:true,
            minView:'month',
            maxView:1,
            todayBtn:'linked',
            showMeridian:false,
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
            showMeridian:false,
        }).on('changeDate',function(e){
            var endTime = e.date;
            $('#begin_time').datetimepicker('setEndDate',endTime);
        });
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
		$('#submit_button').click(function() {Page.submitRecord();});
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
        var orderType=json[2];
        var orderPrice=json[6];
        var beginTime=json[4];
        var endTime=json[5];
        var orderUser=json[7];
        var userConnect=json[8];
        var status=json[12];
		$("#orderType").val(orderType).disabled = true;
		$("#orderPrice").val(orderPrice).disabled = true;
		$("#begin_time").val(beginTime);
        $("#end_time").val(endTime);
        $("#orderUser").val(orderUser);
        $("#userConnect").val(userConnect);
        $("#status").val(status);
	};
	var help=function(){
		var strUrl=location.pathname;
		window.open('../../help/online/new_win_help.jsp?page_url='+strUrl, 'big', 'fullscreen=yes');
	}
	var submitRecord=function(){
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

        //if(orderPrice==null || orderPrice==""){
        //    window.alert("订单价格不能为空！");bOk=false;
        //}
		//else
		 if(orderUser==null || orderUser==""){
            window.alert("房客名不能为空！");bOk=false;
        }
		 else if(userConnect==null || userConnect=="")
		 {
            window.alert("联系方式不能为空！");bOk=false;
		 }
		 else if(beginTime==null || beginTime=="")
		 {
            window.alert("入住时间不能为空！");bOk=false;
        }
		 else if(endTime==null || endTime==""){
            window.alert("退房时间不能为空！");bOk=false;
        }
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
        window.location.href="order_view.jsp?id="+id;
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
		deleteRecord:function(id){
			deleteRecord(id);
		},
        findRecord:function(id){
            findRecord(id);
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
