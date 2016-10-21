package com.zzw.Helper;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class HelperDB {

	//驱动名
	public static final String driverName = "com.mysql.jdbc.Driver";
	//数据库用户名
	public static final String userName = "root";
	//数据库密码
	public static final String userPassword = "";
	//数据库
	public static final String dbName = "signin";
	//连接字符串
	public static final String url = "jdbc:mysql://localhost:3306/"+dbName+"?characterEncoding=utf-8";
	
	public Connection connection = null;
	public Statement statement = null;
	public PreparedStatement pst = null;
	
	
	public HelperDB(String sql){
		try {
			Class.forName(driverName);
			connection = DriverManager.getConnection(url,userName,userPassword);
			pst = connection.prepareStatement(sql);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void close(){
		try {
			this.connection.close();
			this.pst.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
