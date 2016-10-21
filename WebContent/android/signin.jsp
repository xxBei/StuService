<%@page import="java.sql.ResultSet"%>
<%@page import="com.zzw.Helper.HelperDB"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

	
	
	
	<%	
		
		String sql = null;
		ResultSet ret = null;	
		boolean login = false;
		
		String user =request.getParameter("suser");
		String password = request.getParameter("spassword");
		
		sql = "select user,password from signin_db where user='"+user+"'";
		HelperDB db = new HelperDB(sql);
		ret = db.pst.executeQuery();
		
	while(ret.next()){ 
		String userx = ret.getString(1);
		String pass = ret.getString(2);
		
		System.out.print("user:"+userx+",");
		System.out.print("password:"+pass+"/");
		
		if(pass.equals(password)){
			login = true;
		}else{
			login = false;
		}
	} 
		ret.close();
		db.close();
		
		out.print("{login:"+login+",user:"+user+"}");
	%>	
	
