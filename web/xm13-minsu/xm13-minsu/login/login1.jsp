<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <%--<%--%>
		<%--session.setAttribute("user_role","guest");--%>
	<%--%>--%>


<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="description" content="">
<meta name="author" content="">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>普通用户登录</title>
<script type="text/javascript">

function chang() {
	document.getElementById("image").src=document.getElementById("image").src + "?nocache="+new Date().getTime();

}
</script>
<%--<style type="text/css" href="css/login1.css">--%>

<%--</style>--%>
<link rel="stylesheet" href="css/bootstrap.css">
		<link rel="stylesheet" href="css/login1.css">
</head>
<body>
	<div id="sky"></div>
	<div id="head"></div>
	<div id="middle">
		<form action="login1.action" method="post">
			<ul style="text-align: center;">
				<li style="font-size: 48px">民&nbsp;宿&nbsp;旅&nbsp;游&nbsp;平&nbsp;台</li>

				<li><input class="name" name="username" placeholder="请输入用户名" style="margin-top: 25px;"></li>
				<li><input type="password" name="password" class="pwd"placeholder="请输入密码"></li>
					<li id="verifyCode" style="display: block;">
                    <input id="valid"name="rand" placeholder="请输入验证码" maxlength="4">
                    <span id="validcode">
                        <img id="image" id="img_captcha"src="imgAction">
                    </span>
                    <span id="changeimg" onclick="chang()">换一张</span></li>
				<li><button id="login">立即登录</button></li>
				<li><span id="err" style="display: inline-block;"></span></li>
				<li></li>
				<li><span>
					<a href="register.jsp" style="color: yellow;">注册</a>&nbsp; &nbsp;|&nbsp; &nbsp;
					<a href="login2.jsp" style="color:yellow;">管理员身份登录</a>&nbsp; &nbsp;|&nbsp; &nbsp;
					<a href="login3.jsp" style="color:yellow;">房东用户登录</a>
				</span></li>



			</ul>
		</form>
	</div>
	<div id="footer">

		<!-- <a>关于我们@qq50330690 &nbsp; &nbsp;|&nbsp; &nbsp;</a> <a>Copyright © 2015
			宋安伟 保留所有权利 沪ICP备110号-1</a> -->
	</div>
	<div id="cloud"></div>



	<script src="js/jquery-2.1.1.js" type="text/javascript" charset="UTF-8"></script>
	<script language='javascript' type='text/javascript'>
		$(document).ready(function() {
			init();

		});

		function init() {

			$(".name,.pwd").keyup(function(event) {
				if (event.keyCode === 13) {
					$('#login').click();
				}

			});
			$("form").submit(function(event) {
				var account = $(".name").val();
				var pwd = $(".pwd").val();
				if (!account || !pwd) {
					$("#err").css("display", "inline-block");
					$("#err").text("请输入用户名或密码");
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