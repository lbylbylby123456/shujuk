var module="order";
var sub="file";
var existResultset="0";
jQuery(document).ready(function() {
	console.log("js初始化执行开始！");
	Metronic.init(); // init metronic core components
	Layout.init(); // init current layout
	QuickSidebar.init(); // init quick sidebar
	ComponentsDropdowns.init();
	Demo.init(); // init demo features
	Frame.init(module,sub);
	Page.init();
	Record.init();
	console.log("js初始化执行完毕！");
});
/* ================================================================================ */
var Record = function() {
	var userId;
	var userName;
	var recordCount=0;
	var html="";
	var initRecordListHeader = function() {
		var html="";
		html=html+"						<tr>";
		html=html+"							<th class=\"table-checkbox\"><input type=\"checkbox\" class=\"group-checkable\" data-set=\"#record_list .checkboxes\" /></th>";
		html=html+"							<th>订单号</th>";
		html=html+"							<th>房间类型</th>";
		html=html+"							<th>订单创建时间</th>";
		html=html+"							<th>入住时间</th>";
		html=html+"							<th>退房时间</th>";
		html=html+"							<th>订单价格</th>";
        html=html+"							<th>房客</th>";
        html=html+"							<th>联系方式</th>";
		html=html+"						</tr>";
		$("#record_list_head").html(html);
	};
	var initRecordList=function(){
     //   var id=document.getElementById("id").value;

		existResultset=$("#exist_resultset").val();
		$('.datatable').dataTable( {
			"paging":true,
			"searching":false,
			"oLanguage": {
				"aria": {
					"sortAscending": ": activate to sort column ascending",
					"sortDescending": ": activate to sort column descending"
				},
				"sProcessing":   "<img src='../../assets/module/img/public/loading.gif' />处理中...",
				"sLengthMenu":   "_MENU_ 记录/页",
				"sZeroRecords":  "<span style='color:red;'>没有找到对应的记录！</span>",
				"sInfo":         "显示第 _START_ 至 _END_ 项记录，共 _TOTAL_ 项",
				"sInfoEmpty":    "显示第 0 至 0 项记录，共 0 项",
				"sInfoFiltered": "(由 _MAX_ 项记录过滤)",
				"sInfoPostFix":  "",
				"sSearch":       "过滤:",
				"oPaginate": {
					"sFirst":    "首页",
					"sPrevious": "上页",
					"sNext":     "下页",
					"sLast":     "末页"
				}
			},
			"aoColumns": [{"mRender": function(data, type, full) {
                //alert(data);
						sReturn = '<div style="width:100px;"><input type="checkbox" class="checkboxes" value="'+data+'"/><a onclick=\"Page.modifyRecord('+data+')\"><span onclick=\"Page.modifyRecord()\" class=\"\" title="修改"><i class=\"icon-pencil\"></i></span></a><a href="javascript:Record.deleteRecord('+data+')"><span class=\"\" title="删除"><i class=\"icon-trash\"></i></span></a></div>';
						return sReturn;
					},"orderable": false
				},{},{},{},{},{},{},{},{}],
			"aLengthMenu": [[5,10,15,20,25,40,50,-1],[5,10,15,20,25,40,50,"所有记录"]],
			"fnDrawCallback": function(){$(".checkboxes").uniform();$(".group-checkable").uniform();},
			"fnServerData":function (sSource, aoData, fnCallback, oSettings) {
				$.ajax({
					"dataType": 'json',
					"type": "POST",
					"url": sSource,
					"data": aoData,
					"success": function(json){
						if(json.result_code==0){
							Record.userId=json.user_id;
							Record.userName=json.user_name;
							var list=json.aaData;
							if(list.length>0){
								Record.recordCount=list.length;
								//这里进行数据处理显示
								fnCallback(json);
							}else{}
						}else{
							Frame.processError(json);
						}
					}
				});
			},
			"sAjaxSource": "../../"+module+"_"+sub+"_servlet_action?action=get_record&exist_resultset="+existResultset
		});
		$('.datatable').find('.group-checkable').change(function () {
			var set = jQuery(this).attr("data-set");
			var checked = jQuery(this).is(":checked");
			jQuery(set).each(function () {
	            if (checked) {
	                $(this).attr("checked", true);
	                $(this).parents('tr').addClass("active");
	            } else {
	                $(this).attr("checked", false);
	                $(this).parents('tr').removeClass("active");
	            }
			});
			jQuery.uniform.update(set);
		});
		$('.datatable').on('change', 'tbody tr .checkboxes', function () {
			$(this).parents('tr').toggleClass("active");
		});
	}
	var addNew=function(){
        //var id=document.getElementById("id").value;
        //var orderType=encodeURI(document.getElementById("orderType").value);
        //var orderPrice=document.getElementById("orderPrice").value;
        //var type=encodeURI(document.getElementById("type").value);
        //var beginTime=document.getElementById("begin_time").value;
        //var endTime=document.getElementById("end_time").value;
        //var orderUser=encodeURI(document.getElementById("orderUser").value);
        //var user_id=encodeURI(document.getElementById("user_id").value);
        //var userConnect=document.getElementById("userConnect").value;
        //var create_time=document.getElementById("create_time").value;
        //var orderID=document.getElementById("orderID").value;
        //var url="../../"+module+"_"+sub+"_servlet_action?action=modify_record"+
         //   "&id="+id+"&orderType="+orderType+"&orderPrice="+orderPrice+"&type="+type+"&begin_time="+
         //   beginTime+"&end_time="+endTime+"&orderUser="+orderUser+"&user_id="+user_id+"&userConnect="+userConnect+"&create_time="+create_time+"&orderID="+orderID;
		//$.post(url,function(e){processAddRecordResult(e);}).error(function(XMLHttpRequest, textStatus, errorThrown){
		//	alert("addNew()发生错误："+XMLHttpRequest.status+","+XMLHttpRequest.readyState+","+textStatus);
		//})
        //alert("hhh");
        //window.location.href="order_add.jsp";
	}
	var processAddRecordResult=function(data){
		window.location.reload();
	}
	var deleteRecord=function(id){
		var selectedCount=0;
		if(id!=null){
			selectedCount=1;
			var url="../../"+module+"_"+sub+"_servlet_action?action=delete_record&id="+id;
		}else{
			var set = $('.datatable').find('.group-checkable').attr("data-set");
			var url="../../"+module+"_"+sub+"_servlet_action?action=delete_record";
			jQuery(set).each(function () {
				var checked = $(this).attr("checked");
		        if (checked) {
		        	var id=this.value;
		        	url=url+"&id="+id;
		            selectedCount++;
		        } else {
		        }
			});
		}
		if(selectedCount>0){
			var tip="";
			if(selectedCount==1){
				tip="您确定要删除这个记录吗？";
			}else{
				tip="您确定要删除这 "+selectedCount+" 条记录吗？";
			}
			if(confirm(tip)){
				$.post(url,function(e){processDeleteRecordResult(e);}).error(function(XMLHttpRequest, textStatus, errorThrown){
					alert("deleteRecord()发生错误："+XMLHttpRequest.status+","+XMLHttpRequest.readyState+","+textStatus);
				})
			}
		}
	}
	var processDeleteRecordResult=function(json){
		if(json.result_code==0){
			window.location.href="record_list.jsp";
		}
	}
	var showRecord=function(){
		var set = $('.datatable').find('.group-checkable').attr("data-set");
		var id=null;
		jQuery(set).each(function () {
			var checked = $(this).attr("checked");
	        if (checked) {
	        	id=this.value;
	        } else {
	        }
		});
		if(id!=null){
			showRecordById(id);
		}
	}
	var showRecordById=function(id){
		var url="../../"+module+"_"+sub+"_servlet_action?action=get_record_by_id&id="+id;
		$.post(url,function(e){processShowRecordById(e);}).error(function(XMLHttpRequest, textStatus, errorThrown){
			alert("processShowRecordById()发生错误："+XMLHttpRequest.status+","+XMLHttpRequest.readyState+","+textStatus);
		})
	}
	var processShowRecordById=function(data){
		data=eval("("+data+")");
		var list=data.aaData;
		document.getElementById("id").value=list[0][0];
        document.getElementById("orderID").value=list[0][1];
		document.getElementById("orderType").value=list[0][2];
        document.getElementById("create_time").value=list[0][3];
        document.getElementById("begin_time").value=list[0][4];
        document.getElementById("end_time").value=list[0][5];
		document.getElementById("orderPrice").value=list[0][6];
		document.getElementById("orderUser").value=list[0][7];
		document.getElementById("userConnect").value=list[0][8];
        document.getElementById("user_id").value=list[0][9];
	}
	var modifyRecord=function(id){
		//$("#record_modify_div").show();
      //  var id=document.getElementById("id").value;
        window.location.href="order_view.jsp?id="+id;
	}
	//var modifyRecord1=function(){
		//alert(1);
		//var id=document.getElementById("id").value;
		//var orderType=encodeURI(document.getElementById("orderType").value);
		//var orderPrice=document.getElementById("orderPrice").value;
		////var type=encodeURI(document.getElementById("type").value);
		//var beginTime=document.getElementById("begin_time").value;
		//var endTime=document.getElementById("end_time").value;
		//var orderUser=encodeURI(document.getElementById("orderUser").value);
		//var user_id=encodeURI(document.getElementById("user_id").value);
		//var userConnect=document.getElementById("userConnect").value;
		//var create_time=document.getElementById("create_time").value;
        //var orderID=document.getElementById("orderID").value;
		//var url="../../"+module+"_"+sub+"_servlet_action?action=modify_record"+
		//	"&id="+id+"&orderType="+orderType+"&orderPrice="+orderPrice+"&begin_time="+
		//	beginTime+"&end_time="+endTime+"&orderUser="+orderUser+"&user_id="+user_id+"&userConnect="+userConnect+"&create_time="+create_time+"&orderID="+orderID;
		//alert(url);
		//$.post(url,function(e){processModifyRecordResult(e);}).error(function(XMLHttpRequest, textStatus, errorThrown){
		//	alert("发生错误："+XMLHttpRequest.status+","+XMLHttpRequest.readyState+","+textStatus);
		//})
        //var id=document.getElementById("id").value;
        //window.location.href="order_view.jsp?id="+id;
	//}
	var processModifyRecordResult=function(data){
		var json=eval("("+data+")");
		if(checkSession(json)){
			window.location="../../../../../home/main/login.jsp";
		}
		if(json.result_code==0){
			window.location.reload();
		}
	}
	var clearTable=function(){
		$('.datatable').dataTable().fnClearTable();
	}
	var checkSession=function(json){
		var ok=true;
		if(json.result_code==3){
			ok=false;
		}
		return ok;
	}
	var reload=function(){
		window.location.reload();
	}
	return {
		init: function() {
			initRecordListHeader();
			initRecordList();
		},
		deleteRecord:function(id){
			deleteRecord(id);
		},
		addNew:function(){
			addNew();
		},
		modifyRecord:function(id){
			modifyRecord(id);
		},
		showRecord:function(){
			showRecord();
		}
	};
}();
/*================================================================================*/
var Page = function() {
	var layout=2;
   // var id=document.getElementById("id").value;
	var initPageStyle = function() {
		//hideFrameNav();
	};
	var hideFrameNav=function(){
		//根据需要隐藏掉一些不需要的面板
		//隐藏顶部菜单栏
		$("#page_top_div").hide();
		//隐藏旁边的菜单栏
		$("#page_sidebar_wrapper_div").hide();
		//隐藏page header
		$("#page_header_div").hide();
		//隐藏按钮工具
		$("#tool_button_div").hide();
		//隐藏掉风格板块
		$("#style_customizer_div").hide();
	};
	var handleButtonEvent=function(){
		$('#return_button').click(function() {Page.confirmBack();});
		$('#search_button').click(function() {Page.searchRecord();});
		$('#delete_button').click(function() {Page.deleteRecord();});
	    $('#add_button').click(function() {Page.addNew();});
		$('#submit_button').click(function() {Page.submitRecord();});
		$('#tools_menu_reload').click(function() {Page.reload();});
		$('#help_button').click(function() {Page.help();});
		$('#export_button').click(function() {Page.exportRecord();});
		$('#statistic_button').click(function() {Page.statisticRecord();});
		$('#layout_button').click(function() {Page.layoutRecord();});
	};
	var layoutRecord=function(){
		if(layout==1)
			window.location.href="record_list.jsp";
		if(layout==2)
			window.location.href="order_list.jsp";
	}
	var processError=function(json){
		Frame.processError(json);
	};
	var searchRecord=function(){
		window.location.href="order_query.jsp";
	};
    var modifyRecord=function(id){
        window.location.href="order_view.jsp?id="+id;
    }
    var statisticRecord=function(){
        window.location.href="order_statistic.jsp";
    };
    var addNew=function(){
        window.location.href="order_add.jsp";
    }
	return {
		init: function() {
			initPageStyle();
			handleButtonEvent();
		},
		searchRecord:function(){
			searchRecord();
		},
        addNew:function(){
            addNew();
        },
		layoutRecord:function(){
			layoutRecord();
		},
		processError:function(json){
			processError(json);
		},
        statisticRecord:function(){
            statisticRecord();
        },

        modifyRecord:function(id){
            modifyRecord(id);
        }
	}
}();
/*================================================================================*/
