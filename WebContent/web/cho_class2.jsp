<%@page import="org.w3c.dom.Document"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	String classes1 = request.getParameter("classes");
	String queding = request.getParameter("sure");
	System.out.println("id名为："+classes1);
	System.out.println("确定名为："+queding);

%>