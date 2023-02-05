package com.springboot.busreservation.service;

import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.busreservation.model.Customer;
import com.springboot.busreservation.repository.CustomerRepository;


@Service
public class CustomerService implements ICustomerService {

	@Autowired
	private CustomerRepository customerRepo;

	@Override
	public List<Customer> getCustomers() {
		
		return customerRepo.findAll();
	}

	@Override
	public Optional<Customer> getCustomerById(long id) {
		return customerRepo.findById(id);
		
	}

	@Override
	public List<Customer> getCustomerByUsername(String username){
		List<Customer> customers = new ArrayList<>();
		for (Customer c: customerRepo.findAll()) {
			if (c.getUsername().equals(username)) {
				customers.add(c);
			}
		}
		return customers;
	}
	
	@Override
	public List<Customer> getCustomerUsingId(long id){
		List<Customer> customers = new ArrayList<>();
		for (Customer c: customerRepo.findAll()) {
			if (c.getId()==id) {
				customers.add(c);
			}
		}
		return customers;
	}
	
	@Override
	public void updateCustomer(Customer customer) {
		customerRepo.save(customer);
	}

	@Override
	public void addCustomer(Customer customer) {
		customerRepo.save(customer);
	}

	@Override
	public void deleteCustomer(long id) {
		Optional<Customer> customer = customerRepo.findById(id);
		if (customer.isPresent()) {
			customerRepo.delete(customer.get());
		}
	}

	public List<String> getSourceDestination(){
		return customerRepo.findSourceDestination();
		
	}
	
	public List<String> getSource(){
		return customerRepo.findSource();
		
	}
	public List<String> getDestination(){
		return customerRepo.findDestination();
		
	}
}