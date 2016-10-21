<%@page import="java.sql.ResultSet"%>
<%@page import="com.zzw.Helper.HelperDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	String sql = null;
	ResultSet ret = null;
	String unumber = null;
	String uname = null;
	String uclassname = null;
	
	String number = request.getParameter("number");
	String name = request.getParameter("name");
	String classname = request.getParameter("classname");
	
	sql = "select number,name,classname from student_db where number='"+number+"'";
	HelperDB db = new HelperDB(sql);
	ret = db.pst.executeQuery();
	
	while(ret.next()){
		unumber = ret.getString(1);
		uname = ret.getString(2);
		uclassname = ret.getString(3);
		
		System.out.print("number:"+unumber+",");
		System.out.print("name:"+uname+",");
		System.out.println("classname:"+uclassname);
	}
	ret.close();
	db.close();
	out.print("{number:"+unumber+",name:"+uname+",classname:"+uclassname+"}");
	
%>