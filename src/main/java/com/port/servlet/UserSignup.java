package com.port.servlet;

import java.io.IOException;

import javax.mail.MessagingException;

import com.port.dao.UserDAOimpl;
import com.port.db.DBConnection;
import com.port.mail.Mail;
import com.port.model.User;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@WebServlet("/signup")
public class UserSignup extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String fname = req.getParameter("fname");
			String lname = req.getParameter("lname");
			String country = req.getParameter("state");
			String zipcode = req.getParameter("zipcode");
			String email = req.getParameter("email");
			String pass = req.getParameter("pass");

			User newUser = new User(fname, lname, country, zipcode, email, pass);

			UserDAOimpl uReg = new UserDAOimpl(DBConnection.getConn());

			boolean isValid = uReg.register(newUser);
			
			HttpSession session = req.getSession();
			
			
			if(isValid) {
				session.setAttribute("userSignupSuccessMsg", "Registration Successful");
				sendEmailNotification(email);
				res.sendRedirect("signup.jsp");
			} else {
				session.setAttribute("userSignupErrorMsg", "invalid email & password");
				res.sendRedirect("signup.jsp");
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}
	
	private void sendEmailNotification(String recipientEmail) throws MessagingException, IOException {
        Mail mail = new Mail();
        mail.setupServerProperties();
        mail.draftEmail(recipientEmail);
        mail.sendEmail();
    }
}
