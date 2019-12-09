<%@ page contentType="text/html; charset=UTF-8"%>
<%@page pageEncoding = "UTF-8" %>
<%@page import="java.text.*"%>
<%
    String user_id=request.getParameter("user_id");
%>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    String url=(String)session.getAttribute("url1");
    System.out.println("gggg:"+url);
      session.removeAttribute("url1");
request.setCharacterEncoding("UTF-8");response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Panagea - Premium site template for travel agencies, hotels and restaurant listing.">
    <meta name="author" content="Ansonika">
    <title>个人信息</title>

    <!-- Favicons-->
    <link rel="shortcut icon" href="../xm13-minsu/assets/index/img/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" type="image/x-icon" href="../xm13-minsu/assets/index/img/apple-touch-icon-57x57-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="72x72" href="../xm13-minsu/assets/index/img/apple-touch-icon-72x72-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="114x114" href="../xm13-minsu/assets/index/img/apple-touch-icon-114x114-precomposed.png">
    <link rel="apple-touch-icon" type="image/x-icon" sizes="144x144" href="../xm13-minsu/assets/index/img/apple-touch-icon-144x144-precomposed.png">
    <!-- END THEME STYLES -->
    <link href="../xm13-minsu/assets/index/css/bootstrap.min.css" rel="stylesheet">
    <link href="../xm13-minsu/assets/index/css/style.css" rel="stylesheet">
    <!-- BASE CSS -->
    <%--<link href="../xm13-minsu/assets/index/css/vendors.css" rel="stylesheet">--%>
    <!-- SPECIFIC CSS -->
    <%--<link href="../xm13-minsu/assets/index/css/blog.css" rel="stylesheet">--%>
    <!-- YOUR CUSTOM CSS -->
    <link href="../xm13-minsu/assets/index/css/custom.css" rel="stylesheet">
   
<link href="../xm13-minsu/assets/global/plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css"/>
<link href="../xm13-minsu/assets/global/plugins/simple-line-icons/simple-line-icons.min.css" rel="stylesheet" type="text/css"/>
<link href="../xm13-minsu/assets/global/plugins/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
<!-- END GLOBAL MANDATORY STYLES -->
<!-- BEGIN PAGE LEVEL STYLES -->
    <link href="../xm13-minsu/assets/global/plugins/uniform/css/uniform.default.css" rel="stylesheet" type="text/css"/>
    <link href="../xm13-minsu/assets/global/plugins/bootstrap-switch/css/bootstrap-switch.min.css" rel="stylesheet" type="text/css"/>
