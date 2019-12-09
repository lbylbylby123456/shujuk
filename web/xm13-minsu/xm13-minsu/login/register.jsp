<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>注册</title>
<script type="text/javascript">

function chang() {
	document.getElementById("image").src=document.getElementById("image").src + "?nocache="+new Date().getTime();

}
</script>
<style>

</style>
<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/register.css">
</head>
<body>
	<div id="sky"></div>
	<div id="head"></div>
	<div id="middle">
		<form action="register.action" method="post">
			<ul style="text-align: center;">
				<li style="font-size: 48px">注&nbsp;&nbsp;&nbsp;册</li>

				<li><input class="name" name="username" placeholder="请输入用户名" style="margin-top: 25px;"></li>
				<li><input id="p1" type="password" name="password" class="pwd"placeholder="请输入密码"></li>
				<li><input id="p2" type="password" name="password1" class="pwd"placeholder="请确认密码"></li>
				<li id="verifyCode" style="display: block;">
				<input id="valid"name="rand" placeholder="请输入验证码" maxlength="4"> 
				<span id="validcode">
					<img id="img_captcha" src="imgAction">
				</span> 
				<span id="changeimg" onclick="chang()">换一张</span></li>
				<li><button id="login">立即注册</button></li>
				<li><span id="err" style="display: inline-block;"></span></li>
				<li></li>
				<li><span><a href="login2.jsp" style="color: white;">管理员登录</a>&nbsp; &nbsp;|&nbsp; &nbsp;
					<a href="login3.jsp" style="color: white;">房东用户登录</a>&nbsp; &nbsp;|&nbsp; &nbsp;
				<a href="login1.jsp" style="color: white;">普通用户登录</a></span></li>



			</ul>
		</form>
	</div>
	<div id="footer">

		<!-- <a>关于我们@qq50330690 &nbsp; &nbsp;|&nbsp; &nbsp;</a> <a>Copyright © 2015
			宋安伟 保留所有权利 沪ICP备110号-1</a> -->
	</div>
	<div id="cloud"></div>



	<script src="js/jquery-2.1.1.js" type="text/javascript" charset="UTF-8"></script>
	<!-- <script type="text/javascript">
		function  check() {
			var p1=document.getElementById("p1").value;
			var p2=document.getElementById("p2").value;
			if(p1 != p2){
				alert("两次密码输入不一致，请重新输入");
				return false;
			}
			return true;
		}
	
	</script> -->
	<script language='javascript' type='text/javascript'>
		$(document).ready(function() {
			init();

		});

		function init() {

			$(".name,.pwd,#valid").keyup(function(event) {
				if (event.keyCode === 13) {
					$('#login').click();
				}

			});
			$("form").submit(function(event) {
				var account = $(".name").val();
				var pwd = $("#p1").val();
				var pwds = $("#p2").val();
				if (!account || !pwd) {
					$("#err").css("display", "inline-block");
					$("#err").text("请输入用户名或密码");
					return false;
				}
				
				if(pwd !== pwds){
					$("#err").css("display", "inline-block");
					$("#err").text("两次输入的密码不相同");
					return false;
				}
				var code = $("#valid").val().toLocaleLowerCase();
				code = $.trim(code);
				if (code.length < 4) {
					$("#err").css("display", "inline-block");
					$("#err").text("验证码错误");
					return false;
				}
			});

			$('#changeimg').click(function() {
				$('#verifyCodePic')[0].src = '/jcaptcha.jpg?' + Math.random();
				return false;
			});
		}
	</script>
	

</body>
</html>