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

	ke = "第" + ke + "节课";
	System.out.println("此次为：" + ke);
	//获取GPS的经纬
	String latitude = request.getParameter("Latitude");
	String longitude = request.getParameter("Longitude");

	//定义double型的经纬度
	double lat1 = 0;
	double long1 = 0;
	double lat2 = 114.562222;
	double long2 = 38.161944;
	
	lat1 = Double.parseDouble(latitude);
	long1 = Double.parseDouble(longitude);
	System.out.println(lat1+"----------"+long1);
	double aa = 0, bb = 0, R = 0;//地球半径

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
	
	System.out.println("纬度：" + latitude);
	System.out.println("经度：" + longitude);

	//插入关键数据
	String url = null;

	String dateTime = null;
	String time;

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
			sql = "insert into statisttics_db (name,number,classname,images,section,time,roomName) values('"
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
					+ roomName + "')";
			HelperDB db = new HelperDB(sql);
			boolean ret = db.pst.execute();
			db.close();
		}
	} else {
		userCf = false;
	}
	out.print("{userCf:" + userCf + "}");
%>
