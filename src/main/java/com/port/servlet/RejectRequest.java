package com.port.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.port.dao.HomeDonorDAOImpl;
import com.port.db.DBConnection;

@WebServlet("/rejectStatus")
public class RejectRequest extends HttpServlet {
       
    public RejectRequest() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int donorID = Integer.parseInt(request.getParameter("donorID"));
		
		HomeDonorDAOImpl donorDAO = new HomeDonorDAOImpl(DBConnection.getConn());
        boolean success = donorDAO.updateStatus(donorID, "Rejected");
        
        HttpSession session = request.getSession();
        
        if (success) {
        	session.setAttribute("status", "rejected");
            //response.sendRedirect("successRequest.jsp");
        	response.sendRedirect("blood_donation_request.jsp");
        } else {
            response.sendRedirect("errorRequest.jsp");
        }
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
