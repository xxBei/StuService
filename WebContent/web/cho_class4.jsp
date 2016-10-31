<%@page import="com.zzw.Helper.HelperDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>通过时间查询</title>
</head>
<body>
	<div style="width: 100%">
	<form action="cla_select1.jsp">
		<center>
		<br><br>
		选择时间：
		<input type="text" name="time1"/>
		<br><br>
		选择班级：  
		<input type="text" name="class1"/>
		<br><br>
		<input type="submit" value="确定"/>
		</center>
			
	</form>
	</div>
</body>
</html>