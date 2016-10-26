<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.zzw.Helper.HelperDB"%>
<%@page import="org.w3c.dom.Document"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	//获取当前时间
	String time = null;
	time = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());
	System.out.println("当前时间："+time);
	
	//向数据库（clas_tijiao）插入教室和时间
	String classes = request.getParameter("classes");

	request.setCharacterEncoding("utf-8");
	
	String sql = "insert into clas_tijiao (classname,time) values('"+classes+"','"+time+"')";
	HelperDB db = new HelperDB(sql);
	boolean ret = db.pst.execute();
	db.close();
	
	
	out.print("{classes:"+classes+"}");
%>