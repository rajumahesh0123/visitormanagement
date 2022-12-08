package com.visitormanagement.login.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.visitormanagement.login.model.User;

public interface UserRepository extends JpaRepository<User,Long> {
	List<User> findAll();
	
}
