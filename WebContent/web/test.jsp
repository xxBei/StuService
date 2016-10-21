<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
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
		//驱动包名
		String driverName = "com.mysql.jdbc.Driver";
		//数据库用户名
		String userName = "root";
		//数据库密码
		String userPassword = "";
		//数据库名
		String dbName = "spring";
		//表名
		String tableName = "user";
		//连接字符串
		String url = "jdbc:mysql://localhost:3306/"+dbName +"?user="+userName + "&password=" + userPassword;
		
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		Connection connection = DriverManager.getConnection(url);
		Statement statement = connection.createStatement();
		String sql = "select * from user";
		ResultSet rs = statement.executeQuery(sql);
	%>
	<br>
	<br>
	
	<table align="center">
	
		<tr>
			<th>
				<%
					out.print("编号");
				%>
			</th>
			<th>
				<%
					out.print("名字");
				%>
			</th>
			<th>
				<%
					out.print("密码");
				%>
			</th>
			<th>
				<%out.print("班级"); %>
			</th>
		</tr>
		
		<%
			while(rs.next()){
		%>
		
		<tr>
			<td>
				<%
					out.print(rs.getString(1));
				%>
			</td>
			<td>
				<%
					out.print(rs.getString(2));
				%>
			</td>
			<td>
				<%
					out.print(rs.getString(3));
				%>
			</td>
			<td>
				<%
					out.print(rs.getString(4));
				%>
			</td>
		</tr>
		
		<%} %>
	</table>
	
	<div align="center">
		<br><br><br>
		<%
			out.print("数据查询成功");
		%>
	</div>
	
		<%
			rs.close();
			statement.close();
			connection.close();
		%>
</body>
</html>
