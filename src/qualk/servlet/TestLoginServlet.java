package qualk.servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.*;
import javax.servlet.http.*;

import qualk.beans.*;
import qualk.utils.DBUtils;
import qualk.utils.MyUtils;


@WebServlet(urlPatterns={"/login2"})
public class TestLoginServlet extends HttpServlet{
	
	private static final long serialVersionUID = 1L;
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		
		RequestDispatcher dispatcher = 
				this.getServletContext().getRequestDispatcher("/WEB-INF/views/Test.jsp");
		
		dispatcher.forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
				throws ServletException, IOException{
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String rememberMe = request.getParameter("rememberMe");
		boolean remember = "Y".equals(rememberMe);
		
		User user = null; 
		boolean hasError = false; 
		String errorString = null; 
		
		if (username==null || password==null ||
				username.length()==0 || password.length()==0) {
			
			hasError = true; 
			errorString = "Username and Password required"; 
		} else {
			Connection conn = MyUtils.getStoredConnection(request);
			
			try {
				// Find user in DB
				user = DBUtils.UC_Timkiem(conn, username);
				
				if (user==null) {
					hasError = true; 
					errorString = "Username or password invalid"; 
				}
			} catch (SQLException e) {
				e.printStackTrace();
				hasError = true; 
				errorString = e.getMessage();
			}
		}
		
		// if error
		if (hasError) {
			user = new User(); 
			user.setUserName(username);
			user.setPassword(password);
			
			// Store information in request attribute, before forward
			request.setAttribute("errorString", errorString);
			request.setAttribute("user", user);
			
			RequestDispatcher dispatcher = this.getServletContext().getRequestDispatcher("/WEB-INF/views/Test.jsp");
			dispatcher.forward(request, response);
		}
		
		// if no error
		// Store user in Session
		// Redirect to another page
		else {
			HttpSession session = request.getSession(); 
			MyUtils.storeUserInfo(session, user);
			
			if (remember) {
				MyUtils.storeUserCookie(response, user); 
			} else {
				MyUtils.deleteCookie(response);
			}
			
			response.sendRedirect(request.getContextPath() + "/home");
		}
	}

}
