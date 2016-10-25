<%@page import="java.sql.ResultSet"%>
<%@page import="com.zzw.Helper.HelperDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>选择班级</title>
</head>
<body>
	
	
	<%
		String sql = null;
		HelperDB db = null;
		ResultSet ret = null;
		int i = 0;
		sql = "select roomName from classroom_db";
		db = new HelperDB(sql);
		ret = db.pst.executeQuery();
	%>
	<form action="cho_class2.jsp",method="post">
		<center>
			<select style="width: 250px;margin-top: 50px;" name="classes">
			<%while(ret.next()){ %>
				<option><%out.print(ret.getString(1)); %></option>
			<%} %>
			
			</select>
		</center>
		<div style="width: 800px;float: left;margin-top: 10px;margin-left: 614px">
			<input type="submit" name="sure" value="提交"/>
		</div>
	</form>
	<%
	db.close();
	ret.close();
	%>
	
</body>
</html>