<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<%
	//做调试用，这里要在正式发布的时候去掉
	System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new java.util.Date())+"]=======================调试："+request.getServletPath()+"开始==============================");
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
								<i class="fa fa-gift"></i>添加房源
							</div>
							<div class="tools">
								<a href="" class="reload"> </a>
								<a href="" class="remove"> </a>
							</div>
						</div>
						<div class="portlet-body form">
							<form class="form-horizontal" role="form" id="page_form" name="page_form" action="#">
								<input type="hidden" id="action" name="action" value="add_record"/>

								<input type="hidden" id="sel_prov" name="prov" value="#"/>
								<input type="hidden" id="sel_city" name="city" value="#"/>
								<input type="hidden" id="sel_district" name="district" value="#"/>

								<div class="form-body">
									<div class="form-group">
										<label class="col-md-3 control-label">民宿名称（必填）<font color="red">*</font></label>
										<div class="col-md-9">
											<input type="text" id="name" name="name" class="form-control" placeholder="请填写名称" value=""/>
										</div>
									</div>

									<div class="form-group">
										<label class="col-md-3 control-label">基本地址（必填）<font color="red">*</font></label>
										<div class="col-md-9">
											<select id="prov" onchange="showCity(this)">
												<option>=请选择省份=</option>

											</select>

											<!--城市选择-->
											<select id="city" onchange="showCountry(this)">
												<option>=请选择城市=</option>
											</select>

											<!--县区选择-->
											<select id="country" onchange="selecCountry(this)">
												<option>=请选择县区=</option>
											</select>
											<%--<input type="text" id="content" name="address" class="form-control" placeholder="请输入内容" value=""/>--%>
										</div>
									</div>


									<div class="form-group">
										<label class="col-md-3 control-label">地址（必填）<font color="red">*</font></label>
										<div class="col-md-9">
											<input type="text" id="address" name="address" class="form-control" placeholder="请输入内容" value=""/>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">价格（必填）<font color="red">*</font></label>
										<div class="col-md-9">
											<input type="text" id="price" name="price" class="form-control" placeholder="请输入内容" value=""/>
										</div>
									</div>
									<div style="text-align: center" class="form-group" >

										<div style="text-align: center" class="col-md-3" >
										<span>起始时间</span>
										<div class="input-group date form_datetime">
											<input type="text" id="time_from" name="time_from" size="10" class="form-control" readonly="true">
													<span class="input-group-btn">
														<button class="btn default date-set" type="button">
															<i class="fa fa-calendar"></i>
														</button> </span>
										</div>
										<span>结束时间</span>
										<div class="input-group date form_datetime">
											<input type="text" id="time_to" name="time_to" size="10" class="form-control" readonly="true">
													<span class="input-group-btn">
														<button class="btn default date-set" type="button">
															<i class="fa fa-calendar"></i>
														</button> </span>
										</div>

										</div>
									</div>
								</div>
								<div class="form-actions right1">
									<button type="button" id="search_button" class="btn green">
										查询记录
									</button>
									<button type="button" id="submit_button" class="btn green">
										添加记录
									</button>
									<button type="button" id="return_button" class="btn green">
										返回
									</button>
									<button type="button" id="help_button" class="btn green" title="在线帮助">
										<i class="fa fa-question"></i>
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
<script type="text/javascript" src="../../assets/module/scripts/hm/hm_add.js"></script>
<script type="text/javascript" src="../../assets/module/scripts/hm/city.js"></script>
<script type="text/javascript" src="../../assets/module/scripts/hm/method.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->
