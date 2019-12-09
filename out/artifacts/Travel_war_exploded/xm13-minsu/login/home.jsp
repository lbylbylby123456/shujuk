<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<%
   // HttpSession hechen = request.getSession();
  //  String dbName=(String)hechen.getAttribute("user_role");改的

   String user_id= request.getParameter("user_id");
   //out.print("接收到："+user_id);
    session.setAttribute("user_id",user_id);
    session.setAttribute("user_role","tenant");
    //session.setAttribute("user_avatar","../../assets/module/img/security/user/avatar.jpg");
    session.setAttribute("unit_db_name","xm13-minsu");

%>

</html>



<script>
    //var name = request.getParameter("name");
   // out.print("接收到："+name);
    // if(name==guest)
   // var test=document.getElementById("firstname");
        window.location.href = "../../index/index.jsp";

 
</script>