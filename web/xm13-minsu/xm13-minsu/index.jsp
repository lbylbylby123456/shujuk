<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Login...</title>
</head>
<body>
<%--<jsp:forward page="login1.jsp"></jsp:forward>--%>
<%--<jsp:forward page="login2.jsp"></jsp:forward>--%>

</body>
</html>
<%
   session.setAttribute("user_role","host");
   session.setAttribute("user_name","??");
   session.setAttribute("user_id","zhangsan");
   session.setAttribute("user_avatar","../../assets/module/img/security/user/avatar.jpg");
   session.setAttribute("unit_db_name","xm13-minsu");
   session.setAttribute("wechat_server_address","www.cdylx.com");
%>
<script>
  window.location.href="login/login1.jsp";
 // window.location.href="../../home/main/index.jsp";
</script>