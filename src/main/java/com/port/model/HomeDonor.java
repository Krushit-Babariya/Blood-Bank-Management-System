package com.port.model;

import java.util.Date;

public class HomeDonor {
	private int did;
	private String fname;
	private String lname;
	private String hno;
	private String street;
	private String zipcode;
	private Date date;
	private String status;

	public HomeDonor() {
		super();
	}
	
	public HomeDonor(int did, String fname, String lname, String hno, String street, String zipcode, Date date) {
		super();
		this.did = did;
		this.fname = fname;
		this.lname = lname;
		this.hno = hno;
		this.street = street;
		this.zipcode = zipcode;
		this.date = date;
	}

	public int getDid() {
		return did;
	}

	public void setDid(int did) {
		this.did = did;
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

	public String getHno() {
		return hno;
	}

	public void setHno(String hno) {
		this.hno = hno;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getZipcode() {
		return zipcode;
	}

	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	@Override
	public String toString() {
		return "HomeDonor [did=" + did + ", fname=" + fname + ", lname=" + lname + ", hno=" + hno + ", street=" + street
				+ ", zipcode=" + zipcode + ", date=" + date + ", status=" + status + "]";
	}

}
