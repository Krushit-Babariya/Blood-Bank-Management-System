package com.port.servlet;

import java.io.IOException;

import com.port.dao.BloodBankDAOimpl;
import com.port.db.DBConnection;
import com.port.model.BloodBank;
import com.port.mail.Mail;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import javax.mail.MessagingException;

@WebServlet("/bankSignup")
public class BankSignup extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		try {
			String bname = req.getParameter("bname");
			String state = req.getParameter("state");
			String city = req.getParameter("city");
			String zipcode = req.getParameter("zipcode");
			String email = req.getParameter("email");
			String phoneno = req.getParameter("phoneno");
			String pass = req.getParameter("pass");
			
			HttpSession session = req.getSession();

			BloodBank bb = new BloodBank(bname, state, city, zipcode, email, phoneno, pass);

			BloodBankDAOimpl bReg = new BloodBankDAOimpl(DBConnection.getConn());

			boolean isValid = bReg.register(bb);

			if(isValid) {
				session.setAttribute("successMsg", "Registration Successful");
				
				sendEmailNotification(email);
				
				res.sendRedirect("bankSignup.jsp");
			} else {
				session.setAttribute("errorMsg", "invalid email & password");
				res.sendRedirect("bankSignup.jsp");
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
