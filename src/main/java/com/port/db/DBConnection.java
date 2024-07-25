package com.port.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection{

	private static Connection con;

	public static Connection getConn() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "krushit");

		} catch (Exception e) {
			e.printStackTrace();
		}

		return con;
	}

}