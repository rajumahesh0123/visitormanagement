package com.springboot.busreservation.controller;


import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.busreservation.model.Bus;
import com.springboot.busreservation.model.Customer;
import com.springboot.busreservation.model.User;
import com.springboot.busreservation.service.BusService;
import com.springboot.busreservation.service.IBookingService;
import com.springboot.busreservation.service.IBusService;
import com.springboot.busreservation.service.ICustomerService;
import com.springboot.busreservation.service.IUserService;




@Controller
public class CustomerController {

	@Autowired
	ICustomerService customerService;
	
	@Autowired
	IUserService userService;
	
	@Autowired
	IBusService busService;
	
	@Autowired
	IBookingService bookingService;
	
	@RequestMapping("/register")
    public String showRegisterPage(ModelMap model)
    {
    	
        return "register";
    }
	
	@PostMapping("/register")
    public String saveRegistrationDetails(ModelMap model,@RequestParam String name,@RequestParam String mobileNumber, @RequestParam String address,
    		@RequestParam String dateOfBirth,@RequestParam String gender, @RequestParam String username, @RequestParam String password)
    {
		System.out.println("User: " + username + " password: " + password);
        if (userService.findByUsername(username)!=null)
        {
        	 model.addAttribute("register", "User Already Exists, Register again");
        	 return "login";
        }
        //if user doesn't exist
		Customer customer = new Customer();
		customer.setName(name);
		customer.setMobileNumber(mobileNumber);
		customer.setAddress(address);
		customer.setDateOfBirth(dateOfBirth);
		if (gender.equals("1")) {
			customer.setGender("Male");
		}else {
			customer.setGender("Female");
		}
		customer.setUsername(username);
		System.out.println("customer: " + customer);
		
        customerService.addCustomer(customer);
        
        
        
        
        
        User user = new User();
        user.setUsername(username);
        user.setPassword(password);
        user.setRole("1");
        userService.save(user);
        
        
        model.addAttribute("register", "Registration Successfull");
       
        return "login";
        
    }
	@RequestMapping(value = "/list-customers", method = RequestMethod.GET)
	public String displayCustomer(ModelMap model) {
		
		model.put("customers", customerService.getCustomers());
		// model.put("todos", service.retrieveTodos(name));
		return "list-customers";
	}
	
	
	@RequestMapping(value = "/list-customer", method = RequestMethod.GET)
	public String displayCustomer(ModelMap model, @RequestParam long id) {
		
		model.put("customer", customerService.getCustomerById(id));
		// model.put("todos", service.retrieveTodos(name));
		return "show-customer";
	}
	
	@GetMapping("/user-home")
    public String displayAdminPage(ModelMap model)
    {
    	System.out.println("User page: ");
    	return "user-home";
    }
	

	@GetMapping("/search-bus")
    public String displaySearchPage(ModelMap model, @RequestParam int id)
    {
		model.put("customers", customerService.getCustomerUsingId(id));
		System.out.println("customers: " + customerService.getCustomerById(id));
    	System.out.println("Search page: " + customerService.getSourceDestination());
    	model.put("sourceDestination", customerService.getSourceDestination());
    	model.put("source", customerService.getSource());
    	model.put("destination", customerService.getDestination());
    	System.out.println("source: " + customerService.getSource());
    	System.out.println("destination: " + customerService.getDestination());
    	return "search-bus";
    }

	
	@PostMapping("/search")
    public String showSearchResults(ModelMap model,@RequestParam String source, @RequestParam String destination, @RequestParam String journeyDate, @RequestParam String custId)
    {
		List<Bus> buses = new ArrayList<>();
    	System.out.println("model: " + model); 
        System.out.println("authentication done,  source : " + source + " destination: " + destination + " journeyDate: " + journeyDate + ", id: " + custId);
        System.out.println("all buses: " + busService.listAll());
		/*
		 * for (Bus b: busService.listAll()) { if ((b.getSource() + "->" +
		 * b.getDestination()).equals(srcDest)) { buses.add(b); } }
		 */
        
       for (Bus b: busService.listAll()) {
    	   System.out.println("b.getSourceTime().substring(0,10): " + b.getSourceTime().substring(0,10));
    	   if (b.getSource().equals(source) && b.getDestination().equals(destination) && b.getSourceTime().substring(0,10).equals(journeyDate)) {
    		 
    		   buses.add(b);
    	   }
       }
       model.put("customers", customerService.getCustomerUsingId(Integer.parseInt(custId)));
       model.put("buses", buses);
		 return "list-bus";
       
    }
	
	@RequestMapping(value = "/customer-profile", method = RequestMethod.GET)
	public String displayCustomerProfile(@RequestParam long id, ModelMap model) {
		model.put("customer", customerService.getCustomerById(id));
		 model.put("customers", customerService.getCustomerUsingId(id));
		return "customer-profile";
	}
	
	@RequestMapping(value = "/customer-profile", method = RequestMethod.POST)
	public String updateCustomerProfile(ModelMap model,  Customer customer, BindingResult result) {

		if (result.hasErrors()) {
			return "customer-profile";
		}
		
		Customer c = customerService.getCustomerById(customer.getId()).get();
		customer.setGender(c.getGender());
		customer.setUsername(c.getUsername());
		customerService.updateCustomer(customer);
		model.put("customers", customerService.getCustomerUsingId(customer.getId()));
		return "user-home";
	}
}
