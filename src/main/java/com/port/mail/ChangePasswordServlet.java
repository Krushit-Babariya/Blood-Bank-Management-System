package com.port.mail;

import java.io.IOException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.port.mail.Mail;

@WebServlet("/ChangePasswordServlet")
public class ChangePasswordServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String newPassword = request.getParameter("newPassword");

        String OTP = generateOTP();

        sendOTPEmail(email, OTP);

        HttpSession session = request.getSession();
        session.setAttribute("OTP", OTP);
        session.setAttribute("email", email);

        request.getRequestDispatcher("verifyOTP.jsp").forward(request, response);
    }

    public String generateOTP() {
        Random random = new Random();
        int otp = 100000 + random.nextInt(900000);
        return String.valueOf(otp);
    }

    public void sendOTPEmail(String email, String OTP) {
        String subject = "Password Reset OTP";
        String body = "Your OTP for password reset is: " + OTP;

        try {
            Mail.sendEmail(email, subject, body);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }
}

