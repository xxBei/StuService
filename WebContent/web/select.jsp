<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.zzw.Helper.HelperDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>测试</title>

<style type="text/css">

table {
	border: 2px #cccccc solid;
	width: 360px;
}

	td,th{
		height: 30px;
		border: #cccccc 1px solid;
	}

</style>

</head>
<body>

	<%
		String sql = null;
		ResultSet rst = null;
		HelperDB db = null;
		sql = "select * from student_db";
		db = new HelperDB(sql);
		
		rst = db.pst.executeQuery();// 执行语句，得到结果集
		
		
	%>

	<table align="center">
	
		<tr>
			<th>
				<%out.print("id"); %>
			</th>
		
			<th>
				<%out.print("学号"); %>
			</th>
			
			<th>
				<%out.print("名字"); %>
			</th>

			<th>
				<%out.print("班级"); %>
			</th>
		</tr>
		
		<%while(rst.next()){ %>
		<tr>
			<td>
				<%
					out.print(rst.getString(1));
				%>
			</td>
			<td>
				<%
					out.print(rst.getString(2));
				%>
			</td>
			<td>
				<%
					out.print(rst.getString(3));
				%>
			</td>
			<td>
				<%
					out.print(rst.getString(4));
				%>
			</td>
			<%} %>
		</tr>		
	</table>
	<br><br>
	<div align="center">数据查询成功</div>
	<%
		rst.close();
		db.close();
	%>
	
</body>
</html>