<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %><%--
  Created by IntelliJ IDEA.
  User: Jayce
  Date: 2017/12/20
  Time: 22:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>删除成功</title>
</head>
<body>
<%
    int id = Integer.valueOf(request.getParameter("w_id"));
    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/questionnaire", "root", "123456");
        String sql = "delete from wenjuan where w_id=?";
        PreparedStatement ps = conn.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        ps.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();// TODO: handle exception
    }
%>

<%
    response.setHeader("refresh", "3;URL=gview_WJ.jsp");
%>
<p style="color: #01AAED; font-size: 30px;margin-top: 50px" align="center">删除成功！</p>
<p style="color: #01AAED; font-size: 25px;" align="center">系统将在3秒后返回界面...</p>
<p style="color: #953b39; font-size: 20px;" align="center">如果不能自动跳转请点击导航栏跳转！</p>
</body>
</html>
