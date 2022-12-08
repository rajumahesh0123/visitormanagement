package com.visitormanagement.login.services;

import java.util.Date;

import java.util.List;
import java.util.Optional;

import com.visitormanagement.login.model.User;
import com.visitormanagement.login.model.Visitor;

public interface IUserService {
	public List<User> listAll();
	
	public void save(User user) ;
	
	public User findByUsername(String username);	
	
	public void updateUser(User user);
	
	public void deleteUser(long id);	
	
	public boolean validateLogin (String username, String password, String role);

}