<link href="../xm13-minsu/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.css" rel="stylesheet" type="text/css"/>
<link href="../xm13-minsu/assets/admin/pages/css/profile.css" rel="stylesheet" type="text/css"/>
<link href="../xm13-minsu/assets/admin/pages/css/tasks.css" rel="stylesheet" type="text/css"/>
<!-- END PAGE LEVEL STYLES -->
<!-- BEGIN THEME STYLES -->
<link href="../xm13-minsu/assets/global/css/components.css" id="style_components" rel="stylesheet" type="text/css"/>
<link href="../xm13-minsu/assets/global/css/plugins.css" rel="stylesheet" type="text/css"/>
<link href="../xm13-minsu/assets/admin/layout/css/layout.css" rel="stylesheet" type="text/css"/>
<link id="style_color" href="../xm13-minsu/assets/admin/layout/css/themes/darkblue.css" rel="stylesheet" type="text/css"/>
<link href="../xm13-minsu/assets/admin/layout/css/custom.css" rel="stylesheet" type="text/css"/>
    <!-- END THEME STYLES -->
    <%--<link rel="shortcut icon" href="../xm13-minsu/assets/global/plugins/datatables/media/images/favicon.ico"/>--%>
    <style type="text/css">
        .selectbox{ height:30px; width:500px;}
        .selectbox select{ height:30px; width:120px; margin-right:10px; border:1px solid #999; line-height:30px;}
    </style>
</head>

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
				<li><span ><a href="../index/index.jsp">首页</a></span>
				</li>
				<li><span><a href="#">我是房东</a></span>
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
		<section class="hero_in restaurants">
			<div class="wrapper">
				<div class="container">
					<h1 class="fadeInUp"><span></span>个人信息</h1>
				</div>
			</div>
        </section>
        <div class="profile-sidebar">
            <!-- PORTLET MAIN -->
            <div class="portlet light profile-sidebar-portlet">
                <!-- SIDEBAR USERPIC -->
                <div class="profile-userpic" id="image_div">
                </div>
                <!-- END SIDEBAR USERPIC -->
                <!-- SIDEBAR USER TITLE -->
                <div class="profile-usertitle">
                    <div class="profile-usertitle-name" id="Myname">
                    </div>
                    <%--<div class="profile-usertitle-job">--%>
                    <%--</div>--%>
                </div>
                <!-- END SIDEBAR USER TITLE -->
                <div class="profile-usermenu">
                    <ul class="nav">
                        <li style="border: solid 2px slategrey; margin-left: 70px">
                            <a href="person/person.jsp">
                                <i class="icon-home"></i>
                                信息查看 </a>
                        </li>
                    </ul>
                </div>
                <!-- END MENU -->
            </div>
            <!-- END PORTLET MAIN -->
        </div>
        <!-- BEGIN PROFILE CONTENT -->
        <div class="profile-content">
            <div class="row">
                <div class="col-md-12">
                    <div class="portlet light">
                        <div class="portlet-title tabbable-line">
                            <div class="caption caption-md">
                                <i class="icon-globe theme-font hide"></i>
                                <span class="caption-subject font-blue-madison bold uppercase">修改信息</span>
                            </div>
                            <%--<ul class="nav nav-tabs">--%>
                                <%--<li class="active">--%>
                                    <%--<a href="#tab_1_1" data-toggle="tab">修改信息</a>--%>
                                <%--</li>--%>
                                <%--<li>--%>
                                    <%--<a href="#tab_1_3" data-toggle="tab">修改密码</a>--%>
                                <%--</li>--%>
                            <%--</ul>--%>
                        </div>
                        <div class="portlet-body">
                            <div class="tab-content">
                                <!-- PERSONAL INFO TAB -->
                                <div class="tab-pane active" id="tab_1_1">
                                    <label class="control-label">头像</label>
                                    <div class="form-group" >
                                            <div class="fileinput fileinput-new" data-provides="fileinput">
                                                <div class="fileinput-preview thumbnail" data-trigger="fileinput" style="border:black solid 0.5px;width: 150px; height: 150px;">
                                                </div>
                                                <div>
                                                    <form action="UpLoad" enctype="multipart/form-data" method="post">
                                                        <input type="file" name="file1"><br>
                                                        <input type="submit" value="上传" class="btn green-haze"/>
                                                    </form>
                                                    <%
                                                        if(url==null || url.equals("null") || url.isEmpty()){
                                                        }else{
                                                    %>
                                                    <a href="<%=url%>" target="_blank">点击查看上传图片</a>
                                                    <%
                                                        }
                                                    %>
                                                </div>
                                            </div>

                                    </div>
                                    <form role="form" id="page_form" name="page_form"  action="#" >
                                        <input type="hidden" id="action" name="action" value="modify_record"/>
                                        <input type="hidden" id="path" name="path" value="<%=url%>" />
                                         <label class="control-label">真实姓名</label>
                                        <div class="form-group" >
                                            <input class="form-control" onblur='fun1()' style="width: 80px; height: 30px;" type="text" id="name" name="name"/>
                                        </div>
                                         <label class="control-label">性别</label>
                                        <div class="form-group">
                                            <%--<input type="text" id="sex" class="form-control"/>--%>
                                            <select style="width: 40px; height: 30px;" id="sex" name="sex" class="wide">
                                                <option value="女">女</option>
                                                <option value="男">男</option>
                                            </select>
                                        </div>
                                        <label class="control-label">生日</label>
                                        <div class="form-group">
                                            <input style="width: 140px; height: 30px;" id="birth"  type="date" name="birth" />
                                        </div>
                                        <label class="control-label">年龄</label>
                                        <div class="form-group">
                                            <input class="form-control" onblur='fun2()' style="width: 50px; height: 30px;" id="age"  type="text" name="age"/>
                                        </div>
                                         <label class="control-label">职业</label>
                                        <div class="form-group">
                                            <%--<input type="text" id="occupation" class="form-control"/>--%>
                                            <select style="width: 50px; height: 30px;" id="occupation" name="occupation" class="wide">
                                                <option value="学生">学生</option>
                                                <option value="IT">IT</option>
                                                <option value="制造">制造</option>
                                                <option value="医疗">医疗</option>
                                                <option value="金融">金融</option>
                                                <option value="商业">商业</option>
                                                <option value="文化">文化</option>
                                                <option value="娱乐">娱乐</option>
                                                <option value="法律">法律</option>
                                                <option value="教育">教育</option>
                                                <option value="行政">行政</option>
                                                <option value="其他">其他</option>
                                            </select>
                                        </div>
                                        <label class="control-label">所在地</label>
                                        <div class="form-group">
                                            <select style="width: 130px; height: 30px;" id="prov"  onchange="showCity(this)" class="wide">
                                                <option value="null">==请选择省份==</option>
                                            </select>
                                            <!--城市选择-->
                                            <select style="width: 130px; height: 30px;" id="city" onchange="showCountry(this)" class="wide">
                                                <option value="null">==请选择市区==</option>
                                            </select>
                                            <!--县区选择-->
                                            <select style="width: 130px; height: 30px;" id="country" onchange="addInfo(this)" class="wide">
                                                <option value="null">==请选择县市==</option>
                                            </select>
                                        </div>
                                        <input type="hidden" id="s1" name="province"  value=""/>
                                        <input type="hidden" id="s2" name="city" value=""/>
                                        <input type="hidden" id="s3" name="county" value=""/>
                                        <label class="control-label">邮箱</label>
                                        <div class="form-group">
                                            <input class="form-control" onblur='fun()' style="width: 200px; height: 30px;" type="text"  id="mail" name="mail" />
                                            <label  style="color: red; margin-top: 5px">（请输入正确邮箱）</label>
                                        </div>
                                        <label class="control-label">联系方式</label>
                                        <div class="form-group">
                                            <input class="form-control" onblur="upperCase()" style="width: 140px; height: 30px;" type="text" id="connect" name="connect"/>
                                            <label  style="color: red; margin-top: 5px">（请输入正确手机或电话号码）</label>
                                        </div>
                                        <label class="control-label">个人简介</label>
                                        <div class="form-group">
                                            <textarea style="width: 200px; height: 100px;"  id="signature" rows="3" name="signature"></textarea>
                                        </div>
                                        <%--<div class="margiv-top-10">--%>
                                            <button id="submit_button" class="btn green-haze">
                                                保存 </button>
                                        <%--</div>--%>
                                    </form>
                                </div>
                                <!-- END PERSONAL INFO TAB -->

                                <!-- CHANGE PASSWORD TAB -->
                                <%--<div class="tab-pane" id="tab_1_3">--%>
                                    <%--<form action="#">--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label class="control-label">旧密码</label>--%>
                                            <%--<input type="password" class="form-control"/>--%>
                                        <%--</div>--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label class="control-label">新密码</label>--%>
                                            <%--<input type="password" class="form-control"/>--%>
                                        <%--</div>--%>
                                        <%--<div class="form-group">--%>
                                            <%--<label class="control-label">确定密码</label>--%>
                                            <%--<input type="password" class="form-control"/>--%>
                                        <%--</div>--%>
                                        <%--<div class="margin-top-10">--%>
                                            <%--<a href="javascript:;" class="btn green-haze">--%>
                                                <%--确定修改</a>--%>
                                        <%--</div>--%>
                                    <%--</form>--%>
                                <%--</div>--%>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- END PROFILE CONTENT -->
    </main>
    </div>
</body>
<script src="../xm13-minsu/assets/module/scripts/person/city.js"></script>
<script src="../xm13-minsu/assets/module/scripts/person/method.js"></script>

</html>
<!-- COMMON SCRIPTS -->
<script src="../xm13-minsu/assets/index/js/jquery-2.2.4.min.js"></script>
<script src="../xm13-minsu/assets/index/js/common_scripts.js"></script>
<script src="../xm13-minsu/assets/index/js/main.js"></script>
<script src="../xm13-minsu/assets/index/assets/validate.js"></script>
<!--[if lt IE 9]>
<script src="../xm13-minsu/assets/global/plugins/respond.min.js"></script>
<script src="../xm13-minsu/assets/global/plugins/excanvas.min.js"></script>
<![endif]-->
<script src="../xm13-minsu/assets/global/plugins/jquery.min.js" type="text/javascript"></script>
<script src="../xm13-minsu/assets/global/plugins/jquery-migrate.min.js" type="text/javascript"></script>
<script src="../xm13-minsu/assets/global/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="../xm13-minsu/assets/global/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="../xm13-minsu/assets/global/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="../xm13-minsu/assets/global/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="../xm13-minsu/assets/global/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="../xm13-minsu/assets/global/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="../xm13-minsu/assets/global/plugins/bootstrap-switch/js/bootstrap-switch.min.js" type="text/javascript"></script>
<script src="../xm13-minsu/assets/global/plugins/bootstrap-fileinput/bootstrap-fileinput.js" type="text/javascript"></script>
<script src="../xm13-minsu/assets/global/plugins/jquery.sparkline.min.js" type="text/javascript"></script>

<script type="text/javascript" src="../xm13-minsu/assets/module/scripts/person/person_view.js"></script>
<script language=javascript>
    function fun() {
        var email = document.getElementById("mail").value; //获取邮箱地址
//判断邮箱格式是否正确
        var reg = /^[a-z0-9](\w|\.|-)*@([a-z0-9]+-?[a-z0-9]+\.){1,3}[a-z]{2,4}$/i;  //字母或数字开头  +  字母、数字或点、下划线和减号  +  @  +  一级域名或二级域名 +  顶级域名
        if (!(reg.test(email)) && email!=null) {
            alert("邮箱格式错误!");
            document.getElementById("mail").value=''; //让邮箱文本框获得焦点
        }
    }
    function fun2()
    {
        var b=document.getElementById('age').value;
        if(isNaN(b)==true || b=="")
        {
            alert('请输入数字');
            document.getElementById('age').value='';
        }
    }
    function fun1()
    {
        var c=document.getElementById('name').value;
        var regu = "^[a-zA-Z\u4e00-\u9fa5]+$";
        var re = new RegExp(regu);
        if (!re.test(c)) {
            alert("请正确输入中文或英文！");
            document.getElementById('name').value='';
        }
    }
    function upperCase()
    {
        var phone = document.getElementById('connect').value;
        var phoneReg = /^((0\d{2,3}-\d{7,8})|(1[34578]\d{9}))$/;
        if(!(phoneReg.test(phone)) && phone!=null){
            alert("手机或电话号码有误，请重填");
            document.getElementById('connect').value='';
            return false;
        }
    }
</script>