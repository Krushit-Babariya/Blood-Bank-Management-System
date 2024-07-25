package com.port.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

import com.port.dao.BloodBankDAOimpl;
import com.port.db.DBConnection;
import com.port.mail.Mail;
import com.port.model.BloodBank;

import javax.mail.MessagingException;

@WebServlet("/EmergencyServletRequest")
public class EmergencyRequest extends HttpServlet {

    protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        try {
            HttpSession hss = req.getSession(); // Initialize session here
            String bloodGroup = req.getParameter("bloodGroup");
            int units = Integer.parseInt(req.getParameter("units"));
            String emergencyMessage = req.getParameter("emergencyMessage");
            String pincode = req.getParameter("pincode");

            BloodBank bank = (BloodBank) hss.getAttribute("bloodBankData");

            BloodBankDAOimpl bloodBankDAO = new BloodBankDAOimpl(DBConnection.getConn());
            String[] recipients = bloodBankDAO.getEmailsByPincode(bank.getZipcode());

            sendEmergencyEmail(recipients, bloodGroup, units, emergencyMessage, hss);

            res.sendRedirect("emergencyRequestSuccess.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            res.sendRedirect("emergencyRequestError.jsp");
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    private void sendEmergencyEmail(String[] recipients, String bloodGroup, int units, String emergencyMessage, HttpSession session)
            throws MessagingException, IOException {
        Mail mail = new Mail();
        mail.setupServerProperties();
        mail.draftEmergencyEmail(recipients, bloodGroup, units, emergencyMessage, session);
        mail.sendEmail();
    }
}
