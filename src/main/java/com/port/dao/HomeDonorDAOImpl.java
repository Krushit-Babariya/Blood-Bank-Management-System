package com.port.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.port.model.HomeDonor;

import java.util.ArrayList;
import java.util.List;

public class HomeDonorDAOImpl implements IHomeDonorDAO {

	private Connection conn;
	private static final String GET_DONOR = "SELECT * FROM BBMS_USER_DATA WHERE EMAIL=?";
	private static final String INSERT_HOME_DONOR = "INSERT INTO BBMS_HOME_DONOR(DID,FNAME,LNAME,HNO,STREET,ZIPCODE,APPDATE,STATUS) VALUES(?,?,?,?,?,?,?,'NO')";
	private static final String FETCH_HOME_DONOR_REQUESTS = "SELECT * FROM BBMS_HOME_DONOR WHERE ZIPCODE=?";

	public HomeDonorDAOImpl() {
		super();
	}

	public HomeDonorDAOImpl(Connection conn) {
		super();
		this.conn = conn;
	}

	@Override
	public HomeDonor bookAppointment(String email) {
		System.out.println("HomeDonorDAOImpl.bookAppointment()");
		ResultSet rs = null;
		PreparedStatement ps = null;
		HomeDonor hr = null;
		try {
			ps = conn.prepareStatement(GET_DONOR);
			ps.setString(1, email);
			rs = ps.executeQuery();
			System.out.println("Result Set :: " + rs);

			if (rs.next()) {
				hr = new HomeDonor();
				hr.setDid(rs.getInt(1));
				hr.setFname(rs.getString(2));
				hr.setLname(rs.getString(3));
			}

			System.out.println("Home Donor bookAppointment :: " + hr);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return hr;
	}

	public boolean insertHomeDonor(HomeDonor hd) {
		System.out.println("HomeDonorDAOImpl.insertHomeDonor()");
		PreparedStatement ps = null;
		boolean f = false;
		try {
			ps = conn.prepareStatement(INSERT_HOME_DONOR);
			ps.setInt(1, hd.getDid());
			ps.setString(2, hd.getFname());
			ps.setString(3, hd.getLname());
			ps.setString(4, hd.getHno());
			ps.setString(5, hd.getStreet());
			ps.setString(6, hd.getZipcode());

			java.util.Date utilDate = hd.getDate();
			java.sql.Date sqlDate = new java.sql.Date(utilDate.getTime());
			ps.setDate(7, sqlDate);
			System.out.println("Date :: " + sqlDate.toString());

			int res = ps.executeUpdate();

			if (res != 0) {
				f = true;
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return f;
	}

	public List<HomeDonor> selectDonor(String zipCode) {
		System.out.println("HomeDonorDAOImpl.selectDonor()");
		System.out.println("ZIP CODE  :: " + zipCode);
		List<HomeDonor> donors = new ArrayList<>();
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			ps = conn.prepareStatement(FETCH_HOME_DONOR_REQUESTS);
			System.out.println("FETCH_HOME_DONOR_REQUESTS :: " + FETCH_HOME_DONOR_REQUESTS);
			ps.setString(1, zipCode);

			rs = ps.executeQuery();

			while (rs.next()) {
				HomeDonor hr = new HomeDonor();
				hr.setDid(rs.getInt(1));
				hr.setFname(rs.getString(2));
				hr.setLname(rs.getString(3));
				hr.setHno(rs.getString(4));
				hr.setStreet(rs.getString(5));
				hr.setZipcode(rs.getString(6));
				hr.setDate(rs.getDate(7));
				hr.setStatus(rs.getString(8));
				donors.add(hr);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ps != null) {
					ps.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return donors;
	}

	public boolean updateStatus(int donorID, String status) {
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE BBMS_HOME_DONOR SET STATUS = ? WHERE DID = ?");
			ps.setString(1, status);
			ps.setInt(2, donorID);
			int rowsUpdated = ps.executeUpdate();
			return rowsUpdated > 0;
		} catch (SQLException e) {
			e.printStackTrace();
			return false;
		}
	}

}
