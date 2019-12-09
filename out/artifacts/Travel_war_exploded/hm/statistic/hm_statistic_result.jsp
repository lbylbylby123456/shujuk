<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<%
	//做调试用，这里要在正式发布的时候去掉
	System.out.println("[" + (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new java.util.Date()) + "]=======================调试：" + request.getServletPath() + "开始==============================");
%>
<%
	String id = request.getParameter("id");
	String existResultset = request.getParameter("exist_resultset");
%>
<!DOCTYPE html>
<head>
	<title>管理系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@include file="../../home/frame/frame_style.jsp"%>
	<!-- BEGIN PAGE LEVEL STYLES -->
	<!-- END PAGE LEVEL SCRIPTS -->
</head>
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-container-bg-solid" onload="getStatisticResult()">
	<%@include file="../../home/frame/frame_top.jsp"%>
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<%@include file="../../home/frame/frame_left.jsp"%>
		<div class="page-content-wrapper">
			<!-- BEGIN CONTENT -->
			<div class="page-content">
				<%@include file="../../home/frame/frame_portlet.jsp"%>
				<%@include file="../../home/frame/frame_theme_color.jsp"%>
				<%@include file="../../home/frame/frame_page_header.jsp"%>
				<!-- BEGIN PAGE CONTENT-->
				<!-- ----------------------------------------页面开始，替换这里即可---------------------------------------- -->
				<div class="row">
					<div class="col-md-12">
						<div class="portlet box blue ">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-gift"></i><span id="title_div">记录显示</span>
								</div>
								<div class="actions">
									<a href="javascript:Page.statisticQuery();" class="btn btn-default btn-sm">查询统计</a>
									<!-- <a href="javascript:Page.mapRecord();" class="btn btn-default btn-sm">地图查看</a> -->
									<a href="javascript:Record.exportRecord(1);" class="btn btn-default btn-sm">导出 </a>
									<a href="javascript:Page.printRecord();" class="btn btn-default btn-sm"><i class="fa fa-print"></i> 打印 </a>
									<a href="javascript:Page.help();" class="btn btn-default btn-sm"> <i class="fa fa-question"></i> 在线帮助 </a>
									<a href="javascript:Page.confirmBack();" class="btn btn-default btn-sm"> <i class="fa fa-return"></i> 返回 </a>
								</div>
							</div>
							<div class="portlet-body form">
								<form class="form-horizontal" role="form" method="post" id="page_form" name="page_form" action="#">
									<input type="hidden" id="action" name="action" value="get_record" />
									<input type="hidden" id="id" name="id" value="<%=id%>" />
									<input type="hidden" id="exist_resultset" name="exist_resultset" value="<%=existResultset%>" />
									<div class="form-group">
										<div class="col-md-12">
											<div class="tabbable-line boxless">
												<ul class="nav nav-tabs">
													<li class="active">
														<a href="#tab_1" data-toggle="tab"> 统计图 </a>
													</li>
													<li>
														<a href="#tab_2" data-toggle="tab"> 数据表 </a>
													</li>
												</ul>
												<div class="tab-content">
													<div class="tab-pane active" id="tab_1">
														<div id="result_image_div" style="height:500px">
															<%--<img id="result_image" name="result_image" src="" alt="统计结果图" style="width: 100%; height: 100%;" />--%>
														</div>
													</div>
													<div class="tab-pane" id="tab_2">
														<table class="table table-striped table-bordered table-hover datatable" id="record_list">
															<thead id="record_list_head">
															</thead>
															<div id="record_list_div"></div>
														</table>
													</div>
												</div>
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
				<!-- ----------------------------------------页面结束，替换上面即可---------------------------------------- -->
				<!-- END PAGE CONTENT-->
			</div>
			<!-- END CONTENT -->
			<%@include file="../../home/frame/frame_sidebar.jsp"%>
		</div>
		<!-- END CONTENT WRAPPER-->
	</div>
	<!-- END CONTAINER -->
	<%@include file="../../home/frame/frame_bottom.jsp"%>
	<%@include file="../../home/frame/frame_ajax_modal.jsp"%>
