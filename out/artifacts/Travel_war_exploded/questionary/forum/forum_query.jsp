<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<%
	//做调试用，这里要在正式发布的时候去掉
	System.out.println("["+(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss")).format(new java.util.Date())+"]=======================调试："+request.getServletPath()+"开始==============================");
%>
<%
	String id=request.getParameter("id");
	String existResultset=request.getParameter("exist_resultset");
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
		<<%@include file="../../home/frame/frame_top.jsp"%>
		<div class="clearfix"></div>
		<!-- BEGIN CONTAINER -->
		<div class="page-container">
			<%--<%@include file="../../home/frame/frame_left.jsp"%>--%>
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
									<div class="tools">
										<a id="tools_menu_reload" href="" class="reload"> </a>
										<a id="tools_menu_remove" href="" class="remove"> </a>
									</div>
								</div>

								<div class="portlet-body form">

                                <header id="gtco-header" class="gtco-cover" role="banner"
										style="background-image: url(../../assets/module/img/forum/bg6.png);height: 400px;width:1200px;">
								</header>

									<form class="form-horizontal" role="form" method="post" id="page_form" name="page_form" action="#">
										<input type="hidden" id="action" name="action" value="get_record"/>
										<input type="hidden" id="id" name="id" value="<%=id %>"/>
										<input type="hidden" id="exist_resultset" name="exist_resultset" value="<%=existResultset %>"/>
										<div style="float:left;margin-bottom:10px;margin-right:10px;margin-left:10px;margin-top:10px;">
											<button type="button" id="search_button" class="btn green" title="设置 条件查询对应的记录">
												开始评论查询
											</button>
											<button type="button" id="return_button" class="btn green" title="返回到前一个页面">
												返回
											</button>
											<%--<button type="button" id="help_button" class="btn green" title="在线帮助">--%>
												<%--<i class="fa fa-question"></i>--%>
											<%--</button>--%>
										</div>
										<div class="form-body">
											<div class="form-group">
												<label id="page_title" class="col-md-12">
													请填写您需要查询的名称
												</label>
											</div>
											<div class="form-group">
												<label class="col-md-3 control-label">评论标题（支持不完全查询）</label>
												<div class="col-md-3">
													<input type="text"  onblur='fun1()' id="title" name="title" class="form-control" placeholder="请填写名称">
												</div>
												<font color="red">（可不填，若填写则填入内容必须为中文或英文）</font>
											</div>
											<div class="form-group">
												<label class="control-label col-md-1" style="display: none;">
													<input type="checkbox" class="icheck" id="record_select_all" name="record_select_all" data-checkbox="icheckbox_minimal-grey" style="border: 0px solid red; display: none;" />
												</label>
												<label class="control-label col-md-3">
													请选择发布的时间段（具体时间为每天的0点）<font color="red">*</font>
												</label>
												<div class="col-md-6">
													<%--<span>从（时间必须符合样例格式）</span>--%>
													<%--<div class="input-group date form_datetime">--%>
														<%--<input type="text" id="time_from" name="time_from" size="16" class="form-control" readonly="true">--%>
														<%--<span class="input-group-btn">--%>
															<%--<button class="btn default date-set" type="button">--%>
																<%--<i class="fa fa-calendar"></i>--%>
															<%--</button> </span>--%>
													<%--</div>--%>
													<%--<span>到（时间必须符合样例格式）</span>--%>
													<%--<div class="input-group date form_datetime">--%>
														<%--<input type="text" id="time_to" name="time_to" size="16" class="form-control" readonly="true">--%>
														<%--<span class="input-group-btn">--%>
															<%--<button class="btn default date-set" type="button">--%>
																<%--<i class="fa fa-calendar"></i>--%>
															<%--</button> </span>--%>
													<%--</div>--%>

																<span>从</span>
																<div>
																	<input type="text" id="time_from" name="time_from" size="16" class="form-control" readonly="true" >
																</div>
																<span>到</span>
																<div >
																	<input type="text" id="time_to" name="time_to" size="16" class="form-control" readonly="true"  >
																</div>
															</div>
														</div>
													<!--<button type="button" class="btn green-haze btn-circle btn-sm" id="today_button">今天</button>-->
													<!--<button type="button" class="btn green-haze btn-circle btn-sm" id="yestoday_button">昨天</button>-->
													<!--<button type="button" class="btn green-haze btn-circle btn-sm" id="before_yestoday_button">前天</button>-->
													<!--<button type="button" class="btn green-haze btn-circle btn-sm" id="month_button">本月</button>-->
													<!--<button type="button" class="btn green-haze btn-circle btn-sm" id="before_month_button">30天内</button>-->
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
<!-- BEGIN PAGE SCRIPTS -->
<script type="text/javascript" src="../../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script src="../../assets/module/scripts/questionary/forum/forum_query.js" type="text/javascript"></script>
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
		if(c==null || c==""){
			Frame.showMsg("内容为空则查出该时间段内全部问卷");bOk=false;
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