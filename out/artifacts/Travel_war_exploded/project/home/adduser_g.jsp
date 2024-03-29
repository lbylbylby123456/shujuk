﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
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
            document.getElementById("image").src = document.getElementById("image").src
                + "?nocache=" + new Date().getTime();

        }
    </script>
    <style>
        body {
            min-height: 600px;
            position: relative;
            background-color: #C0C0C0;
        }

        * {
            font-family: "微软雅黑";
            margin: 0;
            padding: 0;
            border: 0;
            font-size: 14px;
            color: white;
        }

        html, body {
            height: 100%;
            width: 100%;;
        }

        .kuico {
            background: url(img/coolyun.png) no-repeat;
            display: inline-block;
            width: 26px;
            height: 16px;
            margin-right: 5px;
        }

        .kuintro {
            color: white;
            padding-right: 5px;
            rgba(255,
            255,
            255,
            0.8);
        }

        .kutrg {
            background: url(img/triangle.png) no-repeat;
            display: inline-block;
            width: 10px;
            height: 6px;
        }

        a {
            text-decoration: none;
            color: rgba(255, 255, 255);
            cursor: pointer;
        }

        .robot {
            background: url(img/android.png) no-repeat;
            display: inline-block;
            width: 18px;
            height: 20px;
            padding-right: 5px;
        }

        .question {
            background: url(img/question.png) no-repeat;
            display: inline-block;
            width: 20px;
            height: 20px;
            padding-right: 5px;
        }

        .downIntro, .introYun, .account {
            float: left;
            margin-right: 25px;
        }

        .name, .pwd {
            width: 310px;
            height: 44px;
            line-height: 44px;
            padding-left: 15px;
            outline: none;
            border-radius: 20px;
            background-color: #CDCDCD;
            border: 1px solid #329BE0;
            color: #663399;
        }

        .name:hover, .pwd:hover, .name:focus, .pwd:focus {
            background-color: #D9D9F3;
        }

        #login {
            background: #3fb9ff;
            font-size: 18px;
            width: 329px;
            height: 44px;
            outline: none;
            color: white;
            background: -webkit-linear-gradient(#3fb9ff, #099be7, #229de3);
            background: -o-linear-gradient(#3fb9ff, #099be7, #229de3);
            background: -moz-linear-gradient(#3fb9ff, #099be7, #229de3);
            background: linear-gradient(#3fb9ff, #099be7, #229de3);
            border-radius: 20px;
        }

        #login:hover {
            background: -webkit-linear-gradient(#229de3, #099be7, #3fb9ff);
            background: -o-linear-gradient(#229de3, #099be7, #3fb9ff);
            background: -moz-linear-gradient(#229de3, #099be7, #3fb9ff);
            background: linear-gradient(#229de3, #099be7, #3fb9ff);
        }

        #hLeft {
            float: left;
            height: 32px;
            vertical-align: middle;
            line-height: 32px;
            width: 172px;
            text-align: center;
            cursor: pointer;
        }

        #hright {
            float: right;
            margin-right: 10px;
        }

        #head {
            height: 50px;
            padding-top: 25px;
            margin-left: 14px;
        }

        #middle {
            margin-top: 100px;
            /* height:600px; */
        }

        #footer {
            text-align: center;
            bottom: 15px;
            position: absolute;
            width: 100%;
        }

        #footer a {
            color: black;
        }

        #middle li {
            list-style-type: none;
            margin-top: 15px;
        }

        #children li {
            list-style-type: none;
            height: 42px;
            line-height: 42px;
            border-bottom: 1px double rgb(5, 33, 113);
        }

        #children li a {
            color: rgba(255, 255, 255);
        }

        .register {
            padding-right: 25px;
        }

        .downApk {
            background: url(img/android.png) no-repeat 30px;
            text-indent: 25px;
            display: inline-block;
            height: 32px;
            line-height: 32px;
            width: 232px;
            text-align: center;
        }

        .downApk:hover {
            background-color: #354d8d;
            border-radius: 16px;
        }

        .introduce {
            background: url(img/question.png) no-repeat 20px;
            text-indent: 20px;
            display: inline-block;
            height: 32px;
            line-height: 32px;
            width: 140px;
            text-align: center;
        }

        .introduce:hover {
            background-color: #354d8d;
            border-radius: 16px;
        }

        .reg {
            height: 32px;
            line-height: 32px;
            width: 129px;
            display: inline-block;
            text-align: center;
        }

        .reg:hover {
            background-color: #354d8d;
            border-radius: 16px;
        }

        .forgetPwd {
            height: 32px;
            line-height: 32px;
            width: 129px;
            display: inline-block;
            text-align: center;
        }

        .forgetPwd:hover {
            background-color: #354d8d;
            border-radius: 16px;
        }

        #children {
            position: absolute;
            margin-top: 35px;
            left: 14px;
            width: 172px;
            text-align: center;
            background-color: #1f377f;
            display: none;
        }

        #hLeft:hover {
            background-color: #1f377f;
            border-radius: 16px;
        }

        #children li:hover {
            background-color: #354d8d;
        }

        #cloud {
            background: url(img/cloud.png) repeat;
            width: 100%;
            height: 356px;
            position: absolute;
            bottom: 0px;
            -webkit-animation: cloud 60s linear infinite alternate;
            -moz-animation: clouds 60s linear infinite alternate;
            z-index: -10;
        }

        @
        -webkit-keyframes cloud {

        0
        %
        {
            background-position: top left
        }

        100
        %
        {
            background-position: top right

        }
        }
        @
        -moz-keyframes clouds {

        0
        %
        {
            background-position: top left
        }

        100
        %
        {
            background-position: top right

        }
        }
        #err {
            display: none;
            color: red;
        }

        #sky {
            background: url(img/sky.png) repeat;
            width: 100%;
            heigth: 462px;
            z-index: -20;
            height: 462px;
            position: absolute;
            top: 0px;
        }

        #valid {
            height: 44px;
            width: 150px;
            text-indent: 1em;
            vertical-align: middle;
            line-height: 46px;
            outline: none;
            border-radius: 20px;
            background-color: #CDCDCD;
            border: 1px solid #329BE0;
            color: #663399;
        }

        #validcode {
            display: inline-block;
            width: 100px;
            height: 30px;
            margin-left: 5px;
            vertical-align: middle;
        }

        #changeimg {
            margin-left: 15px;
            cursor: pointer;
        }

        #tlogin:focus {
            outline: none;
        }
    </style>
    <link rel="stylesheet" href="css/bootstrap.css">
