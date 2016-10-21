<%@page import="com.zzw.Servlet.LoginServlet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登录成功</title>
</head>
<body>
	<%
	  String user = request.getParameter("username");
	  String pass = request.getParameter("password");
	  out.print("欢迎,"+user+"老师");
	  System.out.print(user);
	%>
</body>
</html>