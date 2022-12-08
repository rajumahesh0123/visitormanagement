package com.visitormanagement.login.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.boot.context.properties.bind.DefaultValue;

@Entity
@Table(name = "visitor")
public class Visitor {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private long id;

	private String name;

	private String mobilenumber;
	
	private String address;
	
	private String idNumber;
	
	private String dateOfVisit;
	
	
	private int approvedStatus = 0;
	
	private int visited = 0; 

	public int getVisited() {
		return visited;
	}

	public void setVisited(int visited) {
		this.visited = visited;
	}

	public int getApprovedStatus() {
		return approvedStatus;
	}

	public void setApprovedStatus(int approvedStatus) {
		this.approvedStatus = approvedStatus;
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMobilenumber() {
		return mobilenumber;
	}

	public void setMobilenumber(String mobilenumber) {
		this.mobilenumber = mobilenumber;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getIdNumber() {
		return idNumber;
	}

	public void setIdNumber(String idNumber) {
		this.idNumber = idNumber;
	}

	public String getDateOfVisit() {
		return dateOfVisit;
	}

	public void setDateOfVisit(String dateOfVisit) {
		this.dateOfVisit = dateOfVisit;
	}

	@Override
	public String toString() {
		return "Visitor [id=" + id + ", name=" + name + ", mobilenumber=" + mobilenumber + ", address=" + address
				+ ", idNumber=" + idNumber + ", dateOfVisit=" + dateOfVisit + ", approvedStatus=" + approvedStatus + "]";
	}

	
	
	

}