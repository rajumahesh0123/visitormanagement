package com.visitormanagement.login.services;


import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.visitormanagement.login.model.Visitor;
import com.visitormanagement.login.repository.VisitorRepository;

@Service
public class VisitorService implements IVisitorService{

	@Autowired
	VisitorRepository visitorRepo;
	
	@Override
	public List<Visitor> listAll() {
		
		return visitorRepo.findAll();
	}

	@Override
	public void save(Visitor visitor) {
		visitorRepo.save(visitor);
		
	}
	
	@Override 
	public List<Visitor> findByMobilenumber(String mobilenumber) {
		List<Visitor> visitors = new ArrayList<>();
		for (Visitor visitor: visitorRepo.findAll()) {
			if (visitor.getMobilenumber().equals(mobilenumber)){
				visitors.add(visitor);
				
			}
		}
		return visitors;
	}
	@Override
	public Optional<Visitor> findById(long id) {
		return visitorRepo.findById(id);
		
	}

	@Override
	public void updateVisitor(Visitor visitor) {
		visitorRepo.save(visitor);
		
	}

	@Override
	public void deleteVisitor(long id) {
		visitorRepo.deleteById(id);;
		
	}
	
}

