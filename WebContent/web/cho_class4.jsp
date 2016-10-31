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
	<%
		String sql = null;
		ResultSet ret = null;
		sql = "select classname from statisttics_db";
		HelperDB db = new HelperDB(sql);
		ret = db.pst.executeQuery();
	%> 
	<div style="width: 100%">
	<form action="cla_select1.jsp">
		<center>
		怎么时间：
		
		
		选择班级：  
		<select style="width: 300px;margin-top: 30px" name="class1">
			<%while(ret.next()){ %>
			<option>
				<%out.print(ret.getString(1)); %>
			</option> 
			<%} %>
		</select>
		<input type="submit" value="确定"/>
		</center>
			
	</form>
	</div>
</body>
</html>