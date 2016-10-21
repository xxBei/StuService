<%@page import="com.zzw.Helper.HelperDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link href="../css/styles.css" type="text/html" rel="stylesheet"/>
<title>登录</title>
</head>
<body>
	<div class="main">
		<center><font style="font-size: 40px; ">登录系统</font></center>
		<div class="middle">
			<form action="../LoginServlet" method="post">
				姓名：<input type="text" name="username"/><br><br>
				密码：<input type="text" name="password"/><br><br>
					<input type="submit" value="登录" style="float: right; margin-right: 50px"/><br><br>
			</form>
		</div>
	</div>
</body>
</html>