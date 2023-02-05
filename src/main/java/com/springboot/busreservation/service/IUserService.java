package com.springboot.busreservation.service;

import java.util.Date;

import java.util.List;
import java.util.Optional;

import com.springboot.busreservation.model.User;


public interface IUserService {
	public List<User> listAll();
	
	public void save(User user) ;
	
	public User findByUsername(String username);	
	
	public void updateUser(User user);
	
	public void deleteUser(long id);	
	
	public boolean validateLogin (String username, String password, String role);

}