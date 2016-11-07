<%@page import="com.zzw.Helper.HelperDB"%>
<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
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
	
	//查询教室的经纬度
		String sql2 = null;
		double latitude = 0;
		double longitude = 0;
		sql2 = "select Latitude,Longitude from classroom_db where roomName='"+cla+"'";
		HelperDB db2 = new HelperDB(sql2);
		ResultSet ret2 = db2.pst.executeQuery();
		while(ret2.next()){
			latitude = ret2.getDouble(1);
			longitude = ret2.getDouble(2);
		}
		db2.close();
		ret2.close();
	
	out.print("{classroom:"+cla+",latitude:"+latitude+",longitude:"+longitude+"}");
%>