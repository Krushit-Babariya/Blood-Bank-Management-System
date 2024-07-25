package com.port.model;

public class BloodBank {
	private int bid;
	private String bname;
	private String state;
	private String city;
	private String zipcode;
	private String email;
	private String phoneno;
	private String pass;
	
	
	public BloodBank() {
		super();
	}

	public BloodBank(String bname, String state, String city, String zipcode, String email, String phoneno,
			String pass) {
		super();
		this.bname = bname;
		this.state = state;
		this.city = city;
		this.zipcode = zipcode;
		this.email = email;
		this.phoneno = phoneno;
		this.pass = pass;
	}
	
	public int getBid() {
		return bid;
	}
	public void setBid(int bid) {
		this.bid = bid;
	}
	public String getBname() {
		return bname;
	}
	public void setBname(String bname) {
		this.bname = bname;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
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
	public String getPhoneno() {
		return phoneno;
	}
	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}

	@Override
	public String toString() {
		return "BloodBank [bid=" + bid + ", bname=" + bname + ", state=" + state + ", city=" + city + ", zipcode="
				+ zipcode + ", email=" + email + ", phoneno=" + phoneno + ", pass=" + pass + "]";
	}
	
	
	
	
}
