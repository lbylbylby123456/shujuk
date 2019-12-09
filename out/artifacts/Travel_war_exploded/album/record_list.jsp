<%@page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.text.*"%>
<%
    String search=request.getParameter("search");
    String time_from=request.getParameter("time_from");
    String time_to=request.getParameter("time_to");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>照片墙</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="../assets/index/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="../assets/index/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="../assets/index/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="../assets/index/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="../assets/index/img/apple-touch-icon-144x144-precomposed.png">

    <link href="../assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <link href="../assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" type="text/css" href="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css"/>


    <!-- BASE CSS -->
    <link href="../assets/index/css/bootstrap.min.css" rel="stylesheet">
    <link href="../assets/index/css/style.css" rel="stylesheet">
	<link href="../assets/index/css/vendors.css" rel="stylesheet">

    <!-- SPECIFIC CSS -->
    <link href="../assets/index/css/blog.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="../assets/index/css/custom.css" rel="stylesheet">
    <style>
        .black_overlay{
            display: none;
            position: absolute;
            top: 0%;
            left: 0%;
            width: 100%;
            height: 100%;
            background-color: black;
            z-index:1001;
            -moz-opacity: 0.8;
            opacity:.80;
            filter: alpha(opacity=80);
        }
        .white_content {
            display: none;
            position: absolute;
            top: 15%;
            left: 35%;
            width: 40%;
            height: 30%;
            background-color: white;
            z-index:1002;
            overflow: auto;
        }
    </style>
</head>

<body>
<input type="hidden" id="search" name="search" value="<%=search%>" />
<input type="hidden" id="time_from" name="id" value="<%=time_from%>" />
<input type="hidden" id="time_to" name="id" value="<%=time_to%>" />
	<div id="page">
	<header class="header menu_fixed">
		            <div style="float: left;margin-top: 10px">
                <iframe scrolling="no" src="https://tianqiapi.com/api.php?style=ya&skin=pitaya&color=FF0000" frameborder="0" width="320" height="200" allowtransparency="true"></iframe>
            </div>
		<a href="#menu" class="btn_mobile">
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
                        <li><a href="../wl/main">心愿清单</a></li>
					</ul>
				</li>
                <li><span><a href="../questionary/main">发布评论</a></span>
                </li>
			</ul>
		</nav>

	</header>
	<!-- /header -->
	<main>
		<section class="hero_in general">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>照片墙</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->
		<div class="container margin_60_35">
            <div style="margin-bottom: 20px;">
            <button  id="print_button" class="btn_1 rounded"> 打印</button>
            <button  id="export_button" class="btn_1 rounded"> 导出</button>
                <input type="button" class="btn_1 rounded" value="返回" onclick="javascript:history.back(-1);">
            </div>
			<div class="row">
				<div class="col-lg-9" id="list">
				</div>
				<!-- /col -->
			</div>
			<!-- /row -->
		</div>
		<!-- /container -->
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

<%--<script type="text/javascript" src="../assets/global/plugins/fuelux/js/spinner.min.js"></script>--%>
<script type="text/javascript" src="../assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js"></script>
<%--<script type="text/javascript" src="../assets/global/plugins/jquery-inputmask/jquery.inputmask.bundle.min.js"></script>--%>
<%--<script type="text/javascript" src="../assets/global/plugins/jquery.input-ip-address-control-1.0.min.js"></script>--%>
<%--<script src="../assets/global/plugins/bootstrap-pwstrength/pwstrength-bootstrap.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/jquery-tags-input/jquery.tagsinput.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/bootstrap-touchspin/bootstrap.touchspin.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/typeahead/handlebars.min.js" type="text/javascript"></script>--%>
<%--<script src="../assets/global/plugins/typeahead/typeahead.bundle.min.js" type="text/javascript"></script>--%>
<%--<script type="text/javascript" src="../assets/global/plugins/ckeditor/ckeditor.js"></script>--%>


<script type="text/javascript" src="../assets/module/scripts/album/record_list.js"></script>
