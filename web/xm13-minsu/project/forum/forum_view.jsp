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
									<i class="fa fa-gift"></i>记录显示
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
										<%--<div class="form-group">--%>
											<%--<label class="col-md-3 control-label">--%>
												<%--项目名称--%>
											<%--</label>--%>
											<%--<div class="col-md-9">--%>
												<%--<select class="table-group-action-input form-control input-medium" id="project_id_select" name="project_id_select">--%>
													<%--<option value="1">--%>
														<%--（无）--%>
													<%--</option>--%>
												<%--</select>--%>
											<%--</div>--%>
										<%--</div>--%>
										<div class="form-group">
											<label class="col-md-3 control-label">
												民宿名称
											</label>
											<div class="col-md-3">
												<input type="text" onblur='fun1()' id="title" name="title" class="form-control" placeholder="请填写标题" value="" />
											</div>
											<font color="red">（可不填，若填写必填入格式为中文或英文的内容）</font>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">
												评价
											</label>
											<div class="col-md-5">
												<input type="text" onblur='fun2()' id="content" name="content" class="form-control" placeholder="请输入内容" value="" />
											</div>
											<font color="red">（可不填，若填写必填入格式为中文或英文的内容）</font>
										</div>
										<div class="form-group">
											<label class="col-md-3 control-label">
												限制完成时间
											</label>
											<div class="col-md-4">
												<div class="input-group date form_datetime">
													<input type="text" id="limit_time" name="limit_time" class="form-control" size="16" placeholder="请输入期限完成时间" value="" />
													<span class="input-group-btn">
														<button class="btn default date-set" type="button">
															<i class="fa fa-calendar"></i>
														</button> </span>
												</div>
											</div>之前（设定符合样例格式的且未超过当前时间的时刻）
										</div>
									</div>
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
<script src="../../assets/module/scripts/project/forum/forum_view.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script language=javascript>

	function fun1()
	{
		var c=document.getElementById('title').value;
		var regu = "^[a-zA-Z\u4e00-\u9fa5]+$";
		var re = new RegExp(regu);
		var temp=1;
		if (!re.test(c)&&temp==1) {
			alert("请正确输入中文或英文！");
			//confirm("请正确输入中文或英文！");
			document.getElementById('title').value='';
			temp=0;

		}
	}
	function fun2()
	{
		var c=document.getElementById('content').value;
		var regu = "^[a-zA-Z\u4e00-\u9fa5]+$";
		var re = new RegExp(regu);
		var temp=1;
		if (!re.test(c)&&temp==1) {
			alert("请正确输入中文或英文！");
			document.getElementById('content').value='';
			temp=0;

		}
	}

</script>