package com.port.dao;

import com.port.model.BloodBank;

public interface IBloodBankDAO {
	public boolean register(BloodBank u) throws Exception;
	public BloodBank login(String bid, String psss);
}
