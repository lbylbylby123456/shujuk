<%@page contentType="text/html; charset=UTF-8"%>
<%@page import="java.text.*"%>
<%
//	String Content = (String) session.getAttribute("content");
//	String id = request.getParameter("id");
//	String price =request.getParameter("price");
	String Msg = request.getParameter("result_msg");
%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>添加订单结果</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="../assets/index/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="../assets/index/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="../assets/index/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="../assets/index/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="../assets/index/img/apple-touch-icon-144x144-precomposed.png">

    <!-- BASE CSS -->
    <link href="../assets/index/css/bootstrap.min.css" rel="stylesheet">
	<link href="../assets/index/css/bootstrap-select.min.css" rel="stylesheet">
	<link href="../assets/index/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<link href="../assets/index/css/style.css" rel="stylesheet">
	<link href="../assets/index/css/vendors.css" rel="stylesheet">

    <!-- YOUR CUSTOM CSS -->
    <link href="../assets/index/css/custom.css" rel="stylesheet">

</head>

<body>
	<%--<input type="hidden" id="search_content" value="<%=Content%>">--%>
	<div id="page">
		
	<header class="header menu_fixed">
		            <div style="float: left;margin-top: 10px">
                <iframe scrolling="no" src="https://tianqiapi.com/api.php?style=ya&skin=pitaya&color=FF0000" frameborder="0" width="320" height="200" allowtransparency="true"></iframe>
            </div>	
		<!-- /top_menu -->
		<a href="#menu" class="btn_mobile">
			<div class="hamburger hamburger--spin" id="hamburger">
				<div class="hamburger-box">
					<div class="hamburger-inner"></div>
				</div>
			</div>
		</a>
		<nav id="menu" class="main-menu">
			<ul>
				<li><span><a href="index.jsp">首页</a></span>
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
		</nav>

	</header>
	<!-- /header -->
	
	<main>
		
		<section class="hero_in tours">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>添加订单结果</h1>
				</div>
			</div>
		</section>
		<!--/hero_in-->
		
		<%--<div class="filters_listing sticky_horizontal">--%>
			<%--<div class="container">--%>
				<%--<ul class="clearfix">--%>
					<%--<li>--%>
						<%--<div class="switch-field">--%>
							<%--<input type="radio" id="all" name="listing_filter" value="all">--%>
							<%--<label for="all">All</label>--%>
							<%--<input type="radio" id="popular" name="listing_filter" value="popular">--%>
							<%--<label for="popular">Popular</label>--%>
							<%--<input type="radio" id="latest" name="listing_filter" value="latest">--%>
							<%--<label for="latest">Latest</label>--%>
						<%--</div>--%>
					<%--</li>--%>
					<%--<li>--%>
						<%--<div class="layout_view">--%>
							<%--<a href="tours-grid-isotope.html"><i class="icon-th"></i></a>--%>
							<%--<a href="#0" class="active"><i class="icon-th-list"></i></a>--%>
						<%--</div>--%>
					<%--</li>--%>
					<%--<li>--%>
						<%--<a class="btn_map" data-toggle="collapse" href="#collapseMap" aria-expanded="false" aria-controls="collapseMap" data-text-swap="Hide map" data-text-original="View on map">View on map</a>--%>
					<%--</li>--%>
				<%--</ul>--%>
			<%--</div>--%>
			<%--<!-- /container -->--%>
		<%--</div>--%>
		<!-- /filters -->
		<%----%>
		<%--<div class="collapse" id="collapseMap">--%>
			<%--<div id="map" class="map"></div>--%>
		<%--</div>--%>
		<!-- End Map -->


		<div id="add_content" class="container margin_60_35">
			<div style="text-align: center">
				<h3><%=Msg%></h3>
			</div>
			<div style="text-align: right;">
				<a href="./house_list.jsp" role="button" class="btn btn-warning">返回</a>
			</div>
		</div>
		<!-- /container -->
		<%--<div class="bg_color_1">--%>
			<%--<div class="container margin_60_35">--%>
				<%--<div class="row">--%>
					<%--<div class="col-md-4">--%>
						<%--<a href="#0" class="boxed_list">--%>
							<%--<i class="pe-7s-help2"></i>--%>
							<%--<h4>Need Help? Contact us</h4>--%>
							<%--<p>Cum appareat maiestatis interpretaris et, et sit.</p>--%>
						<%--</a>--%>
					<%--</div>--%>
					<%--<div class="col-md-4">--%>
						<%--<a href="#0" class="boxed_list">--%>
							<%--<i class="pe-7s-wallet"></i>--%>
							<%--<h4>Payments and Refunds</h4>--%>
							<%--<p>Qui ea nemore eruditi, magna prima possit eu mei.</p>--%>
						<%--</a>--%>
					<%--</div>--%>
					<%--<div class="col-md-4">--%>
						<%--<a href="#0" class="boxed_list">--%>
							<%--<i class="pe-7s-note2"></i>--%>
							<%--<h4>Quality Standards</h4>--%>
							<%--<p>Hinc vituperata sed ut, pro laudem nonumes ex.</p>--%>
						<%--</a>--%>
					<%--</div>--%>
				<%--</div>--%>
				<%--<!-- /row -->--%>
			<%--</div>--%>
			<%--<!-- /container -->--%>
		<%--</div>--%>
		<!-- /bg_color_1 -->
	</main>
	<!--/main-->

		<footer>
			<div class="container margin_60_35">

				<!--/row-->
				<%--<hr>--%>
				<div class="row">
					<div class="col-xl-4 m-auto" style="text-align: center">
						<ul id="additional_links">
							<li>Terms and conditions</li>
							<li>Privacy</li>
							<li><span>© 2019 Minsu13</span></li>
						</ul>
					</div>
				</div>
			</div>
		</footer>
	<!--/footer-->
	</div>
	<!-- page -->
	
	<!-- Sign In Popup -->
	<div id="sign-in-dialog" class="zoom-anim-dialog mfp-hide">
		<div class="small-dialog-header">
			<h3>Sign In</h3>
		</div>
		<form>
			<div class="sign-in-wrapper">
				<a href="#0" class="social_bt facebook">Login with Facebook</a>
				<a href="#0" class="social_bt google">Login with Google</a>
				<div class="divider"><span>Or</span></div>
				<div class="form-group">
					<label>Email</label>
					<input type="email" class="form-control" name="email" id="email">
					<i class="icon_mail_alt"></i>
				</div>
				<div class="form-group">
					<label>Password</label>
					<input type="password" class="form-control" name="password" id="password" value="">
					<i class="icon_lock_alt"></i>
				</div>
				<div class="clearfix add_bottom_15">
					<div class="checkboxes float-left">
						<label class="container_check">Remember me
						  <input type="checkbox">
						  <span class="checkmark"></span>
						</label>
					</div>
					<div class="float-right mt-1"><a id="forgot" href="javascript:void(0);">Forgot Password?</a></div>
				</div>
				<div class="text-center"><input type="submit" value="Log In" class="btn_1 full-width"></div>
				<div class="text-center">
					Don’t have an account? <a href="register.html">Sign up</a>
				</div>
				<div id="forgot_pw">
					<div class="form-group">
						<label>Please confirm login email below</label>
						<input type="email" class="form-control" name="email_forgot" id="email_forgot">
						<i class="icon_mail_alt"></i>
					</div>
					<p>You will receive an email containing a link allowing you to reset your password to a new preferred one.</p>
					<div class="text-center"><input type="submit" value="Reset Password" class="btn_1"></div>
				</div>
			</div>
		</form>
		<!--form -->
	</div>
	<!-- /Sign In Popup -->
	
	<div id="toTop"></div><!-- Back to top button -->
	
	<!-- COMMON SCRIPTS -->
    <script src="../assets/index/js/jquery-2.2.4.min.js"></script>
    <script src="../assets/index/js/common_scripts.js"></script>
    <script src="../assets/index/js/main.js"></script>
	<script src="../assets/index/js/bootstrap-select.min.js"></script>
	<script src="../assets/index/assets/validate.js"></script>
	
	<!-- Map -->
	<%--<script src="http://maps.googleapis.com/maps/api/js"></script>--%>
	<script src="../assets/index/js/markerclusterer.js"></script>
	<script src="../assets/index/js/map_tours.js"></script>
	<%--<script src="../assets/index/js/infobox.js"></script>--%>
	<script src="../assets/index/js/bootstrap-datetimepicker.js"></script>
	<%--<script src="../assets/module/scripts/hs/add_to_order.js"></script>--%>
</body>
</html>