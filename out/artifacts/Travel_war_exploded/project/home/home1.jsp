<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%

	String user_id= request.getParameter("user_id");
	//out.print("接收到："+user_id);
	String user_role= request.getParameter("user_role");
	//out.print("接收到："+user_role);
	session.setAttribute("user_role",user_role);
	session.setAttribute("user_id",user_id);
	session.setAttribute("unit_db_name","xm13-minsu");
%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="viewport"
	content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no" />
<meta name="renderer" content="webkit|ie-comp|ie-stand">
<meta name="keywords" content="scclui框架">
<meta name="description" content="scclui为轻量级的网站后台管理系统模版。">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta http-equiv="Cache-Control" content="no-siteapp" />
<title>后台管理</title>

<link rel="stylesheet" href="../../assets/module/scripts/project/home/common/css/sccl.css">
<link rel="stylesheet" type="text/css" href="../../assets/module/scripts/project/home/common/skin/qingxin/skin.css" id="layout-skin"/>

</head>
<body>
<div class="layout-admin">
		<header class="layout-header">
			<span class="header-logo">问卷调查系统后台管理</span> 
			<a class="header-menu-btn" href="javascript:;"><i class="icon-font">&#xe600;</i></a>
			<ul class="header-bar">
				<li class="header-bar-role"><a href="javascript:;">管理员</a></li>
				<li class="header-bar-nav">
					<a href="javascript:;">xm13 民宿管理平台<i class="icon-font" style="margin-left:5px;"></i></a>
					<%--<a href="javascript:;">xm13<i class="icon-font" style="margin-left:5px;">&#xe60c;</i></a>--%>
					<%--<ul class="header-dropdown-menu">--%>
						<%--&lt;%&ndash;<li><a href="javascript:;">个人信息</a></li>&ndash;%&gt;--%>
						<%--&lt;%&ndash;<li><a href="../../login/login1.jsp">切换账户</a></li>&ndash;%&gt;--%>


						<%--&lt;%&ndash;<li><a href="../forum/forum_list.jsp">返回主界面</a></li>  改了&ndash;%&gt;--%>

							<%--<li><a href="../../home/main/index.jsp">返回主界面</a></li>--%>

						<%--&lt;%&ndash;<form action="Servlet_logout"  method="post" >&ndash;%&gt;--%>
						<%--&lt;%&ndash;<li><a href="">退出</a></li>&ndash;%&gt;--%>
						<%--&lt;%&ndash;</form>&ndash;%&gt;--%>
					<%--</ul>--%>
<li><a href="../../xm13-minsu/login/login2.jsp">返回登录界面</a></li>

				</li>
				<li class="header-bar-nav"> 
					<a href="javascript:;" title="更换边框颜色"><i class="icon-font">&#xe608;</i></a>
					<ul class="header-dropdown-menu right dropdown-skin">
						<li><a href="javascript:;" data-val="molv" title="墨绿">深色</a></li>
						<li><a href="javascript:;" data-val="qingxin" title="清新">浅色</a></li>
						<li><a href="javascript:;" data-val="blue" title="蓝色">中色</a></li>
					</ul>
				</li>
			</ul>
		</header>

		<aside class="layout-side">
			<ul class="side-menu">
			  
			</ul>
		</aside>
		
		<div class="layout-side-arrow"><div class="layout-side-arrow-icon"><i class="icon-font">&#xe60d;</i></div></div>
		
		<section class="layout-main">
			<div class="layout-main-tab">
				<button class="tab-btn btn-left"><i class="icon-font">&#xe60e;</i></button>
                <nav class="tab-nav">
                    <div class="tab-nav-content">
                        <a href="javascript:;" class="content-tab active" data-id="home1_1.jsp">首页</a>
                    </div>
                </nav>
                <button class="tab-btn btn-right"><i class="icon-font">&#xe60f;</i></button>
			</div>
			<div class="layout-main-body">
				<iframe class="body-iframe" name="iframe0" width="100%" height="99%" src="home1_1.jsp" frameborder="0" data-id="home1_1.jsp" seamless></iframe>
			</div>
		</section>
	</div>
	<script type="text/javascript" src="../../assets/module/scripts/project/home/common/lib/jquery-1.9.0.min.js"></script>
	<script type="text/javascript" src="../../assets/module/scripts/project/home/common/js/sccl.js"></script>
	<script type="text/javascript" src="../../assets/module/scripts/project/home/common/js/sccl-util.js"></script>
</body>
</html>