<%@page import="java.sql.ResultSet"%>
<%@page import="com.zzw.Helper.HelperDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>签到记录</title>
</head>
<body>
	<% 
		String sql = null;
		HelperDB db = null;
		ResultSet ret = null;
		
		sql = "select * from statisttics_db";
		
	%>
</body>
</html>