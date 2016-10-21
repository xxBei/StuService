package com.zzw.Servlet;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.zzw.Helper.HelperDB;
import com.zzw.Helper.UtilUrl;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String tuser = null;
		String tpass = null;
		System.out.println("username:"+username);
		System.out.println("password:"+password);
		String sql = null;
		HelperDB db = null;
		ResultSet ret = null;
		boolean login = false;
		
		sql = "select teacherName,password from teacher_db where teacherName='"+username+"'";
		try {
			db = new HelperDB(sql);
			ret = db.pst.executeQuery();
			while(ret.next()){
				 tuser = ret.getString(1);
				 tpass = ret.getString(2);
				 System.out.println("tuser:"+tuser);
				 System.out.println("tpass:"+tpass);
				 if(tuser.equals(username) && tpass.equals(password)){
					 //重定向，也是页面跳转
					 login = true;
					
				 }else{
					 login = false;
				 }
			}
			db.close();
			ret.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(login == true){
			 response.sendRedirect(UtilUrl.Urlweb+"chose.jsp");
		}
		if(login == false){
			response.sendRedirect(UtilUrl.Urlweb+"error.jsp");
		}
	}

}
