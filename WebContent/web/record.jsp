<%@page import="java.sql.ResultSet"%>
<%@page import="com.zzw.Helper.HelperDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>签到记录</title>
<style type="text/css">

table {
	border: 2px #cccccc solid;
	width: 500px;
}

	td,th{
		width:50px;
		height: 30px;
		border: #cccccc 1px solid;
	}

</style>
</head>
<body>
	<% 
		String sql = null;
		String sql1 = null;
		HelperDB db = null;
		ResultSet ret = null;
		
		sql = "select * from statisttics_db";
		//根据班级名查询所有信息
		//sql1 = "select * from statisttics_db where classname='"++"'";
		db = new HelperDB(sql);
		ret = db.pst.executeQuery();
	%>
	
	<select style="width: 250px;margin-top: 50px;">
		<option>
			
		</option>
	</select>
		
	<table align="center">
		<tr>
			<th>
				<%out.print("id"); %>
			</th>
			<th>
				<%out.print("姓名"); %>
			</th>
			<th>
				<%out.print("学号"); %>
			</th>
			<th>
				<%out.print("班级"); %>
			</th>
			<th>
				<%out.print("图片"); %>
			</th>
			<th>
				<%out.print("提交时间"); %>
			</th>
		</tr>
		<%while(ret.next()){ %>
		<tr>
			<td>
				<%out.print(ret.getString(1)); %>
			</td>
			<td>
				<%out.print(ret.getString(2)); %>
			</td>
			<td>
				<%out.print(ret.getString(3)); %>
			</td>
			<td>
				<%out.print(ret.getString(4)); %>
			</td>
			<td>
				<img src="<%out.print(request.getContextPath()+ret.getString(5));%>">
			</td>
			<td>
				<%out.print(ret.getString(6)); %>
			</td>
		</tr>
		<%} %>
		
	</table>
	<%
		db.close();
		ret.close();
	%>
</body>
</html>