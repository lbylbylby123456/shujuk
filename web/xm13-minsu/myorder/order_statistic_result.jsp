<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<%
    String statistic_type = request.getParameter("statistic_type");
    String content = request.getParameter("content");
    String time_interval = request.getParameter("time_interval");
    String time_from = request.getParameter("time_from");
    String time_to = request.getParameter("time_to");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>我的订单</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="../assets/index/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="../assets/index/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="../assets/index/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="../assets/index/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="../assets/index/img/apple-touch-icon-144x144-precomposed.png">

    <!-- BASE CSS -->
    <link href="../assets/index/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/index/css/style.css" rel="stylesheet">
	<link href="../assets/index/css/vendors.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="../assets/index/css/blog.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="../assets/index/css/custom.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-datetimepicker/css/bootstrap-datetimepicker.min.css" />
</head>

<body>
	<div id="page">
	<header class="header menu_fixed">
		            <div style="float: left;margin-top: 10px">
                <iframe scrolling="no" src="https://tianqiapi.com/api.php?style=ya&skin=pitaya&color=FF0000" frameborder="0" width="320" height="200" allowtransparency="true"></iframe>
            </div><a href="#menu" class="btn_mobile">
			<div class="hamburger hamburger--spin" id="hamburger">
				<div class="hamburger-box">
					<div class="hamburger-inner"></div>
				</div>
			</div>
		</a>
		<nav id="menu" class="main-menu">
			<ul>
				<li><span><a href="../index/index.jsp">首页</a></span>
				</li>
				<li><span><a href="../xm13-minsu/login/login3.jsp">我是房东</a></span>
				</li>
				<li><span><a href="#">个人中心</a></span>
					<ul>
						<li><a href="../person/person.jsp">个人信息</a></li>
						<li><a href="../myorder/order_list.jsp">我的订单</a></li>
						<li><a href="../album/album_list.jsp">照片墙</a></li>
                        <li><a href="../wl/main/index.jsp">心愿清单</a></li>
					</ul>
				</li>
                <li><span><a href="../questionary/main">发布评论</a></span>
                </li>
			</ul>
		</nav>	</header>
	<!-- /header -->


		<section class="hero_in tours">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>我的订单</h1>
				</div>
			</div>
		</section>
        <div class="container margin_60_35">
            <div style="margin-bottom: 20px;">
                <input type="button" class="btn_1 rounded" value="返回" onclick="javascript:history.back(-1);">
                <button  id="print_button" class="btn_1 rounded"> 打印</button>
                <button  id="export_button" class="btn_1 rounded"> 导出</button>
            </div>
            	<div class="portlet-body form">
								<form class="form-horizontal" role="form" method="post" id="page_form" name="page_form" action="#">
									<input type="hidden" id="action" name="action" value="statictic_record" />
									<input type="hidden" id="time_to" name="id" value="<%=time_to%>" />
									<input type="hidden" id="time_from" name="time_from" value="<%=time_from%>" />
                                    <input type="hidden" id="time_interval" name="id" value="<%=time_interval%>" />
                                    <input type="hidden" id="content" name="content" value="<%=content%>" />
                                    <input type="hidden" id="statistic_type" name="statistic_type" value="<%=statistic_type%>" />
                                    <div class="form-group">
                                        <div id="result_image_div">
                                            <div id="result_image" style="height: 228px;">
                                            </div>
                                        </div>
                                    </div>
                                    <div class="form-group" >
                                        <table class="table table-striped table-bordered table-hover datatable" id="record_list">
                                            <thead id="record_list_head">
                                            </thead>
                                            <div id="#record_list_div"></div>
                                        </table>
                                    </div>
								</form>
							</div>
        </div>
	</main>
	<!--/main-->
	</div>
	<!-- page -->
	<div id="toTop"></div><!-- Back to top button -->
</body>
</html>
<!-- COMMON SCRIPTS -->
<script src="../assets/index/js/jquery-2.2.4.min.js"></script>
<script src="../assets/index/js/common_scripts.js"></script>
<script src="../assets/index/js/main.js"></script>
<script src="../assets/index/assets/validate.js"></script>
<!-- INPUT QUANTITY  -->
<script type="text/javascript" src="../assets/global/scripts/metronic.js"></script>
<script type="text/javascript" src="../assets/global/plugins/uniform/jquery.uniform.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/datatables/media/js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="../assets/global/plugins/datatables/plugins/bootstrap/dataTables.bootstrap.js"></script>
<script type="text/javascript" src="../assets/global/scripts/datatable.js"></script>
<script type="text/javascript" src="../assets/global/plugins/bootstrap-datetimepicker/js/bootstrap-datetimepicker.js"></script>
<script type="text/javascript" src="../assets/module/scripts/myorder/statistic_result.js"></script>

<script src="../assets/global/plugins/amcharts/amcharts/amcharts.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/serial.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/pie.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/radar.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/themes/light.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/themes/patterns.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amcharts/themes/chalk.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/ammap/ammap.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/ammap/maps/js/worldLow.js" type="text/javascript"></script>
<script src="../assets/global/plugins/amcharts/amstockcharts/amstock.js" type="text/javascript"></script>