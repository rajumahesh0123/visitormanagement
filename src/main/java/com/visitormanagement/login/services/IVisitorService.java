package com.visitormanagement.login.services;


import java.util.List;
import java.util.Optional;

import com.visitormanagement.login.model.Visitor;

public interface IVisitorService {
	public List<Visitor> listAll();
	
	public void save(Visitor visitor) ;
	
	public List<Visitor> findByMobilenumber(String mobilenumber);	
	
	public Optional<Visitor> findById(long id);
	
	void updateVisitor(Visitor visitor);
	
	void deleteVisitor(long id);
	
}