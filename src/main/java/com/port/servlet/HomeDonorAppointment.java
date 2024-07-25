package com.port.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import com.port.dao.HomeDonorDAOImpl;
import com.port.db.DBConnection;
import com.port.model.HomeDonor;

@WebServlet("/bookAppointment")
public class HomeDonorAppointment extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String mail = (String) session.getAttribute("email");
		System.out.println("Email :: " + mail);

		String hno = req.getParameter("houseno");
		String street = req.getParameter("street");
		String area = req.getParameter("area");
		String zipcode = req.getParameter("pincode");

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-mm-dd");
		Date date = null;

		try {
			String dateString = req.getParameter("appointmentDate");
			if (dateString != null && !dateString.isEmpty()) {
				date = new Date(sdf.parse(dateString).getTime());
				System.out.println("Date in HomeDAO :: " + date);
			} else {
				date = new Date(System.currentTimeMillis());
			}
		} catch (ParseException e) {
			e.printStackTrace();
		}

		HomeDonorDAOImpl hddl = new HomeDonorDAOImpl(DBConnection.getConn());
		HomeDonor hd = hddl.bookAppointment(mail);

		
		System.out.println("Home Donor ::::" + hd);
		System.out.println("Home Donor Impl ::::" + hddl);
		
		if (hd == null) {
			session.setAttribute("errorMsg", "No appointment found for the user");
			res.sendRedirect("error.jsp");
			return;
		}

		int did = hd.getDid();
		String fname = hd.getFname();
		String lname = hd.getLname();

		HomeDonor hdd = new HomeDonor(did, fname, lname, hno, street, zipcode, date);
		System.out.println("HDD :: " + hdd);

		boolean isValid = hddl.insertHomeDonor(hdd);

		if (isValid) {
			session.setAttribute("appointmentSuccessMsg", "Registration Successful");
			res.sendRedirect("appointmentSuccess.jsp");
		} else {
			session.setAttribute("appointmentErrorMsg", "Failed to book appointment");
			res.sendRedirect("error.jsp");
		}
	}

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		doGet(req, res);
	}
}

/*
 * package com.port.servlet;
 * 
 * import jakarta.servlet.ServletException; import
 * jakarta.servlet.annotation.WebServlet; import
 * jakarta.servlet.http.HttpServlet; import
 * jakarta.servlet.http.HttpServletRequest; import
 * jakarta.servlet.http.HttpServletResponse; import
 * jakarta.servlet.http.HttpSession;
 * 
 * import java.io.IOException; import java.text.ParseException; import
 * java.text.SimpleDateFormat; import java.util.Date;
 * 
 * import com.port.dao.HomeDonorDAOImpl; import com.port.db.DBConnection; import
 * com.port.model.BloodBank; import com.port.model.HomeDonor;
 * 
 * @WebServlet("/bookAppointment") public class HomeDonorAppointment extends
 * HttpServlet {
 * 
 * protected void doGet(HttpServletRequest req, HttpServletResponse res) throws
 * ServletException, IOException {
 * 
 * String hno = req.getParameter("bname"); String street =
 * req.getParameter("state"); String area = req.getParameter("city"); String
 * zipcode = req.getParameter("zipcode");
 * 
 * 
 * java.sql.Date d = req.getParameter("appointmentDate") SimpleDateFormat sd =
 * new SimpleDateFormat("dd-MMM-yyyy"); String sd1 = sd.format(d);
 * 
 * 
 * SimpleDateFormat sd = new SimpleDateFormat("dd-MM-yyyy"); Date date = null;
 * try {
 * 
 * String dateString = req.getParameter("dateParameter");
 * 
 * if (dateString != null && !dateString.isEmpty()) { // Parse the date string
 * try { date = new SimpleDateFormat("yyyy-MM-dd").parse(dateString); // Proceed
 * with further processing using the parsed date } catch (ParseException e) {
 * e.printStackTrace(); // Handle parsing exception } } else { date = new
 * java.util.Date(); } java.sql.Date sqlDate = new
 * java.sql.Date(date.getTime());
 * 
 * } catch (Exception e) { e.printStackTrace(); }
 * 
 * HttpSession session = req.getSession(); String mail = (String)
 * session.getAttribute("email"); String uid = (String) req.getAttribute("uid");
 * 
 * HomeDonorDAOImpl hddl = new HomeDonorDAOImpl(DBConnection.getConn());
 * 
 * HomeDonor hd = hddl.bookAppointment(mail);
 * 
 * int did = hd.getDid(); String fname = hd.getFname(); String lname =
 * hd.getLname();
 * 
 * HomeDonor hdd = new HomeDonor(did, fname, lname, hno, street, zipcode, date);
 * 
 * boolean isValid = hddl.insertHomeDonor(hdd);
 * 
 * if (isValid) { session.setAttribute("succeessMsg",
 * "Registration Successful"); res.sendRedirect("success.jsp"); } else {
 * session.setAttribute("errorrMsg", "invalid email & password");
 * res.sendRedirect("error.jsp"); }
 * 
 * }
 * 
 * protected void doPost(HttpServletRequest req, HttpServletResponse res) throws
 * ServletException, IOException { doGet(req, res); }
 * 
 * }
 */