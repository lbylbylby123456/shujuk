<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<!-- record_list.jsp查询所有数据，xxx_list.jsp查询自己的数据 -->
<%
	//做调试用，这里要在正式发布的时候去掉
	System.out.println("[" + (new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new java.util.Date()) + "]=======================调试：" + request.getServletPath() + "开始==============================");
%>
<%
	String id=request.getParameter("id");
	String existResultset=request.getParameter("exist_resultset");
%>
<!DOCTYPE html>
<input type="hidden" id="exist_resultset" name="exist_resultset" value="<%=existResultset %>" />
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
					<!-- BEGIN PAGE CONTENT-->
					<!-- ----------------------------------------页面开始，替换这里即可---------------------------------------- -->
					<div class="row">
						<div class="col-md-12">
							<!-- BEGIN EXAMPLE TABLE PORTLET-->
							<div class="portlet box grey-cascade">
								<div class="portlet-title">
									<div class="caption">
										<i class="fa fa-globe"></i>信息表
									</div>
									<div class="tools">
										<a href="javascript:" class="collapse"> </a>
										<a href="#portlet-config" data-toggle="modal" class="config"> </a>
										<a href="javascript:reload()" class="reload"> </a>
										<a href="javascript:remove()" class="remove"> </a>
									</div>
								</div>
								<div class="portlet-body">
									<div class="table-toolbar">
										<div class="row">
											<div class="col-md-6">
												<%--<div class="btn-group">--%>
													<%--&lt;%&ndash;<a id="add_button" class="btn green" href="record_add_div.jsp" data-target="#ajax" data-toggle="modal">添加新记录 <i class="fa fa-plus"></i> </a>&ndash;%&gt;--%>
														<%--<a id="add_button" class="btn green" href="forum_add.jsp" data-target="#ajax" data-toggle="modal">添加新记录 <i class="fa fa-plus"></i> </a>--%>
												<%--</div>--%>
												<div class="btn-group">
													<a id="search_button" class="btn green">查询记录 <i class="fa fa-search"></i> </a>
												</div>
												<%--<div class="btn-group">--%>
													<%--<a id="statistic_button" class="btn green">记录统计 <i class="fa fa-edit"></i> </a>--%>
												<%--</div>--%>


												<button type="button" id="layout_button" class="btn green" title="布局切换">
													<i class="fa fa-th"></i>
												</button>
														<%--<button type="button" id="return_button" class="btn green" title="返回到前一个页面">--%>
															<%--返回--%>
														<%--</button>--%>
											</div>
											<%--<div class="col-md-6" id="tool_button_div">--%>
												<%--<div class="btn-group pull-right">--%>
													<%--<button class="btn dropdown-toggle" data-toggle="dropdown">--%>
														<%--工具--%>
														<%--<i class="fa fa-angle-down"></i>--%>
													<%--</button>--%>
													<%--<ul class="dropdown-menu pull-right">--%>
														<%--<li>--%>
															<%--<a href="javascript:;">打印</a>--%>
														<%--</li>--%>
														<%--<li>--%>
															<%--<a href="javascript:;">导出成PDF</a>--%>
														<%--</li>--%>
														<%--<li>--%>
															<%--<a id="export_button">导出成Excel</a>--%>
														<%--</li>--%>
													<%--</ul>--%>
												<%--</div>--%>
											<%--</div>--%>
										</div>
									</div>
									<table class="table table-striped table-bordered table-hover datatable" id="record_list">
										<thead id="record_list_head">
										</thead>
									</table>
								</div>
							</div>
							<!-- END EXAMPLE TABLE PORTLET-->
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
<!-- BEGIN PAGE SCRIPTS -->
<script type="text/javascript" src="../../assets/module/scripts/questionary/forum/record_list.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->