package com.port.mail;

import java.io.IOException;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

import com.port.model.BloodBank;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Mail")
public class Mail extends HttpServlet {

	private Session newSession = null;
	private MimeMessage mimeMessage = null;

	public void sendEmail() throws MessagingException {
		String fromUser = "indian.red.cross.in@gmail.com";
		String fromUserPassword = "qjawsbalasifypda";
		String emailHost = "smtp.gmail.com";
		Transport transport = newSession.getTransport("smtp");
		transport.connect(emailHost, fromUser, fromUserPassword);
		transport.sendMessage(mimeMessage, mimeMessage.getAllRecipients());
		transport.close();
		System.out.println("Email successfully sent!!!");
	}

	public static void sendEmail(String recipientEmail, String subject, String body) throws MessagingException {
		Session newSession = null;
		MimeMessage mimeMessage = null;

		try {
			Properties properties = System.getProperties();
			properties.put("mail.smtp.port", "587");
			properties.put("mail.smtp.auth", "true");
			properties.put("mail.smtp.starttls.enable", "true");
			newSession = Session.getDefaultInstance(properties, null);
			mimeMessage = new MimeMessage(newSession);
			mimeMessage.setFrom(new InternetAddress("indian.red.cross.in@gmail.com"));
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
			mimeMessage.setSubject(subject);

			MimeBodyPart bodyPart = new MimeBodyPart();
			bodyPart.setContent(body, "text/html");
			MimeMultipart multiPart = new MimeMultipart();
			multiPart.addBodyPart(bodyPart);
			mimeMessage.setContent(multiPart);

			Transport.send(mimeMessage);
			System.out.println("Email successfully sent to: " + recipientEmail);
		} finally {
			if (newSession != null) {
				newSession = null;
			}
		}
	}

	public MimeMessage draftEmail(String recipientEmail) throws AddressException, MessagingException, IOException {
		String emailSubject = "Welcome to #Save Life Campaign";
		String emailBody = "<html><body>" + "<h2>Hello,</h2>" + "<p>Welcome to Indian Red Cross Society!</p>"
				+ "<p>We are thrilled to have you join our #Save Life Campaign.</p>"
				+ "<p>Best wishes on your journey to make a positive impact on the world!!!</p>";

		mimeMessage = new MimeMessage(newSession);
		mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(recipientEmail));
		mimeMessage.setSubject(emailSubject);

		MimeBodyPart bodyPart = new MimeBodyPart();
		bodyPart.setContent(emailBody, "text/html");
		MimeMultipart multiPart = new MimeMultipart();
		multiPart.addBodyPart(bodyPart);
		mimeMessage.setContent(multiPart);
		return mimeMessage;
	}

	public MimeMessage draftEmergencyEmail(String[] recipients, String bloodGroup, int units, String emergencyMessage,
			HttpSession session) throws AddressException, MessagingException, IOException {

		BloodBank bank = (BloodBank) session.getAttribute("bloodBankData");

		String emailSubject = "Emergency Blood Request: " + bloodGroup + " (" + units + " units)";
		String emailBody = "<html><body>" + "<h2>Emergency Blood Request</h2>" + "<p>Urgent Blood Needed!</p>"
				+ "<p><strong>Blood Group:</strong> " + bloodGroup + "</p>" + "<p><strong>Units Required:</strong> "
				+ units + "</p>" + "<p><strong>Emergency Message:</strong></p>" + "<p>" + emergencyMessage
				+ " if you or anyone from your contact are able to donate then please contact the below blood bank, so we can reach you as soon as possible."
				+ "</p>" + "<p><strong>Bank Details:</strong></p>" + "<p>Bank Name: " + bank.getBname() + "</p>"
				+ "<p>Phone No: " + bank.getPhoneno() + "</p>" + "</body></html>";

		mimeMessage = new MimeMessage(newSession);

		for (String recipient : recipients) {
			mimeMessage.addRecipient(Message.RecipientType.TO, new InternetAddress(recipient));
		}
		mimeMessage.setSubject(emailSubject);

		MimeBodyPart bodyPart = new MimeBodyPart();
		bodyPart.setContent(emailBody, "text/html");
		MimeMultipart multiPart = new MimeMultipart();
		multiPart.addBodyPart(bodyPart);
		mimeMessage.setContent(multiPart);

		return mimeMessage;
	}

	public void setupServerProperties() throws MessagingException {
		Properties properties = System.getProperties();
		properties.put("mail.smtp.port", "587");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		newSession = Session.getDefaultInstance(properties, null);
	}

}
