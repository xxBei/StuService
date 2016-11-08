<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>

    <%
	  //定义double型的经纬度
	  	double lat1 = 114.562222;
	  	double long1 = 38.161944;
	  	double lat2 = 114.568333;
	  	double long2 = 38.162777;
	  	
	  	System.out.println(lat1+"----------"+long1);
	  	double aa = 0, bb = 0, R = 0;
	
	    //地球半径（单位：米）
	  	R = 6378137;
	
	  	lat1 = lat1 * Math.PI / 180.0;
	  	lat2 = lat2 * Math.PI / 180.0;
	
	  	//两点纬度差
	  	aa = lat1 - lat2;
	  	//两点经度差
	  	bb = (long1 - long2) * Math.PI / 180.0;
	
	  	double d = 0;
	  	double sa2 = 0, sb2 = 0;
	
	  	sa2 = Math.sin(aa / 2.0); 
	  	sb2 = Math.sin(bb / 2.0);
	
	  	d = 2
	  			* R
	  			* Math.asin(Math.sqrt(sa2 * sa2 + Math.cos(lat1)
	  					* Math.cos(lat2) * sb2 * sb2));
	
	
	  	System.out.println("--------两者距离为："+d);
	  	
    
    %>