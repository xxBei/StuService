<%@page import="org.w3c.dom.Document"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<% 
	String classes = request.getParameter("classes");
	
	String sql = "insert into clas_tijiao";
	
	out.print("{classes:"+classes+"}");
%>