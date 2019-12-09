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
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-container-bg-solid">
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
				<%--<jsp:include page="../../home/frame/frame_page_header.jsp" flush="true">--%>
				<!-- BEGIN PAGE CONTENT-->
				<!-- ----------------------------------------页面开始，替换这里即可---------------------------------------- -->
				<div class="row">
					<div class="col-md-12">
						<div class="portlet box blue ">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-gift"></i><span id="title_div">记录显示</span>
								</div>
								<div class="tools">
									<a id="tools_menu_reload" href="" class="reload"> </a>
									<a id="tools_menu_remove" href="" class="remove"> </a>
								</div>
							</div>
							<div class="portlet-body form">
								<div class="form-horizontal" role="form" method="post" id="page_form" name="page_form" action="#">
									<input type="hidden" id="action" name="action" value="get_record" />
									<input type="hidden" id="id" name="id" value="<%=id%>" />
									<input type="hidden" id="exist_resultset" name="exist_resultset" value="<%=existResultset%>" />
									<div class="form-body">
										<div class="form-group">
											<div style="float: left; margin-bottom: 20px; margin-right: 10px; margin-left: 10px; margin-top: 10px;">
												<button type="button" id="add_button" class="btn green" title="添加新的记录">
													添加内容
												</button>
												</div>
												<div style="float: left; margin-bottom: 20px; margin-right: 10px; margin-left: 10px; margin-top: 10px;">
												<button type="button" id="search_button" class="btn green" title="设置 条件查询对应的记录">
													查询内容
												</button>
											</div>
											<div style="float: left; margin-bottom:20px; margin-right: 10px; margin-left: 10px; margin-top: 10px;">
												<button type="button" id="statistic_button" class="btn green" title="统计记录">
													统计内容
												</button>
												</div>
											<div style="float: left; margin-bottom: 20px; margin-right: 10px; margin-left: 10px; margin-top: 10px;">
												<button type="button" id="print_button" class="btn green" title="打印记录">
													打印调查信息
												</button>
												</div>
											<%--<div style="float: left; margin-bottom: 20px; margin-right: 20px; margin-left: 1px; margin-top: 10px;">--%>
												<%--<button type="button" id="print1_button" class="btn green" title="打印记录">--%>
													<%--打印统计图--%>
												<%--</button>--%>
											<%--</div>--%>

											<div style="float: left; margin-bottom: 20px; margin-right: 10px; margin-left: 10px; margin-top: 10px;">
												<button type="button" id="export_button" class="btn green" title="下载 记录">
													导出下载全部调查信息
												</button>
											</div>
											<div style="float: left; margin-bottom: 20px; margin-right: 10px; margin-left: 10px; margin-top: 10px;">
												<button type="button" id="return_button" class="btn green" title="返回到前一个页面">
													返回
												</button>
											</div>
											<div style="float: left; margin-bottom: 10px; margin-right: 10px; margin-left: 10px; margin-top: 10px;">
												<button type="button" id="layout_button" class="btn green" title="布局切换">
													<i class="fa fa-th-list"></i>
												</button>
												<button type="button" id="help_button" class="btn green" title="打印统计图">
													<%--<i class="fa fa-question"></i>--%>
													打印统计图
												</button>
											</div>
										</div>
											<div style="float: left; margin-bottom: 10px; margin-right: 10px; margin-left: 10px; margin-top: 0px;">
												<a href="../home/home1.jsp" >
													<button type="button"  class="btn yellow" title="创建问卷">
														<%--<i class="fa fa-question"></i>--%>
														问卷调查结果
													</button>
												</a>
												<a href="../addWJ/addWJ.jsp" >
													<button type="button"  class="btn yellow" title="创建问卷">
														<%--<i class="fa fa-question"></i>--%>
														问题创建
													</button>
												</a>
											</div>

                                  <br>
										<br>
										<br>
										<br>
										<div class="form-group">
											<label class="control-label col-md-2">排序</label>
											<div class="col-md-2">
												<select class="bs-select form-control" id="sort_01" onchange="Page.sortRecord(1);">
													<option value="">(第一级排序)</option>
													<option value="limit_time">按日期</option>
													<option value="title">按名称</option>
													<option value="status">按内容</option>
												</select>
											</div>
											<div class="col-md-2">
												<select class="bs-select form-control" id="sort_02" onchange="Page.sortRecord(2);">
													<option value="">（第二级排序）</option>
                                                    <option value="limit_time">按日期</option>
                                                    <option value="title">按名称</option>
                                                    <option value="status">按内容</option>
												</select>
											</div>
											<div class="col-md-2">
												<select class="bs-select form-control" id="sort_03" onchange="Page.sortRecord(3);">
													<option value="">（第三级排序）</option>
                                                    <option value="limit_time">按日期</option>
                                                    <option value="title">按名称</option>
                                                    <option value="status">按内容</option>
												</select>
											</div>
										</div>

									</div>
									<div>
									<div class="form-body">
										<div class="form-group">
											<label id="record_list_tip" class="col-md-12">
												记录列表
											</label>
										</div>
										<div class="row">
											<div class="col-md-12 col-sm-12">
												<div class="portlet grey-cascade box">
													<div class="portlet-body">
														<div class="table-responsive">
															<table class="table table-hover table-bordered table-striped">
																<thead>
																<tr>
																	<th>
																		民宿名称
																	</th>
																	<th>
																		简短评价
																	</th>
																	<th>
																		截止时间
																	</th>
																	<th>
																		调查备注（后台负责）
																	</th>
																	<th>
																		类型备注（后台负责）
																	</th>
																	<th>
																		操作
																	</th>
																</tr>
																</thead>
																<tbody id="record_list_div">
																</tbody>
															</table>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							   </div>
							</div>
						</div>
					</div>
				</div>


				<!-- ----------------------------------------页面结束，替换上面即可---------------------------------------- -->
				<!-- END PAGE CONTENT-->

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
<!-- BEGIN PAGE SCRIPTS -->
<script type="text/javascript" src="../../assets/module/scripts/project/forum/forum_list.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->