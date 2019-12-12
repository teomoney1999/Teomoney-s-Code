package qualk.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import qualk.beans.*;
import qualk.utils.*;

@WebServlet("/userinfo")
public class UserInfo extends HttpServlet{
	
	private static final long serialVersionUID = 1L; 
	
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException{
		
		HttpSession session = req.getSession();
		
		Connection conn = MyUtils.getStoredConnection(req);
		
		TeacherCV detailInfo = new TeacherCV();
		
		User loginedUser = MyUtils.getLoginedUser(session);
		
		RequestDispatcher dispatcher = null;
		
		// Not login yet
		if (loginedUser == null) {
			resp.sendRedirect(req.getContextPath() + "/login");
			return;
		}
		
		// Store information in request attribute before forward

		req.setAttribute("user", loginedUser);
//		System.out.println(loginedUser.getiD());
		try {
		    detailInfo = DBUtils.UC_TimKiemChiTiet(conn, loginedUser.getiD());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		req.setAttribute("detailInfo", detailInfo);
		
		dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/teacherCV.jsp");
		dispatcher.forward(req, resp); 
	}
	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException{
		doGet(req, resp);
	}
}
