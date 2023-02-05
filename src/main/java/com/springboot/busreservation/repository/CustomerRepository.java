package com.springboot.busreservation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.springboot.busreservation.model.Bus;
import com.springboot.busreservation.model.Customer;

public interface CustomerRepository extends JpaRepository<Customer, Long>{
	List<Customer> findAll();
	
	@Query(value = "select distinct concat(source, '->',destination) from bus", nativeQuery = true)
	List<String> findSourceDestination();
	
	@Query(value = "select distinct source from bus", nativeQuery = true)
	List<String> findSource();
	
	@Query(value = "select distinct destination from bus", nativeQuery = true)
	List<String> findDestination();
	
}
