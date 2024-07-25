package com.port.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.port.model.HomeDonor;
import com.port.model.User;

import jakarta.servlet.http.Cookie;

public class UserDAOimpl implements IUserDAO {

	private Connection conn;
	private static final String CHECK_MAIL = "SELECT COUNT(*) FROM BBMS_USER_DATA WHERE EMAIL=?";
	private static final String INSERT_USER = "INSERT INTO BBMS_USER_DATA(USER_ID,FNAME,LNAME,STATE,ZIPCODE,EMAIL,PASSWORD) VALUES(BBMS_USER.NEXTVAL,?,?,?,?,?,?)";
	private static final String CHECK_USER = "SELECT * FROM BBMS_USER_DATA WHERE EMAIL=? AND PASSWORD=?";
	private static final String SELECT_NAME = "SELECT FNAME FROM BBMS_USER_DATA WHERE EMAIL=?";
	private static final String SELECT_UID = "SELECT USER_ID FROM BBMS_USER_DATA WHERE EMAIL=?";
	private static final String GET_USER_DETAIL = "SELECT * FROM BBMS_USER_DATA WHERE EMAIL=?";
	private static final String GET_USER_DONATION = "SELECT * FROM BBMS_HOME_DONOR WHERE DID=?";
	private static final String ISUSER_EXIST = "SELECT COUNT(*) FROM BBMS_USER_DATA WHERE EMAIL = ?";
	PreparedStatement ps = null;

	public UserDAOimpl(Connection conn) {
		super();
		this.conn = conn;
	}

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

	public boolean register(User u) {
		System.out.println("UserDAOimpl.register()");
		boolean f = false;

		try {
			if (checkMail(u.getEmail())) {
				ps = conn.prepareStatement(INSERT_USER);
				ps.setString(1, u.getFname());
				ps.setString(2, u.getLname());
				ps.setString(3, u.getState());
				ps.setString(4, u.getZipcode());
				ps.setString(5, u.getEmail());
				ps.setString(6, u.getPassword());

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
	
	public boolean isUserExists(String email) {
        boolean exists = false;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            stmt = conn.prepareStatement(ISUSER_EXIST);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                int count = rs.getInt(1);
                if (count > 0) {
                    exists = true;
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        
        return exists;
    }

	public User login(String umail, String psss) {
		User user = null;

		try {
			ps = conn.prepareStatement(CHECK_USER);
			ps.setString(1, umail);
			ps.setString(2, psss);

			ResultSet rs = ps.executeQuery();
			System.out.println("Result Set :: " + rs);

			while (rs.next()) {
				user = new User();
				user.setUid(rs.getInt(1));
				user.setFname(rs.getString(2));
				user.setLname(rs.getString(3));
				user.setState(rs.getString(4));
				user.setZipcode(rs.getString(5));
				user.setEmail(rs.getString(6));
				user.setPassword(rs.getString(7));
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		System.out.println("User Login ::" + user);
		return user;
	}

	public String getUserName(String email) {
		String name = null;
		try {
			ps = conn.prepareStatement(SELECT_NAME);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				name = rs.getString("FNAME");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return name;
	}

	public String getUserId(String email) {
		String name = null;
		try {
			ps = conn.prepareStatement(SELECT_UID);
			ps.setString(1, email);

			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				name = rs.getString("USER_ID");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}

		return name;
	}

	public User getUserDetail(String email) {
		System.out.println("UserDAOImpl.getUserDetail()");
		User user = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			ps = conn.prepareStatement(GET_USER_DETAIL);
			System.out.println("Prepared Statement getUserDetail :: " + ps);
			System.out.println("Query :: " + GET_USER_DETAIL);
			System.out.println("Email :: " + email);
			ps.setString(1, email);
			rs = ps.executeQuery();
			System.out.println("Result Set :: " + rs);
			if (rs.next()) {
				user = new User();
				user.setUid(rs.getInt("USER_ID"));
				user.setFname(rs.getString("FNAME"));
				user.setLname(rs.getString("LNAME"));
				user.setState(rs.getString("STATE"));
				user.setZipcode(rs.getString("ZIPCODE"));
				user.setEmail(rs.getString("EMAIL"));
			}
			System.out.println("User Detail :: " + user);

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
		return user;
	}
	
	public List<HomeDonor> getUserDonations(int donorID) {
	    System.out.println("UserDAOimpl.getUserDonations()");
	    List<HomeDonor> donations = new ArrayList<>();
	    PreparedStatement ps = null;
	    ResultSet rs = null;

	    try {
	        ps = conn.prepareStatement(GET_USER_DONATION);
	        System.out.println("Prepared Statement getUserDonations :: " + ps);
	        System.out.println("Query :: " + GET_USER_DONATION);
	        System.out.println("Donor ID :: " + donorID);
	        ps.setInt(1, donorID);
	        rs = ps.executeQuery();
	        System.out.println("Result Set :: " + rs);
	        while (rs.next()) {
	            HomeDonor hm = new HomeDonor();
	            hm.setFname(rs.getString("FNAME"));
	            hm.setLname(rs.getString("LNAME"));
	            hm.setHno(rs.getString("HNO"));
	            hm.setStreet(rs.getString("STREET"));
	            hm.setZipcode(rs.getString("ZIPCODE"));
	            hm.setStatus(rs.getString("STATUS"));
	            hm.setDate(rs.getDate("APPDATE"));
	            donations.add(hm);
	        }
	        System.out.println("User's Donations :: " + donations);

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
	    return donations;
	}


	public boolean checkOldPassword(int userid, String oldPassword) {
		boolean f = false;

		try {
			String sql = "SELECT * FROM USER_DTLS WHERE ID=? AND PASSWORD=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, userid);
			ps.setString(2, oldPassword);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}

	public boolean changePassword(int userid, String newPassword) {
		boolean f = false;

		try {
			String sql = "UPDATE USER_DTLS SET PASSWORD=? WHERE ID=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, newPassword);
			ps.setInt(2, userid);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
}
