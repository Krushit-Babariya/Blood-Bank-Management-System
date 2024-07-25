package com.port.servlet;

import java.io.IOException;

import com.port.dao.BloodBankDAOimpl;
import com.port.db.DBConnection;
import com.port.model.BloodBank;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/bankLogin")
public class BankLogin extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		HttpSession session = req.getSession();

		BloodBankDAOimpl dao = new BloodBankDAOimpl(DBConnection.getConn());
		BloodBank user = dao.login(email, password);
		String name = dao.getUserName(email);
		BloodBank bb = dao.getBankDetail(email);
		
		System.out.println("Bank Details :: " + bb);
				
		System.out.println("User :: " + user);
		if (user != null) {
			session.setAttribute("name", name);
			session.setAttribute("bankPincode", bb.getZipcode());
			session.setAttribute("bankBID", bb.getBid());
			session.setAttribute("bankPHONE", bb.getPhoneno());
			session.setAttribute("bankEMAIL", bb.getEmail());
			session.setAttribute("bloodBankData", bb);
			System.out.println("Name :: "  +  session.getAttribute("name"));
			System.out.println("Bank Pincode :: "  +  session.getAttribute("bankPincode"));
			System.out.println("BID :: " + bb.getBid());
			res.sendRedirect("bank.jsp");
		} else {
			session.setAttribute("errorMsg", "invalid email & password");
			res.sendRedirect("bankLogin.jsp");
		}

	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}

}