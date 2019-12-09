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

    <link rel="stylesheet" href="css/bootstrap.min.css">

</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    //response.setHeader("refresh", "2");
%>
<jsp:useBean id="wenjuans" class="com.cyz.bean.Wenjuan"></jsp:useBean>
<jsp:setProperty property="*" name="wenjuans"/>

<form action="displayAction.action" method="post">
    <table align="center" width="100%"
           class="table table-striped table-hover" style="margin-top: -19px;">
        <tr>
            <td align="center" colspan="7"><h3>所有问卷</h3></td>
        </tr>
        <tr align="center">
            <td><b>问卷ID</b></td>
            <td><b>问卷名称</b></td>
            <td><b>问卷类型</b></td>
            <td><b>截止时间</b></td>
            <td><b>问卷操作</b></td>
            <td><b>问卷操作</b></td>
            <td><b>问卷操作</b></td>
        </tr>

        <%
            WenjuanDao wd = new WenjuanDao();
            while (true) {
                ArrayList<Wenjuan> ar = wd.getListAll();
                for (Wenjuan wenjuan : ar) {
        %>
        <tr align="center">
            <td><%=wenjuan.getW_id()%></td>
            <td><%=wenjuan.getW_title()%>
            </td>
            <td><%=wenjuan.getW_type()%>
            </td>
            <td><%=wenjuan.getW_endtime()%>
            </td>
            <td><a href="fx.jsp?id=<%=wenjuan.getW_id()%>">查看结果</a></td>
            <td><a href="b.jsp?id=<%=wenjuan.getW_id()%>">参与调查</a></td>
            <td><a href="w_delete.jsp?w_id=<%=wenjuan.getW_id() %>">删除问卷</a></td>
                <%
			}
				break;
			}
		%>
    </table>
</form>
</body>
</html>
