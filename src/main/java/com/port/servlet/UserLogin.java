package com.port.servlet;

import java.io.IOException;

import com.port.dao.UserDAOimpl;
import com.port.db.DBConnection;
import com.port.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/login")
public class UserLogin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		UserDAOimpl dao = new UserDAOimpl(DBConnection.getConn());
		
		if (dao.isUserExists(email)) {
	        User user = dao.login(email, password);
	        String name = dao.getUserName(email);
	        String uid = dao.getUserId(email);

	        if (user != null) {
	            session.setAttribute("email", email);
	            session.setAttribute("name", name);
	            session.setAttribute("uid", uid);
	            session.setAttribute("user_dtl", user);
	            res.sendRedirect("user.jsp");
	        } else {
	        	session.removeAttribute("userNotExistErrMsg");
	            session.setAttribute("userErrMsg", "Invalid password");
	            res.sendRedirect("login.jsp");
	        }
	    } else {
	    	session.removeAttribute("userErrMsg");
	        session.setAttribute("userNotExistErrMsg", "User does not exist");
	        res.sendRedirect("login.jsp");
	    }
//		User user = dao.login(email, password);
//		String name = dao.getUserName(email);
//		String uid = dao.getUserId(email);
//
//		if (user != null) {
//			session.setAttribute("email", email);
//			System.out.println("Email ::: " + req.getAttribute("email"));
//			System.out.println("Emial :: "+  email);
//			session.setAttribute("name", name);
//			session.setAttribute("uid", uid);
//			session.setAttribute("user_dtl", user);
//			res.sendRedirect("user.jsp");
//		} else {
//			session.setAttribute("userErrMsg", "invalid email & password");
//			res.sendRedirect("login.jsp");
//		}

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}