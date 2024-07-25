package com.port.dao;

import com.port.model.User;

public interface IUserDAO {
	public boolean register(User u) throws Exception;
	public User login(String umail, String psss);
}
