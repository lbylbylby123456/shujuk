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
	<link rel="stylesheet" type="text/css" href="../../assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />
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
						<div class="portlet box blue ">
							<div class="portlet-title">
								<div class="caption">
									<i class="fa fa-gift"></i>房源信息修改
								</div>
								<div class="tools">
									<a href="" class="reload"> </a>
									<a href="" class="remove"> </a>
								</div>
							</div>
							<div class="portlet-body form">
								<form class="form-horizontal" role="form" id="page_form" name="page_form" action="#">
									<input type="hidden" id="action" name="action" value="modify_record" />
									<input type="hidden" id="id" name="id" value="<%=id%>" />
									<input type="hidden" id="exist_resultset" name="exist_resultset" value="<%=existResultset%>" />
									<div class="form-body">
										<div class="form-group">
											<label class="col-md-3" id="record_list_tip">
											</label>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">
												民宿名称<font color="red">*</font>
											</label>
											<div class="col-md-9">
												<input type="text" id="name" name="name" class="form-control" placeholder="请填写名称" value="" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">
												地址<font color="red">*</font>
											</label>
											<div class="col-md-9">
												<input type="text" id="address" name="address" class="form-control" placeholder="请输入地址" value="" />
											</div>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">
												价格<font color="red">*</font>
											</label>
											<div class="col-md-9">
												<input type="text" id="price" name="price" class="form-control" placeholder="请输入价格" value="" />
											</div>
										</div>
									</div>

<!-- 
									<div class="form-actions right1">
										<button type="button" id="first_button" class="btn green" title="跳到首记录">
											第一个
										</button>
										<button type="button" id="prev_button" class="btn green" title="跳到前一个记录">
											前一个
										</button>
										<button type="button" id="next_button" class="btn green" title="跳到后一个记录">
											后一个
										</button>
										<button type="button" id="last_button" class="btn green" title="跳到最后一条记录">
											最后一个
										</button>
										<label class="btn red">注意：单页浏览设计得过于复杂难懂，仅作为进阶参考，初步入门可不管这个</label>
									</div>
 -->

									<div class="form-actions right1">
										<button type="button" id="submit_button" class="btn green" title="把修改好的信息提交到后台保存">
											提交修改
										</button>
										<button type="button" id="return_button" class="btn green">
											返回
										</button>
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
<script type="text/javascript" src="../../assets/global/plugins/bootstrap-daterangepicker/moment.min.js"></script>
<script type="text/javascript" src="../../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.min.js"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE SCRIPTS -->
<script src="../../assets/module/scripts/hm/hm_view.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
