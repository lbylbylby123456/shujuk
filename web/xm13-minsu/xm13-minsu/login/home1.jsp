<%@page contentType="text/html; charset=UTF-8"
        import="java.sql.*,java.io.*"%>
<%

    String user_id= request.getParameter("user_id");
   // out.print("接收到："+user_id);
    String user_role= request.getParameter("user_role");
    // out.print("接收到："+user_role);
    session.setAttribute("user_role",user_role);
    session.setAttribute("user_id",user_id);
    session.setAttribute("unit_db_name","xm13-minsu");
%>
<script>
    window.location.href="../../home/main/index.jsp";
</script>




<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<%--%>
   <%--// HttpSession hechen = request.getSession();--%>
  <%--//  String dbName=(String)hechen.getAttribute("user_role");改的--%>

   <%--// String name = request.getParameter("name");--%>
   <%--// out.print("接收到："+name);--%>

<%--%>--%>

<%--</html>--%>



<%--<script>--%>
    <%--//var name = request.getParameter("name");--%>
   <%--// out.print("接收到："+name);--%>
    <%--// if(name==guest)--%>
   <%--// var test=document.getElementById("firstname");--%>
        <%--window.location.href = "indexzs.jsp";--%>

 <%----%>
<%--</script>--%>