</head>
<body>
<div class="a">

    <div id="middle">
        <form action="add_user.action" method="post">
            <ul style="text-align: center;">
                <li style="font-size: 30px; color: #3fb9ff;">添加用户</li>

                <li><input class="name" name="username" placeholder="请输入用户名"
                           style="margin-top: 25px;"></li>
                <li><input id="p1" type="password" name="password" class="pwd"
                           placeholder="请输入密码"></li>
                <li><input id="p2" type="password" name="password1"
                           class="pwd" placeholder="请确认密码"></li>
                <li id="verifyCode" style="display: block;"><input id="valid"
                                                                   name="rand" placeholder="请输入验证码" maxlength="4">
                    <span id="validcode">
                    <img id="image" id="img_captcha" src="imgAction"> </span> <span
                            id="changeimg" onclick="chang()" style="color: #3fb9ff;">换一张</span></li>
                <li>
                    <button id="login" value="click">确认添加</button>
                </li>
                <li><span id="err" style="display: inline-block;"></span></li>
            </ul>
        </form>
    </div>


    <script src="js/jquery-2.1.1.js" type="text/javascript"
            charset="UTF-8"></script>

    <script language='javascript' type='text/javascript'>
        $(document).ready(function () {
            init();

        });

        function init() {

            $(".name,.pwd,#valid").keyup(function (event) {
                if (event.keyCode == 13) {
                    $('#login').click();
                }

            });
            $("form").submit(function (event) {
                var account = $(".name").val();
                var pwd = $("#p1").val();
                var pwds = $("#p2").val();

                if (!account || !pwd) {
                    $("#err").css("display", "inline-block");
                    $("#err").text("请输入用户名或密码");
                    return false;
                }

                if (pwd !== pwds) {
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

            $('#changeimg').click(
                function () {
                    $('#verifyCodePic')[0].src = '/jcaptcha.jpg?'
                        + Math.random();
                    return false;
                });

            /*  $('#login').bind("click", function(){
                $("#err").css("display", "inline-block");
                $("#err").text("添加成功！");
                return false;
                });  */

            /* 	$("#login").live('click',function(){

                        $("#ts").html("添加成功~");
                        is_show();
                        return false;
                }); */

        }
    </script>

</div>
</body>
</html>