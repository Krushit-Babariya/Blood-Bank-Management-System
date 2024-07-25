package com.port.dao;

import java.sql.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.port.model.BloodBank;
import com.port.model.Camp;

public class BloodBankDAOimpl implements IBloodBankDAO {

	private Connection conn;
	// private static final String CHECK_MAIL = "SELECT * FROM BBMS_BANK_DATA WHERE
	// EMAIL=?";
	private static final String GET_BANK_DETAIL = "SELECT * FROM BBMS_BANK_DATA WHERE EMAIL=?";
	private static final String CHECK_MAIL = "SELECT COUNT(*) FROM BBMS_BANK_DATA WHERE EMAIL=?";
	private static final String INSERT_BANK = "INSERT INTO BBMS_BANK_DATA(BID,BNAME,STATE,CITY,ZIPCODE,EMAIL,PHONENO,PASS) VALUES(BBMS_BANK.NEXTVAL,?,?,?,?,?,?,?)";
	private static final String CHECK_BANK = "SELECT * FROM BBMS_BANK_DATA WHERE EMAIL=? AND PASS=?";
	private static final String SELECT_BANK_NAME = "SELECT BNAME FROM BBMS_BANK_DATA WHERE EMAIL=?";
	private static final String INSERT_CAMP_DATA = "INSERT INTO BBMS_CAMP_DATA (BID, BNAME, CNAME, LANDMARK, AREA, PINCODE, DATEE, PHONENO, EMAIL) VALUES (?, ?, ?, ?, ?, ?, ?, ?,?)";
	PreparedStatement ps = null;

	public BloodBankDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

	/*
	 * public boolean checkMail(String email) {
	 * 
	 * ResultSet rs = null; try { ps = conn.prepareStatement(CHECK_MAIL);
	 * ps.setString(1, email);
	 * 
	 * rs = ps.executeQuery();
	 * 
	 * if (rs.next()) { return false; }
	 * 
	 * } catch (SQLException e) { e.printStackTrace(); }
	 * 
	 * return true; }
	 */

	public boolean checkMail(String email) {
		ResultSet rs = null;

		try {
			ps = conn.prepareStatement(CHECK_MAIL);
			ps.setString(1, email);

			rs = ps.executeQuery();

			if (rs.next()) {
				int count = rs.getInt(1);
				return count == 0;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return false;
	}

	@Override
	public boolean register(BloodBank b) {
		boolean f = false;

		try {
			if (checkMail(b.getEmail())) {
				ps = conn.prepareStatement(INSERT_BANK);
				ps.setString(1, b.getBname());
				ps.setString(2, b.getState());
				ps.setString(3, b.getCity());
				ps.setString(4, b.getZipcode());
				ps.setString(5, b.getEmail());
				ps.setString(6, b.getPhoneno());
				ps.setString(7, b.getPass());

				int res = ps.executeUpdate();

				if (res != 0) {
					f = true;
				}
			} else {
				f = false;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public BloodBank login(String bmail, String psss) {
		BloodBank bb = null;

		try {
			ps = conn.prepareStatement(CHECK_BANK);
			ps.setString(1, bmail);
			ps.setString(2, psss);

			ResultSet rs = ps.executeQuery();
			System.out.println("Resultset :: " + rs);

			if (rs.next()) { 
				bb = new BloodBank();
				bb.setBname(rs.getString(2));
				bb.setState(rs.getString(3));
				bb.setCity(rs.getString(4));
				bb.setZipcode(rs.getString(5));
				bb.setEmail(rs.getString(6));
				bb.setPhoneno(rs.getString(7));
				bb.setPass(rs.getString(8));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return bb;
	}

	public String getUserName(String email) {
		String name = null;
		try {
			ps = conn.prepareStatement(SELECT_BANK_NAME);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				name = rs.getString("BNAME");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return name;
	}

	public BloodBank getBankDetail(String email) {
		System.out.println("BloodBankDAOimpl.getBankDetail()");
		BloodBank bloodBank = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = conn.prepareStatement(GET_BANK_DETAIL);
			System.out.println("Prepared Statement getBankDetail :: " + ps);
			System.out.println("Query :: " + GET_BANK_DETAIL);
			ps.setString(1, email);
			rs = ps.executeQuery();
			System.out.println("Result Set :: " + rs);
			if (rs.next()) {
				bloodBank = new BloodBank();
				bloodBank.setBid(rs.getInt("BID"));
				bloodBank.setBname(rs.getString("BNAME"));
				bloodBank.setState(rs.getString("STATE"));
				bloodBank.setCity(rs.getString("CITY"));
				bloodBank.setZipcode(rs.getString("ZIPCODE"));
				bloodBank.setEmail(rs.getString("EMAIL"));
				bloodBank.setPhoneno(rs.getString("PHONENO"));
				bloodBank.setPass(rs.getString("PASS"));
			}
			System.out.println("Blood Bank Detail :: " + bloodBank);

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
				if (rs != null) {
					rs.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return bloodBank;
	}

	public boolean campData(int BID, String BNAME, String CNAME, String LANDMARK, String AREA, String PINCODE,
			Date DATE, String PHONE, String EMAIL) {
		PreparedStatement pstmt = null;

		try {

			System.out.println(INSERT_CAMP_DATA);
			pstmt = conn.prepareStatement(INSERT_CAMP_DATA);

			pstmt.setInt(1, BID);
			pstmt.setString(2, BNAME);
			pstmt.setString(3, CNAME);
			pstmt.setString(4, LANDMARK);
			pstmt.setString(5, AREA);
			pstmt.setString(6, PINCODE);
			pstmt.setDate(7, DATE);
			pstmt.setString(8, PHONE);
			pstmt.setString(9, EMAIL);

			int n = pstmt.executeUpdate();
			System.out.println("N ::: " + n);
			if (n == 0) {
				return false;
			} else {
				return true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			if (pstmt != null) {
				try {
					pstmt.close();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return true;
	}

	public List<Camp> getAllCamps() {
		List<Camp> camps = new ArrayList<>();
		try {
			PreparedStatement ps = conn.prepareStatement("SELECT * FROM BBMS_CAMP_DATA");
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Camp camp = new Camp();
				camp.setBID(rs.getInt("BID"));
				camp.setBNAME(rs.getString("BNAME"));
				camp.setCNAME(rs.getString("CNAME"));
				camp.setLANDMARK(rs.getString("LANDMARK"));
				camp.setAREA(rs.getString("AREA"));
				camp.setPINCODE(rs.getString("PINCODE"));
				camp.setDATE(rs.getDate("DATEE"));
				camp.setPHONENO(rs.getString("PHONENO"));
				camp.setEMAIL(rs.getString("EMAIL"));
				camps.add(camp);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return camps;
	}
	
	public String[] getEmailsByPincode(String pincode) throws SQLException {
	    List<String> emailList = new ArrayList<>();
	    String query = "SELECT EMAIL FROM BBMS_USER_DATA WHERE ZIPCODE = ?";
	    
	    try (PreparedStatement stmt = conn.prepareStatement(query)) {
	        stmt.setString(1, pincode);
	        try (ResultSet rs = stmt.executeQuery()) {
	            while (rs.next()) {
	                String email = rs.getString("email");
	                emailList.add(email);
	            }
	        }
	    }

	    String[] emails = new String[emailList.size()];
	    emails = emailList.toArray(emails);

	    return emails;
	}

}
