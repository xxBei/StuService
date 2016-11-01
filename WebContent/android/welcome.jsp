<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
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
	
	//通过时间判断是否在规定时间内上课
	String time1 = new  SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(Calendar.getInstance().getTime());
	System.out.println("当前时间:"+time1);
	
	String sql2 = null;
	Date time2 = null;
	sql2 = "select time from timetable_db";
	HelperDB db2 = new HelperDB(sql2);
	ResultSet ret2 = db2.pst.executeQuery();
	while(ret2.next()){
		time2 = ret2.getDate(1);
	}
	System.out.println("数据库时间:"+time2);
	db2.close();
	ret2.close();
	
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date now = df.parse(time1);     
    Date date = time2;
    long l = date.getTime()-now.getTime();
    long day=l/(24*60*60*1000);     
    long hour=(l/(60*60*1000)-day*24);     
    long min=((l/(60*1000))-day*24*60-hour*60);     
    long s=(l/1000-day*24*60*60-hour*60*60-min*60);     
    System.out.println(""+day+"天"+hour+"时"+min+"分"+s+"秒");
	
	
	
	//通过学号统计，并验证数据是否插入过数据
	String sql1 = null;
	Long user1 = null;
	boolean userCf = false; 
	sql1 = "select count(*) from statisttics_db where number='"+number+"'";
	HelperDB db1 = new HelperDB(sql1);
	ResultSet ret1 = db1.pst.executeQuery();
	while(ret1.next()){
		user1 = ret1.getLong(1);
	}
	
	db1.close();
	ret1.close();
	if(user1==0){
		userCf = true;
	}else{
		userCf = false;
	}
	out.print("{number:"+unumber+",name:"+uname+",classname:"+uclassname+",userCf:"+userCf+"}");
	System.out.print(userCf);
%>