<%@page import="com.zzw.Helper.HelperDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>通过时间查询</title>
<script type="text/javascript" src="../My97DatePicker/WdatePicker.js"></script>
</head>
<body>
	<div style="width: 100%">
		<form action="cla_select1.jsp">
			<center>

				<br><br>
				 选择日期： <input type="text" class="Wdate"
				onfocus="WdatePicker({lang:'zh-cn'})" name="date1"/>
				 
				<br><br> 选择时间：
				<%
					String sql1 = null;
					HelperDB db1 = null;
					ResultSet ret1 = null;
					sql1 = "select section from timetable_db";
					db1 = new HelperDB(sql1);
					ret1 = db1.pst.executeQuery();
				%>
				<select style="width: 250px; margin-top: 50px;" name="time1">
					<%
						while (ret1.next()) {
					%>
					<option>
						<%
							out.print(ret1.getString(1));
						%>
					</option>
					<%
						}
					%>
				</select>
				<%
					db1.close();
					ret1.close();
				%>
				<br> <br> 选择班级：
				<%
				 	String sql = null;
				 	HelperDB db = null;
				 	ResultSet ret = null;
				 	sql = "select classname from class_db";
				 	db = new HelperDB(sql);
				 	ret = db.pst.executeQuery();
				 %>
				<select style="width: 250px; margin-top: 50px;" name="class1">
					<%
						while (ret.next()) {
					%>
					<option>
						<%
							out.print(ret.getString(1));
						%>
					</option>
					<%
						}
					%>
				</select>
				<%
					db.close();
					ret.close();
				%>
				<br> <br> <input type="submit" value="确定" />
			</center>
		</form>
	</div>
</body>
</html>