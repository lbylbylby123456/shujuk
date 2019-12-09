<%@ page import="com.cyz.dao.QuestionsDao" %>
<%@ page import="com.cyz.dao.WenjuanDao" %>
<%@ page import="com.cyz.bean.Wenjuan" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.cyz.bean.Questions" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>预览问卷</title>
</head>
<body>
<jsp:useBean id="wenjuan" class="com.cyz.bean.Wenjuan"></jsp:useBean>
<jsp:setProperty property="*" name="wenjuan"/>
<jsp:useBean id="questions" class="com.cyz.bean.Questions"></jsp:useBean>
<jsp:setProperty property="*" name="questions"/>

<table>
    <tr>
        <td>题目：</td>
    </tr>
    <tr></tr>
    <%
        WenjuanDao wd = new WenjuanDao();
        while (true) {
            ArrayList<Wenjuan> ar = wd.getListAll();
            for (Wenjuan w : ar) {
           %>
    <tr>
        <td><%=w.getW_title() %></td>
        <td><%=w.getW_type() %></td>
        <td><%=w.getW_endtime()%></td>
    </tr>

    <%
            }
            break;
        }
    %>

    <%
        QuestionsDao qd = new QuestionsDao();
        while (true) {
            ArrayList<Questions> ar = qd.getListAll();

            for (Questions q : ar) {
    %>
    <tr>
        <td><%=q.getQ_content() %></td>
    </tr>
    <tr>
        <td><%=q.getO_content() %></td>
    </tr>
    <%
            }
            break;
        }
    %>
</table>
</body>
</html>