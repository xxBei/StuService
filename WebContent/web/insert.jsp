<%@page import="java.sql.ResultSet"%>
<%@page import="com.zzw.Helper.HelperDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>插入</title>
</head>
<body>

	<%
		request.setCharacterEncoding("utf-8");
			//Integer number = Integer.parseInt(request.getParameter("number"));
			String number = request.getParameter("number");
			String name = request.getParameter("name");
			String password = request.getParameter("password");
			String classname = request.getParameter("classname");
			
			if(name!=null){
			String sql = "insert into student_db (number,name,password,classname) values('" + number + "','" + name
					+ "','" + password + "','" + classname + "')";
			HelperDB db = new HelperDB(sql);
			boolean rst = db.pst.execute();
			db.close();
		} else {
			out.print("不能为空！");
		}
	%>

	<div align="center">
		<font size="10dp">插入学生数据</font>
	</div>
	<br>
	<form action="" method="post">
	<div align="center" style="width: 500dp">
		学号：<input type="text" name="number"><br><br>
		姓名：<input type="text" name="name"><br><br>
		密码：<input type="text" name="password"><br><br>
		班级：<input type="text" name="classname"><br><br>
		<input type="submit" value="确定" style="margin-left: -100px">
	</div>
	</form>

	
</body>
</html>