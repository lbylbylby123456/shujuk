<%@page contentType="text/html; charset=UTF-8"%>
<%
    String user_id=(String)session.getAttribute("user_id");
%>
<meta charset="utf-8" />
<!-- BEGIN HEADER -->
<div class="page-header navbar navbar-fixed-top" id="page_top_div">
	<!-- BEGIN HEADER INNER -->
	<div class="page-header-inner">
		<!-- BEGIN LOGO -->
		<div class="page-logo">
			<a href="../../index.jsp">
			<!-- <img src="../../assets/admin/layout/img/logo.png" alt="logo" class="logo-default"/> -->
			<img src="../../assets/module/img/home/logo.png" alt="logo" class="logo-default"/>
			</a>
			<div class="menu-toggler sidebar-toggler hide">
			</div>
		</div>
		<!-- END LOGO -->
		<!-- BEGIN RESPONSIVE MENU TOGGLER -->
		<a href="javascript:;" class="menu-toggler responsive-toggler" data-toggle="collapse" data-target=".navbar-collapse">
		</a>
		<!-- END RESPONSIVE MENU TOGGLER -->
		<!-- BEGIN TOP NAVIGATION MENU -->
		<div class="top-menu">
			<ul id="left_menu_bar" class="nav navbar-nav pull-right">
				<!-- BEGIN NOTIFICATION DROPDOWN -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
				<%--<li class="dropdown dropdown-extended dropdown-notification" id="header_notification_bar">--%>
					<%--<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">--%>
					<%--<i class="icon-bell"></i>--%>
					<%--<span class="badge badge-danger" id="user_notice_div_count"></span>--%>
					<%--</a>--%>
					<%--<ul class="dropdown-menu" id="user_notice_div">--%>
						<%--<li class="external">--%>
							<%--<h3><span class="bold"><span id="user_notice_div_count_tip"></span> 条未处理</span> 消息提醒</h3>--%>
							<%--<a href="extra_profile.html">显示所有</a>--%>
						<%--</li>--%>
					<%--</ul>--%>
				<%--</li>--%>
				<!-- END NOTIFICATION DROPDOWN -->
				<!-- BEGIN INBOX DROPDOWN -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
                <li>
                    <div style="margin-top: 15px">
                        <iframe scrolling="no" src="https://tianqiapi.com/api.php?style=tb&skin=pitaya&color=FFFFFF" frameborder="0" width="350" height="24" allowtransparency="true"></iframe>
                    </div>
                </li>
                <li style="margin-top: 15px">
                    <div style="color: white;">欢迎您，<%=user_id%>!</div>
                </li>
				<li class="dropdown dropdown-extended dropdown-inbox" id="header_inbox_bar">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<i class="icon-envelope-open"></i>
					</a>
					<ul class="dropdown-menu">
					</ul>
				</li>
				<!-- END INBOX DROPDOWN -->
				<!-- BEGIN TODO DROPDOWN -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
				<li class="dropdown dropdown-extended dropdown-tasks" id="header_calendar_bar">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<i class="icon-calendar"></i>
					</a>
					<ul class="dropdown-menu extended tasks">
					</ul>
				</li>
				<!-- END TODO DROPDOWN -->
				<!-- BEGIN USER LOGIN DROPDOWN -->
				<!-- DOC: Apply "dropdown-dark" class after below "dropdown-extended" to change the dropdown styte -->
				<li class="dropdown dropdown-user">
					<a href="javascript:;" class="dropdown-toggle" data-toggle="dropdown" data-hover="dropdown" data-close-others="true">
					<img id="current_user_avatar" alt="" class="img-circle" src="../../assets/module/img/security/user/avatar/avatar.jpg"/>
					<span class="username username-hide-on-mobile" id="current_user"></span>
					<span id="unread_notice" class="badge badge-danger"></span>
					<i class="fa fa-angle-down"></i>
					</a>
					<ul class="dropdown-menu dropdown-menu-default">
						<li>
							<a href="../../home/main/index.jsp">
							<i class="icon-user"></i>返回主界面</a>
						</li>

						<li>
							<a href="../../index.jsp">
							<i class="icon-key"></i> 退出系统</a>
						</li>
					</ul>
				</li>
				<%--<li class="dropdown dropdown-quick-sidebar-toggler">--%>
					<%--<a href="javascript:;" class="dropdown-toggle">--%>
					<%--<i class="icon-logout"></i>--%>
					<%--</a>--%>
				<%--</li>--%>
				<!-- END QUICK SIDEBAR TOGGLER -->
			</ul>
		</div>
		<!-- END TOP NAVIGATION MENU -->
	</div>
	<!-- END HEADER INNER -->
</div>
<!-- END HEADER -->
<div class="clearfix"></div>
