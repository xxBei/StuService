<%@page import="com.zzw.Helper.HelperDB"%>
<%@page import="java.sql.ResultSet"%>
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
	width: 860px;
}

td, th {
	height: 30px;
	border: #cccccc 1px solid;
}
</style>
</head>
<body>
	<%
		//查询节课数，班级
		String class1 = request.getParameter("class1");
		String time1 = request.getParameter("time1");
		String date1 = request.getParameter("date1");
		//关联表查数据库信息
		String sql = "select * from statisttics_db s,class_db c,timetable_db t where c.classname=s.classname and s.section=t.section and c.classname='"
				+ class1 + "' and t.section='" + time1 + "' and s.days='"+date1+"'";
		HelperDB db = new HelperDB(sql);
		ResultSet ret = db.pst.executeQuery();
	%>

	<div>
		<center>
			<font size=15px>学生信息</font>
		</center>
	</div>
	<table align="center" style="margin-top: 20px">

		<tr>
			<th>
				<%
					out.print("id");
				%>
			</th>

			<th>
				<%
					out.print("姓名");
				%>
			</th>

			<th>
				<%
					out.print("学号");
				%>
			</th>

			<th>
				<%
					out.print("班级");
				%>
			</th>
			<th>
				<%
					out.print("图片");
				%>
			</th>
			<th>
				<%
					out.print("节课数");
				%>
			</th>
			<th>
				<%
					out.print("时间");
				%>
			</th>
			<th>
				<%
					out.print("状态");
				%>
			</th>

		</tr>
		<%
			while (ret.next()) {
		%>
		<tr>
			<td style="text-align: center;">
				<%
					out.print(ret.getString(1));
				%>
			</td>
			<td style="text-align: center;">
				<%
					out.print(ret.getString(2));
				%>
			</td>
			<td style="text-align: center;">
				<%
					out.print(ret.getString(3));
				%>
			</td>
			<td style="text-align: center;">
				<%
					out.print(ret.getString(4));
				%>
			</td>
			<td style="width: 150px;height: 150px"><img
				src="<%out.print(request.getContextPath() + ret.getString(5));%>"
				width="150" height="150">
			</td>
			<td style="text-align: center;">
				<%
					out.print(ret.getString(6));
				%>
			</td>
			<td style="text-align: center;">
				<%
					out.print(ret.getString(7));
				%>
			</td>
			<td style="text-align: center;">
				<%
					out.print(ret.getString(10));
				%>
			</td>
			<%
				}
			%>
		</tr>
	</table>
</body>
</html>