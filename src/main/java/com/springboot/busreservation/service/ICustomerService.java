package com.springboot.busreservation.service;

import java.util.Date;

import java.util.List;
import java.util.Optional;

import com.springboot.busreservation.model.Customer;

public interface ICustomerService {

	List<Customer> getCustomers();
	
	Optional<Customer> getCustomerById(long id);

	void updateCustomer(Customer customer);

	void addCustomer(Customer customer);

	void deleteCustomer(long id);
	
	List<Customer> getCustomerByUsername(String username);
	
	List<Customer> getCustomerUsingId(long id);
	
	List<String> getSourceDestination();
	
	List<String> getSource();
	
	List<String> getDestination();
}