</body>
</html>
<%@include file="../../home/frame/frame_page_component.jsp"%>
<%@include file="../../home/frame/frame_javascript.jsp"%>
<!-- BEGIN PAGE LEVEL PLUGINS -->
<!-- END PAGE LEVEL PLUGINS -->

<script src="../../assets/global/plugins/flot/jquery.flot.min.js"></script>
<script src="../../assets/global/plugins/flot/jquery.flot.resize.min.js"></script>
<script src="../../assets/global/plugins/flot/jquery.flot.pie.min.js"></script>
<script src="../../assets/global/plugins/flot/jquery.flot.stack.min.js"></script>
<script src="../../assets/global/plugins/flot/jquery.flot.crosshair.min.js"></script>
<script src="../../assets/global/plugins/flot/jquery.flot.categories.min.js" type="text/javascript"></script>

<script src="../../assets/module/scripts/hm/statistic_result.js" type="text/javascript"></script>
<script src="../../assets/module/scripts/hm/echarts.min.js" type="text/javascript"></script>
<script>

	function updateTableList(){
		var action="get_statistic_record";
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
			destroy:true,
			"aoColumns": [{"mRender": function(data, type, full) {
				sReturn = '<input type="checkbox" class="checkboxes" value="'+data+'"/>';
				return sReturn;
			},"orderable": false
			},{},{},{},{}],
			"aLengthMenu": [[10,15,20,25,40,50,-1],[10,15,20,25,40,50,"所有记录"]],
			"fnDrawCallback": function(){$(".checkboxes").uniform();$(".group-checkable").uniform();},
			"fnServerData":function (sSource, aaData, fnCallback, oSettings) {
				$.ajax({
					"dataType": 'json',
					"type": "POST",
					"url": sSource,
					"data": aaData,
					"success": function(json){
						Metronic.stopPageLoading();	//停止等待动画
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
			"sAjaxSource":"../../HM_statistic_servlet_action?action="+action+"&exist_resultset=1"
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


	function showStatisticList(json){
		console.log("1111");
		updateTableList();
//		var list=json.aaData;
////		console
//		var html="";
//		html=html+"<ul>";
//		html=html+"序号----时间段----总数";
//		for(var i=0;i<list.length;i++){
//			html=html+"<li>"+list[i][0]+"----"+list[i][1]+","+list[i][2]+"，牌照颜色："+list[i][3]+"</li>";
//		}
//		html=html+"</ul>";
//		$("#record_list_div").html(html);
	}
	function showStatisticImage(list){
		//$("#result_image").attr("src","../../../"+imageFile+"?"+Math.random());
		var myChart = echarts.init(document.getElementById('result_image_div'))
		var cate = [];
		var stat = [];
		for(var i = 0; i < list.length; i++){
			cate.push(list[i][1]);
			stat.push(parseInt(list[i][2]));
		}

		console.log(cate);
		console.log(stat);

		option = {
			xAxis: {
				type: 'category',
				data: cate
			},
			yAxis: {
				type: 'value'
			},
			series: [{
				data: stat,
				type: 'bar'
			}]
		};
		myChart.setOption(option);
	}

	function getStatisticResult(){
		var action="get_statistic_record";
		var url="../../HM_statistic_servlet_action?action="+action+"&exist_resultset=1";
		$.post(url,function(json){
			console.log(JSON.stringify(json));
			if(json.result_code==0){
				var list=json.aaData;
				if(list!=null){
					showStatisticList(json);
					showStatisticImage(list);
				}
			}else{
				if(Page!=null){
					Page.processError(json);
				}
			}
		});
	}
</script>

<!-- END PAGE LEVEL SCRIPTS -->