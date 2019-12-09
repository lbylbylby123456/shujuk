<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<%
	//做调试用，这里要在正式发布的时候去�?
%>
<%
	//如果之前有跳转页面，则跳转到指定的页面去
	String redirectUrl=null; 
	if(session.getAttribute("return_page")!=null){
		redirectUrl="../../"+(String)session.getAttribute("return_page");
		//然后删除掉原有的跳转
		session.removeAttribute("return_page");
		response.sendRedirect(redirectUrl);
	}
%>
<!DOCTYPE html>
<head>
	<title>管理系统</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta content="width=device-width, initial-scale=1" name="viewport" />
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<%@include file="../../home/frame/frame_style.jsp"%>
</head>
<body class="page-header-fixed page-quick-sidebar-over-content page-sidebar-closed-hide-logo page-container-bg-solid">
	<%@include file="../../home/frame/frame_top.jsp"%>
	<div class="clearfix"></div>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<%@include file="../../home/frame/frame_left.jsp"%>
		<!-- BEGIN CONTENT -->
		<div class="page-content-wrapper">
			<div class="page-content">
				<%@include file="../../home/frame/frame_javascript.jsp"%>
				<%@include file="../../home/frame/frame_portlet.jsp"%>
				<%@include file="../../home/frame/frame_theme_color.jsp"%>
				<%@include file="../../home/frame/frame_page_header.jsp"%>
				<!-- BEGIN PAGE CONTENT-->
				<div class="row">
					<div class="col-md-12">
						<div class="tabbable-line boxless">
							<div class="tab-content">
								<div class="tab-pane active" id="tab_1">
									<!-- BEGIN FILTER -->
									<div class="margin-top-10">
										<div class="row mix-grid" id="home_content_div"></div>
									</div>
									<!-- END FILTER -->
								</div>
							</div>
						</div>
					</div>
				</div>
				<!-- END PAGE CONTENT-->
			</div>
		</div>
		<!-- END CONTENT -->
		<%@include file="../../home/frame/frame_sidebar.jsp"%>
	</div>
	<!-- END CONTAINER -->
	<%@include file="../../home/frame/frame_bottom.jsp"%>
	<%@include file="../../home/frame/frame_ajax_modal.jsp"%>
</body>
</html>
<script src="../../assets/module/scripts/home/index.js" type="text/javascript"></script>