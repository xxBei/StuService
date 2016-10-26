<%@page import="com.zzw.Helper.HelperDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	
	String sql = null;
	ResultSet ret = null;
	String cla = null;
	//String classes = request.getParameter("classes");
	
	sql = "select classname from clas_tijiao";
	HelperDB db = new HelperDB(sql);
	ret = db.pst.executeQuery();
	
	while(ret.next()){
		cla = ret.getString(1);
	}
	db.close();
	ret.close();
	
	out.print("{classroom:"+cla+"}");
%>