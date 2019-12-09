<%@page contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@page import="java.text.*"%>
<%@ page import="java.util.Date" %>
<%@ page import="com.sun.org.apache.xerces.internal.impl.dv.xs.DateDV" %>
<%
//	String Dates=request.getParameter("dates");
//	String Adult = request.getParameter("AdultInput");
//	String Child = request.getParameter("ChildInput");
	String Content = request.getParameter("content");
//	System.out.println(Dates+" "+Adult+" " +Child+" "+Content);
//	if(Dates=="" || Dates == null||Adult=="" || Adult == null||Child=="" || Child == null||Content =="" || Content == null){
	if(Content == ""|| Content == null){
			;
	}
	else{
		String spliter = ">";
//		String[] D = Dates.split(spliter);
//		String DateFrom = D[0];
//		String DateTo = D[1];
//		System.out.println(D.length);
//		String DateFrom = "";
//
//		String DateTo = "";
		session.setAttribute("content",Content);

		response.setCharacterEncoding("UTF-8");
		response.setContentType("text/html; charset=UTF-8");
		response.sendRedirect("house_list.jsp");
	}
//	if()
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>民宿旅游平台</title>

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

    <!-- YOUR CUSTOM CSS -->
    <link href="../assets/index/css/custom.css" rel="stylesheet">
</head>
<style>
	.x{
		text-align: center;
	}
	.fh5co-text
	{
		text-align: center;
	}
</style>

