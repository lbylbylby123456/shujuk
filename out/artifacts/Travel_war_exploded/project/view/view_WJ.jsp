<%@ page import="com.cyz.dao.WenjuanDao" %>
<%@ page import="com.cyz.bean.Wenjuan" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: Jayce
  Date: 2017/12/18
  Time: 9:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>所有问卷</title>

    <link rel="stylesheet" href="../../assets/module/scripts/project/home/css/bootstrap.min.css">

</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    //response.setHeader("refresh", "2");
%>
<jsp:useBean id="wenjuans" class="com.cyz.bean.Wenjuan"></jsp:useBean>
<jsp:setProperty property="*" name="wenjuans"/>

<form action="displayAction.action" method="post">
    <table class="table" style="background-color: #333333">
        <tr><td></td></tr>
        <tr class="container-fluid" align="center">
            <td class="col-xs-4"><a href="../home/home.jsp"><h4 style="color: deepskyblue">首页</h4></a></td>
            <td class="col-xs-4"><a href="viewMy_WJ.jsp?u_id=<%=session.getAttribute("Name")%>"><h4 style="color: deepskyblue">我的问卷</h4></a></td>
            <td class="col-xs-4"><a href="../addWJ/addWJ.jsp"><h4 style="color: deepskyblue">创建问卷</h4></a></td>
        </tr>
    </table>
    <table align="center" width="100%"
           class="table table-striped table-hover" style="margin-top: -19px;">
        <tr>
            <td align="center" colspan="4"><h3>所有问卷</h3></td>
        </tr>
        <tr align="center">
            <td><b>问卷名称</b></td>
            <td><b>问卷类型</b></td>
            <td><b>截止时间</b></td>
            <td><b>问卷操作</b></td>
        </tr>

        <%
            WenjuanDao wd = new WenjuanDao();
            while (true) {
                ArrayList<Wenjuan> ar = wd.getListAll();
                for (Wenjuan wenjuan : ar) {
        %>
        <tr align="center">
            <td><%=wenjuan.getW_title()%>
            </td>
            <td><%=wenjuan.getW_type()%>
            </td>
            <td><%=wenjuan.getW_endtime()%>
            </td>
            <td><a href="../home/b.jsp?id=<%=wenjuan.getW_id()%>">参与调查</a></td>
                <%
			}
				break;
			}
		%>

    </table>
</form>
</body>
</html>
