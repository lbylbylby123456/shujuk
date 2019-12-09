<%@page import="java.util.ArrayList" %>
<%@page import="com.cyz.dao.LRDao" %>
<%@page import="com.cyz.bean.User" %>
<%@page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport"
          content="width=device-width,initial-scale=1,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no"/>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta name="keywords" content="scclui框架">
    <meta name="description" content="scclui为轻量级的网站后台管理系统模版。">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta http-equiv="Cache-Control" content="no-siteapp"/>
    <title>首页</title>

    <link rel="stylesheet" href="../../assets/module/scripts/project/home/css/bootstrap.min.css">


</head>
<body>
<%
    request.setCharacterEncoding("UTF-8");

    //response.setHeader("refresh", "2");
%>
<jsp:useBean id="users" class="com.cyz.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="users"/>

<table align="center" width="100%"
       class="table table-striped table-hover">
    <tr>
        <td align="center" colspan="4"><h2>用户所有信息</h2></td>
    </tr>
    <tr align="center">
        <td><b>ID</b></td>
        <td><b>用户名称</b></td>
        <td><b>用户密码</b></td>
        <td><b>删除信息</b></td>
    </tr>

    <%

        LRDao lr = new LRDao();
        while (true) {
            ArrayList<User> ar = lr.getListAll();
            for (User user : ar) {

    %>

    <tr align="center">
        <td><%=user.getU_id()%>
        </td>
        <td><%=user.getUsername()%>
        </td>
        <td><%=user.getPassword()%>
        </td>
        <td><a href="../home/delete.jsp?u_id=<%=user.getU_id() %>">删除</a></td>
        <%--<td><a href="javascript:del();">删除</a></td>--%>
    </tr>


    <%
            }
            break;
        }
    %>

</table>

<script language=javascript>

    function del() {

        if (confirm("确定删除？")) {
            <%--window.location.href="DeleteServlet?id=<%=user.getU_id()%>";--%>
        }
    }
</script>

</body>
</html>