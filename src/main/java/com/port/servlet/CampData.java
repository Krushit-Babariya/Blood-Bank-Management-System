package com.port.servlet;

import java.sql.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import com.port.dao.BloodBankDAOimpl;
import com.port.db.DBConnection;

@WebServlet("/campData")
public class CampData extends HttpServlet {

	public CampData() {
		super();
	}

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();

		BloodBankDAOimpl dao = new BloodBankDAOimpl(DBConnection.getConn());

		HttpSession hs = req.getSession();

		String name = (String) hs.getAttribute("name");
		String phone = (String) hs.getAttribute("bankPHONE");
		String email = (String) hs.getAttribute("bankEMAIL");
		//System.out.println("Name ::: " + name);

		Object bankBIDObj = hs.getAttribute("bankBID");
		System.out.println("bank BID Obj ::: " + bankBIDObj);
		if (bankBIDObj instanceof Integer) {
		    Integer bankBID = (Integer) bankBIDObj;
		    int bankBIDInt = bankBID; 
		    System.out.println("Bank ID ::: " + bankBIDInt);
		} else {
		    System.out.println("Bank BID is not an Integer!");
		}

		Integer bankBID = (Integer) hs.getAttribute("bankBID");
		if (bankBID != null) {
			int BID = bankBID.intValue();
			System.out.println("Bank ID :: " + BID);

			String BNAME = name;
			String CNAME = req.getParameter("CNAME");
			String LANDMARK = req.getParameter("LANDMARK");
			String AREA = req.getParameter("AREA");
			String PINCODE = req.getParameter("PINCODE");
			String dateStr = req.getParameter("APPOINTMENTDATE");
			
			String PHONE = phone;
			String EMAIL = email;
			java.util.Date utilDate = null;
			java.sql.Date DATE = null;

			if (dateStr != null && !dateStr.isEmpty()) {
			    try {
			        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy"); 
			        utilDate = sdf.parse(dateStr);
			        DATE = new java.sql.Date(utilDate.getTime());
			    } catch (ParseException e) {
			        e.printStackTrace();
			    }
			}


			boolean result = dao.campData(BID, BNAME, CNAME, LANDMARK, AREA, PINCODE, DATE, PHONE, EMAIL);

			System.out.println("Result ::: " + result);
			if (result) {
				res.sendRedirect("success.jsp");
			} else {
				res.sendRedirect("error.jsp");
			}
		} else {
			res.sendRedirect("error.jsp");
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
