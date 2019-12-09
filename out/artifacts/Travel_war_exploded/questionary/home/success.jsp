<%--
  Created by IntelliJ IDEA.
  User: Jayce
  Date: 2017/12/19
  Time: 22:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Success</title>

    <link rel="stylesheet" href="../../assets/module/scripts/project/home/css/bootstrap.css">
    <link rel="stylesheet" href="../../assets/module/scripts/project/home/css/style.css">

</head>
<body>
<div>
    <table class="table" style="background-color: #333333" width="100%">
        <tr>
            <td></td>
        </tr>
        <tr class="container-fluid" align="center">
            <%--<td class="col-xs-3"><a href="home.jsp"><h4 style="color: deepskyblue">首页</h4></a></td>--%>
            <%--<td class="col-xs-3"><a href="../view/view_WJ.jsp"><h4 style="color: deepskyblue">所有问卷</h4></a></td>--%>
            <%--<td class="col-xs-3"><a href="../view/viewMy_WJ.jsp?u_id=<%=session.getAttribute("Name")%>"><h4--%>
                    <%--style="color: deepskyblue">我的问卷</h4></a></td>--%>
            <%--<td class="col-xs-3"><a href="addWJ.jsp"><h4 style="color: deepskyblue">创建问卷</h4></a></td>--%>
                <td class="col-xs-6"><a href="../home/home.jsp"><h4 style="color: deepskyblue">问卷调查首页</h4></a></td>
                <td class="col-xs-6"><a href="../view/view_WJ.jsp"><h4 style="color: deepskyblue">调查问卷一览</h4></a></td>
        </tr>
    </table>
    <%
        response.setHeader("refresh", "3;URL=../view/view_WJ.jsp");
    %>
    <p style="color: #01AAED; font-size: 30px;margin-top: 50px" align="center">xm13民宿管理平台感谢您的填写！</p>
    <p style="color: #01AAED; font-size: 25px;" align="center">系统将在3秒后返回到初始界面...</p>
    <p style="color: #953b39; font-size: 20px;" align="center">如果不能自动跳转请点击导航栏跳转！</p>
</div>
</body>
</html>
