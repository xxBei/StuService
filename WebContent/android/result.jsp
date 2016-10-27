<%@page import="java.sql.ResultSet"%>
<%@page import="com.zzw.Helper.HelperDB"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="sun.misc.BASE64Decoder"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.OutputStream"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
	String user = request.getParameter("user");
	String name = request.getParameter("name");
	String image = request.getParameter("image");
	String classname = request.getParameter("classname");
	//获取GPS的经纬
	String latitude  = request.getParameter("latitude");
	String longitude = request.getParameter("longitude");
	
	System.out.println("纬度："+latitude);
	System.out.println("经度："+longitude);
	String url = null;
	
	String dateTime = null;	
	String time;
	
	String pictureUrl;
	String picUrl = request.getParameter("url");
	
	System.out.println("user:"+user);
	System.out.println("image:"+image);
	System.out.print("长度："+image.length());

	//获取时间在照片名称中
	dateTime = new SimpleDateFormat("yyyyMMdd_hhmmss").format(Calendar.getInstance().getTime());
	System.out.println("时间："+dateTime);
	url = "/image/img/"+name+dateTime+".jpg";
	//获取时间
	time = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(Calendar.getInstance().getTime());
	System.out.println("时间："+time);
	
	File filePath = new File(request.getRealPath("image"));
	//判断文件夹是否存在
	if(!filePath.exists()){
		System.out.println("目录不存在");
		filePath.mkdir();
	}else{
		System.out.println("目录存在");
	}
	
	//将字符串转化成图片
	BASE64Decoder decoder = new BASE64Decoder();
	//Base64解码
	byte[] b = decoder.decodeBuffer(image);
	File filePath2 = new File(request.getRealPath("/image/img/"));
	System.out.println(filePath2);
	if(!filePath2.exists()){
		System.out.print("目录不存在");
		filePath2.mkdir();
	}else{
		System.out.print("目录已存在");
	}
	//绝对地址
	pictureUrl = request.getRealPath(url);
	OutputStream output = new FileOutputStream(new File(pictureUrl));
	output.write(b);
	output.flush();
	output.close();
	
	//向数据库插入图片位置
	request.setCharacterEncoding("utf-8");
	String sql = null;
	
	if(user==null){
		System.out.print("用户名为空");
	}else{
		sql = "insert into statisttics_db (name,number,classname,images,time) values('"+name+"','"+user+"','"+classname+"','"+url+"','"+time+"')";
		HelperDB db = new HelperDB(sql);
		boolean ret = db.pst.execute();
		db.close();
	}
	
%>
