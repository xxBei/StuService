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
	String roomName = request.getParameter("roomName");
	String ke = request.getParameter("ke");
	String state = request.getParameter("state");

	ke = "第" + ke + "节课";
	System.out.println("此次为：" + ke);

	

	//插入关键数据
	String url = null;

	//获取日期和时间
	String dateTime = null;
	String time = null;
	String days = null;
	
	String pictureUrl;
	String picUrl = request.getParameter("url");

	System.out.println("user:" + user);
	//System.out.println("image:"+image);
	System.out.print("长度：" + image.length());

	//获取教室名
	System.out.print("教室名：" + roomName);

	//获取时间在照片名称中
	dateTime = new SimpleDateFormat("yyyyMMdd_HHMMss").format(Calendar
			.getInstance().getTime());
	System.out.println("时间：" + dateTime);
	url = "/image/img/" + name + dateTime + ".jpg";
	//获取时间
	time = new SimpleDateFormat("yyyy-MM-dd HH:MM:ss").format(Calendar
			.getInstance().getTime());
	System.out.println("时间：" + time);
	//获取日期
	days = new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
	System.out.println("日期："+days);

	//创建目录
	File filePath = new File(request.getRealPath("image"));
	//判断文件夹是否存在
	if (!filePath.exists()) {
		System.out.println("目录不存在");
		filePath.mkdir();
	} else {
		System.out.println("目录存在");
	}

	//将字符串转化成图片
	BASE64Decoder decoder = new BASE64Decoder();
	//Base64解码
	byte[] b = decoder.decodeBuffer(image);
	File filePath2 = new File(request.getRealPath("/image/img/"));
	System.out.println(filePath2);
	if (!filePath2.exists()) {
		System.out.print("目录不存在");
		filePath2.mkdir();
	} else {
		System.out.print("目录已存在");
	}
	//绝对地址
	pictureUrl = request.getRealPath(url);
	OutputStream output = new FileOutputStream(new File(pictureUrl));
	output.write(b);
	output.flush();
	output.close();

	
	String sql1 = null;
	Long user1 = null;
	boolean userCf = false;
	sql1 = "select count(*) from statisttics_db where number='" + user
			+ "'";
	HelperDB db1 = new HelperDB(sql1);
	ResultSet ret1 = db1.pst.executeQuery();
	while (ret1.next()) {
		user1 = ret1.getLong(1);
	}
	db1.close();
	ret1.close();

	if (user1 == 0) {
		userCf = true;
		//向数据库插入图片位置
		request.setCharacterEncoding("utf-8");
		String sql = null;
		if (user == null) {
			System.out.print("用户名为空");
		} else {
			sql = "insert into statisttics_db (name,number,classname,images,section,time,days,roomName,state) values('"
					+ name
					+ "','"
					+ user
					+ "','"
					+ classname
					+ "','"
					+ url
					+ "','"
					+ ke
					+ "','"
					+ time
					+ "','"
					+ days
					+"','"
					+ roomName
					+"','"
					+state+ "')";
			HelperDB db = new HelperDB(sql);
			boolean ret = db.pst.execute();
			db.close();
		}
	} else {
		userCf = false;
	}
	out.print("{userCf:" + userCf+"}");
%>
