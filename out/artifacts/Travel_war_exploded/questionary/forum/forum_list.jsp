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
	<%--<%@include file="../../home/frame/frame_top.jsp"%>--%>
	<%--<div class="clearfix"></div>-改过-%>
	<!-- BEGIN CONTAINER -->
	<div class="page-container">
		<%@include file="../../home/frame/frame_left.jsp"%>
		<div class="page-content-wrapper">
			<!-- BEGIN CONTENT -->
			<%--<div class="page-content">--%>
				<%--<%@include file="../../home/frame/frame_portlet.jsp"%>--%>
				<%--<%@include file="../../home/frame/frame_theme_color.jsp"%>--%>
				<%--<%@include file="../../home/frame/frame_page_header.jsp"%>--%>
				<!-- BEGIN PAGE CONTENT-->
				<!-- ----------------------------------------页面开始，替换这里即可---------------------------------------- -->
				<div class="row">
					<div class="col-md-12">
						<div class="portlet box green ">
							<div class="portlet-title">
								<div class="caption">
									<span id="title_div">评价界面</span>
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
                                                <div class="col-lg-12 col-md-12 col-sm-6">
                                            <%--<header id="gtco-header" class="gtco-cover" role="banner"--%>
                                                    <%--style="float:start;background-image: url(../../assets/module/img/forum/bg6.png);">--%>
                                            <%--</header>--%>
                                                <figure>
                                                    <img src="../../assets/module/img/forum/bg7.png" alt="Image" class="img-responsive">
                                                </figure>
                                                </div>
                                            <br>
                                            <br>
                                            <br>
                                            <br>

                                            <div style="float: left; margin-bottom: 20px; margin-right: 20px; margin-left: 20px; margin-top: 50px;">
                                                <button type="button" id="search_button" class="btn yellow" title="设置 条件查询对应的记录">
                                                    查询评论
                                                </button>
                                            </div>
											<div style="float: left; margin-bottom:10px; margin-right: 10px; margin-left: 10px; margin-top: 50px;">
												<button type="button" id="statistic_button" class="btn yellow" title="统计记录">
													统计评论
												</button>
												</div>
											<div style="float: left; margin-bottom: 10px; margin-right: 10px; margin-left: 10px; margin-top: 50px;">
												<button type="button" id="print_button" class="btn yellow" title="打印记录">
													打印评论信息
												</button>
												</div>
											<%--<div style="float: left; margin-bottom: 20px; margin-right: 20px; margin-left: 1px; margin-top: 10px;">--%>
												<%--<button type="button" id="print1_button" class="btn yellow" title="打印记录">--%>
													<%--打印评论统计图--%>
												<%--</button>--%>
											<%--</div>--%>
											<div style="float: left; margin-bottom: 10px; margin-right: 10px; margin-left: 10px; margin-top: 50px;">
												<button type="button" id="export_button" class="btn yellow" title="导出 记录">
													导出下载评论信息
												</button>
											</div>
											<div style="float: left; margin-bottom: 10px; margin-right: 100px; margin-left: 10px; margin-top: 50px;">
												<button type="button" id="return_button" class="btn yellow" title="返回到前一个页面">
													返回
												</button>
												<%--<button type="button" id="layout_button" class="btn yellow" title="布局切换">--%>
													<%--<i class="fa fa-th-list"></i>--%>
												<%--</button>--%>
                                                <a href="forum_print1.jsp" >
												<button type="button"  class="btn yellow" title="打印统计图">
													<%--<i class="fa fa-question"></i>--%>

													打印评论统计图
												</button>
                                                </a>
                                            </div>
                                            <div style="float: left; margin-bottom: 20px; margin-right: 20px; margin-left: 150px; margin-top:50px;">
                                                <button type="button" id="add_button" class="btn green" title="添加新的记录">
                                                    添加评论
                                                </button>
                                            </div>
                                            <div style="float: left; margin-bottom: 10px; margin-right: 0px; margin-left: 20px; margin-top: 50px;">
                                                <a href="../home/home.jsp" >
                                                    <button  class="btn green" title="填写问卷">
                                                        <%--<i class="fa fa-question"></i>--%>
                                                        填写问卷
                                                    </button>

                                                    <%--<div class="fh5co-text">--%>
                                                        <%--<h2>民宿花港之家</h2>--%>
                                                    <%--</div>--%>
                                                </a>
                                            </div>

                                            <div>
                                                <div class="form-body">
                                                    <div class="form-group">
                                                        <label id="record_list_tip" class="col-md-12">
                                                            记录列表
                                                        </label>
                                                    </div>
                                                    <%--<div class="row">--%>
                                                    <div class="form-group">
                                                        <div class="col-md-13 col-sm-13">
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
                                                                                    操作
                                                                                </th>
                                                                            </tr>
                                                                            </thead>
                                                                            <tbody id="record_list_div">
                                                                            </tbody>
                                                                        </table>
                                                                        <div class="form-group">
                                                                            <button  class="btn blue" >
                                                                                排序
                                                                            </button>
                                                                            <div class="col-md-3">
                                                                                <select class="bs-select form-control" id="sort_01" onchange="Page.sortRecord(1);">
                                                                                    <option value="">(一级排序)</option>
                                                                                    <option value="limit_time">按日期</option>
                                                                                    <option value="title">按名称</option>
                                                                                    <option value="content">按评价内容</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="col-md-3">
                                                                                <select class="bs-select form-control" id="sort_02" onchange="Page.sortRecord(2);">
                                                                                    <option value="">（二级排序）</option>
                                                                                    <option value="limit_time">按日期</option>
                                                                                    <option value="title">按名称</option>
                                                                                    <option value="content">按评价内容</option>
                                                                                </select>
                                                                            </div>
                                                                            <div class="col-md-3">
                                                                                <select class="bs-select form-control" id="sort_03" onchange="Page.sortRecord(3);">
                                                                                    <option value="">（三级排序）</option>
                                                                                    <option value="limit_time">按日期</option>
                                                                                    <option value="title">按名称</option>
                                                                                    <option value="content">按评价内容</option>
                                                                                </select>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <br>
                                                                    <br>
                                                                    <div class="fh5co-text">
                                                                        <h2>评价介绍样例</h2>
                                                                    </div>
                                                                    <br>
                                                                    <br>
                                                                    <div class="row">
                                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                                            <a  class="fh5co-project-item">
                                                                                <figure>
                                                                                <div class="overlay">
                                                                                    <i class="ti-plus"></i>
                                                                                </div>
                                                                                <img src="../../assets/module/img/forum/h11.jpg" alt="Image" class="img-responsive">
                                                                            </figure>
                                                                                <div class="fh5co-text">
                                                                                    <h2>民宿花港之家</h2>
                                                                                    <p>内蒙古&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;100位旅客曾住过</p>
                                                                                </div>
                                                                            </a>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                                            <a  class="fh5co-project-item">
                                                                                <figure>
                                                                                    <div class="overlay">
                                                                                        <i class="ti-plus"></i>
                                                                                    </div>
                                                                                    <img src="../../assets/module/img/forum/h2.jpg" alt="Image" class="img-responsive">
                                                                                </figure>
                                                                                <div class="fh5co-text">
                                                                                    <h2>民宿成功之家</h2>
                                                                                    <p>山东&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;80位旅客曾住过</p>
                                                                                </div>
                                                                            </a>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                                            <a  class="fh5co-project-item">
                                                                                <figure>
                                                                                    <div class="overlay">
                                                                                        <i class="ti-plus"></i>
                                                                                    </div>
                                                                                    <img src="../../assets/module/img/forum/h3.png" alt="Image" class="img-responsive">
                                                                                </figure>
                                                                                <div class="fh5co-text">
                                                                                    <h2>民宿张伟之家</h2>
                                                                                    <p>广西&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;70位旅客曾住过</p>
                                                                                </div>
                                                                            </a>
                                                                        </div>

                                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                                            <a class="fh5co-project-item">
                                                                                <figure>
                                                                                    <div class="overlay">
                                                                                        <i class="ti-plus"></i>
                                                                                    </div>
                                                                                    <img src="../../assets/module/img/forum/h4.jpg" alt="Image" class="img-responsive">
                                                                                </figure>
                                                                                <div  class="fh5co-text">
                                                                                    <h2>民宿君栋之家</h2>
                                                                                    <p>河北&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;120位曾住过</p>
                                                                                </div>
                                                                            </a>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                                            <a  class="fh5co-project-item">
                                                                                <figure>
                                                                                    <div class="overlay">
                                                                                        <i class="ti-plus"></i>
                                                                                    </div>
                                                                                    <img src="../../assets/module/img/forum/h5.jpg" alt="Image" class="img-responsive">
                                                                                </figure>
                                                                                <div class="fh5co-text">
                                                                                    <h2>民宿98至尊</h2>
                                                                                    <p>四川&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;100位旅客曾住过</p>
                                                                                </div>
                                                                            </a>
                                                                        </div>
                                                                        <div class="col-lg-4 col-md-4 col-sm-6">
                                                                            <a  class="fh5co-project-item">
                                                                                <figure>
                                                                                    <div class="overlay">
                                                                                        <i class="ti-plus"></i>
                                                                                    </div>
                                                                                    <img src="../../assets/module/img/forum/h6.png" alt="Image" class="img-responsive">
                                                                                </figure>
                                                                                <div class="fh5co-text">
                                                                                    <h2>民宿海澜之家</h2>
                                                                                    <p>云南&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;60位旅客曾住过</p>
                                                                                </div>
                                                                            </a>
                                                                        </div>

                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>






									<%--<figure>--%>
										<%--<div class="overlay">--%>
											<%--<i class="ti-plus"></i>--%>
										<%--</div>--%>
										<%--<img src="../../assets/module/img/forum/h11.jpg" alt="Image" class="img-responsive">--%>
									<%--</figure>--%>



							   </div>


                        <div class="gtco-section border-bottom">
                            <div class="gtco-container">
                                <div class="row">
                                    <div class="col-md-8 col-md-offset-2 text-center gtco-heading">
                                        <p>民宿调查管理问卷，帮助用户发表意见、完善民宿系统</p>
                                    </div>
                                </div>

                            </div>
                        </div>
					</div>




				<!-- ----------------------------------------页面结束，替换上面即可---------------------------------------- -->
				<!-- END PAGE CONTENT-->

			<!-- END CONTENT -->
			<%@include file="../../home/frame/frame_sidebar.jsp"%>

		<!-- END CONTENT WRAPPER-->
	<%--</div>--%>
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
<script type="text/javascript" src="../../assets/module/scripts/questionary/forum/forum_list.js"></script>
<!-- END PAGE LEVEL SCRIPTS -->