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
	String sections = null;
	boolean section = false;
	
	String time1 = new  SimpleDateFormat("2016-11-01 HH:mm:ss").format(Calendar.getInstance().getTime());
	System.out.println("当前时间:"+time1);
	
	DateFormat df1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	Date dates = df1.parse(time1);
	Date date1 = df1.parse("2016-11-01 08:20:00");
	Date date2 = df1.parse("2016-11-01 09:15:00");
	Date date3 = df1.parse("2016-11-01 10:20:00");
	Date date4 = df1.parse("2016-11-01 11:15:00");
	Date date5 = df1.parse("2016-11-01 14:00:00");
	Date date6 = df1.parse("2016-11-01 14:55:00");
	Date date7 = df1.parse("2016-11-01 15:50:00");
	Date date8 = df1.parse("2016-11-01 16:45:00");
	 long l1 = dates.getTime()-date1.getTime();
	    long day1=l1/(24*60*60*1000);     
	    long hour1=(l1/(60*60*1000)-day1*24);     
	    long min1=((l1/(60*1000))-day1*24*60-hour1*60);     
	    long s1=(l1/1000-day1*24*60*60-hour1*60*60-min1*60);     
	    System.out.println(""+day1+"天"+hour1+"时，"+min1+"分，"+s1+"秒");
	
	if(min1>-30 && min1<6){
		sections = "1";
		System.out.println("此时能签到");
	}else{
		System.out.println("此时不能签到");
	}
	
	
	
	
	
	
	
	
	//String sql3 = null;
	//String sections1 = null;
	//sql3 = "select sections from timetable_db";
	//HelperDB db3 = new HelperDB(sql3);
	//ResultSet ret3 = db3.pst.executeQuery();
	//while(ret3.next()){
	//	sections1 = ret3.getString(1);
	//}
	//db3.close();
	//ret3.close();
	
	
	String sql2 = null;
	Date time2 = null;
	String time3 = null;
	sql2 = "select time from timetable_db";
	HelperDB db2 = new HelperDB(sql2);
	ResultSet ret2 = db2.pst.executeQuery();
	while(ret2.next()){
		time2 = ret2.getDate(1);
		time3 = ret2.getString(1);
	}
	System.out.println("数据库时间:"+time2);
	System.out.println("数据库时间---:"+time3);
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