<body>
		
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
		<section class="hero_single version_2">
			<div class="wrapper">
				<div class="container">
					<h3>民宿旅游平台</h3>
					<form>
						<%--<div class="row no-gutters custom-search-input-2">--%>
							<%--<div class="col-lg-8">--%>
								<%--<div class="form-group">--%>
									<%--<input class="form-control" type="text" name="content" placeholder="目的地城市">--%>
									<%--<i class="icon_pin_alt"></i>--%>
								<%--</div>--%>
							<%--</div>--%>
							<%--&lt;%&ndash;<div class="col-lg-3">&ndash;%&gt;--%>
								<%--&lt;%&ndash;<div class="form-group">&ndash;%&gt;--%>
									<%--&lt;%&ndash;<input class="form-control" type="text" name="dates" placeholder="When.." autocomplete="off">&ndash;%&gt;--%>
									<%--&lt;%&ndash;<i class="icon_calendar"></i>&ndash;%&gt;--%>
								<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
							<%--&lt;%&ndash;<div class="col-lg-3">&ndash;%&gt;--%>
								<%--&lt;%&ndash;<div class="panel-dropdown">&ndash;%&gt;--%>
									<%--&lt;%&ndash;<a href="#">Guests <span class="qtyTotal">1</span></a>&ndash;%&gt;--%>
									<%--&lt;%&ndash;<div class="panel-dropdown-content">&ndash;%&gt;--%>
										<%--&lt;%&ndash;<!-- Quantity Buttons -->&ndash;%&gt;--%>
										<%--&lt;%&ndash;<div class="qtyButtons">&ndash;%&gt;--%>
											<%--&lt;%&ndash;<label>Adults</label>&ndash;%&gt;--%>
											<%--&lt;%&ndash;<input type="text" name="AdultInput" value="1">&ndash;%&gt;--%>
										<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
										<%--&lt;%&ndash;<div class="qtyButtons">&ndash;%&gt;--%>
											<%--&lt;%&ndash;<label>Childrens</label>&ndash;%&gt;--%>
											<%--&lt;%&ndash;<input type="text" name="ChildInput" value="0">&ndash;%&gt;--%>
										<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
									<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
								<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
							<%--&lt;%&ndash;</div>&ndash;%&gt;--%>
							<%--<div class="col-lg-2">--%>
								<%--<input id="search_button" type="submit" class="btn_search" value="Search">--%>
							<%--</div>--%>

						<%--<!-- /row -->--%>
							<%--&lt;%&ndash;<input id="time_from" type="text"  value="起始时间" readonly="true" name="time_from" >&ndash;%&gt;--%>
							<%--&lt;%&ndash;<i class="icon_calendar"></i>&ndash;%&gt;--%>
						    <%--&lt;%&ndash;<input id="time_to"  type="text"  value="结束时间" readonly="true" name="time_to" >&ndash;%&gt;--%>
						<%--</div>--%>
						<div class="row no-gutters custom-search-input-2">
							<div class="col-lg-6">
								<div class="form-group">
									<input class="form-control" type="text" name="content" placeholder="目的地城市">
									<i class="icon_pin_alt"></i>
								</div>
							</div>

							<div class="col-lg-4">
							<div class="form-group">
							<input class="form-control" type="text" name="dates" placeholder="入住时间" autocomplete="off">
							<i class="icon_calendar"></i>
							</div>
							</div>

							<div class="col-lg-2">
								<input id="search_button" type="submit" class="btn_search" value="Search"/>
							</div>
						</div>
					</form>
					<%--<input type="text"  id="time_from" name="time_from" size="10" class="form-control" value="" readonly="true" > &nbsp;&nbsp;&nbsp;&nbsp;--%>
				</div>
			</div>

			<!-- /hero_single -->

		</section>
		<!--/call_section-->
	</main>
	<!-- /main -->

		<div class="row">
			<div class="col-lg-4 col-md-4 col-sm-6">
				<%--<a  class="fh5co-project-item">--%>
					<figure>
						<div class="overlay">
							<i class="ti-plus"></i>
						</div>
						<img src="../assets/module/img/forum/h11.jpg">
						<%--<img src="../assets/module/img/forum/h11.jpg" alt="Image" class="img-responsive">--%>
					</figure>
					<div class="fh5co-text">
						<h2 class="x">民宿花港之家</h2>
						<p>内蒙古&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;100位旅客曾住过</p>
					</div>
				<%--</a>--%>
			</div>
			<div class="col-lg-4 col-md-4 col-sm-6">
				<a  class="fh5co-project-item">
					<figure>
						<div class="overlay">
							<i class="ti-plus"></i>
						</div>
						<img src="../assets/module/img/forum/h2.jpg" alt="Image" class="img-responsive">
					</figure>
					<div class="fh5co-text">
						<h2 class="x">民宿成功之家</h2>
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
						<img src="../assets/module/img/forum/h3.png" alt="Image" class="img-responsive">
					</figure>
					<div class="fh5co-text">
						<h2 class="x">民宿张伟之家</h2>
						<p >广西&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;70位旅客曾住过</p>
					</div>
				</a>
			</div>

			<div class="col-lg-4 col-md-4 col-sm-6">
				<a class="fh5co-project-item">
					<figure>
						<div class="overlay">
							<i class="ti-plus"></i>
						</div>
						<img src="../assets/module/img/forum/h4.jpg" alt="Image" class="img-responsive">
					</figure>
					<div  class="fh5co-text">
						<h2 class="x">民宿君栋之家</h2>
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
						<img src="../assets/module/img/forum/h5.jpg" alt="Image" class="img-responsive">
					</figure>
					<div class="fh5co-text">
						<h2 class="x">民宿98至尊</h2>
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
						<img src="../assets/module/img/forum/h6.png" alt="Image" class="img-responsive">
					</figure>
					<div class="fh5co-text">
						<h2 class="x">民宿海澜之家</h2>
						<p>云南&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;60位旅客曾住过</p>
					</div>
				</a>
			</div>

		</div>


	<footer>
		<div class="container margin_60_35">
			<!--/row-->
			<%--<hr>--%>
			<div class="row">
				<div class="col-xl-4 m-auto" style="text-align: center">

					<ul id="additional_links">
						<li>Terms and conditions</li>
						<li>Privacy</li>
						<li><span>© 2019 Minsu</span></li>
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
	<script src="../assets/index/assets/validate.js"></script>
	
	<!-- DATEPICKER  -->
	<script>
	$(function() {
	  'use strict';
	  $('input[name="dates"]').daterangepicker({
		  autoUpdateInput: false,
		  locale: {
			  cancelLabel: 'Clear'
		  }
	  });
	  $('input[name="dates"]').on('apply.daterangepicker', function(ev, picker) {
//		  $(this).val(picker.startDate.format('MM-DD-YY') + ' > ' + picker.endDate.format('MM-DD-YY'));
		  $(this).val(picker.startDate.format('YYYY-MM-DD') + ' > ' + picker.endDate.format('YYYY-MM-DD'));
	  });
	  $('input[name="dates"]').on('cancel.daterangepicker', function(ev, picker) {
		  $(this).val('');
	  });
	});
	</script>
	
	<!-- INPUT QUANTITY  -->
	<script src="../assets/index/js/input_qty.js"></script>
	
</body>
</html>