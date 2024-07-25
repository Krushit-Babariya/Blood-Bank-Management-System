package com.port.model;

public class User {
	private int uid;
	private String fname;
	private String lname;
	private String state;
	private String zipcode;
	private String email;
	private String password;

	public User() {
		super();
	}

	public User(String fname, String lname, String state, String zipcode, String email, String password) {
		super();
		this.fname = fname;
		this.lname = lname;
		this.state = state;
		this.zipcode = zipcode;
		this.email = email;
		this.password = password;
	}

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "User [uid=" + uid + ", fname=" + fname + ", lname=" + lname + ", state=" + state + ", zipcode="
				+ zipcode + ", email=" + email + ", password=" + password + "]";
	}



}
