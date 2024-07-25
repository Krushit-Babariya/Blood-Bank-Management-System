package com.port.model;

import java.util.Date;

public class Camp {
	private int BID;
	private String BNAME;
	private String CNAME;
	private String LANDMARK;
	private String AREA;
	private String PINCODE;
	private String EMAIL;
	private String PHONENO;
	private Date DATE;

	public Camp() {
		super();
	}

	public Camp(int bID, String bNAME, String cNAME, String lANDMARK, String aREA, String pINCODE, String email,
			String phoneno, Date dATE) {
		super();
		BID = bID;
		BNAME = bNAME;
		CNAME = cNAME;
		LANDMARK = lANDMARK;
		AREA = aREA;
		PINCODE = pINCODE;
		EMAIL = email;
		PHONENO = phoneno;
		DATE = dATE;
	}



	public String getEMAIL() {
		return EMAIL;
	}

	public void setEMAIL(String eMAIL) {
		EMAIL = eMAIL;
	}

	public String getPHONENO() {
		return PHONENO;
	}

	public void setPHONENO(String pHONENO) {
		PHONENO = pHONENO;
	}

	public int getBID() {
		return BID;
	}

	public void setBID(int BID) {
		this.BID = BID;
	}

	public String getBNAME() {
		return BNAME;
	}

	public void setBNAME(String BNAME) {
		this.BNAME = BNAME;
	}

	public String getCNAME() {
		return CNAME;
	}

	public void setCNAME(String CNAME) {
		this.CNAME = CNAME;
	}

	public String getLANDMARK() {
		return LANDMARK;
	}

	public void setLANDMARK(String LANDMARK) {
		this.LANDMARK = LANDMARK;
	}

	public String getAREA() {
		return AREA;
	}

	public void setAREA(String AREA) {
		this.AREA = AREA;
	}

	public String getPINCODE() {
		return PINCODE;
	}

	public void setPINCODE(String PINCODE) {
		this.PINCODE = PINCODE;
	}

	public Date getDATE() {
		return DATE;
	}

	public void setDATE(Date DATE) {
		this.DATE = DATE;
	}

	@Override
	public String toString() {
		return "Camp [BID=" + BID + ", BNAME=" + BNAME + ", CNAME=" + CNAME + ", LANDMARK=" + LANDMARK + ", AREA="
				+ AREA + ", PINCODE=" + PINCODE + ", EMAIL=" + EMAIL + ", PHONENO=" + PHONENO + ", DATE=" + DATE + "]";
	}

}
