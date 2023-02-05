package com.springboot.busreservation.controller;


import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.springboot.busreservation.service.ICustomerService;
import com.springboot.busreservation.service.IUserService;


@Controller
public class LoginController
{
    @Autowired
    IUserService userService;

    @Autowired
    ICustomerService customerService;
    
    
    @GetMapping("/")
    public String showLoginPage(ModelMap model)
    {
    	System.out.println("login page: " + model);
        return "login";
    }
    
    @GetMapping("/admin-home")
    public String displayAdminPage(ModelMap model)
    {
    	System.out.println("Admin page: ");
    	return "admin-home";
    }
   
    @PostMapping("/login")
    public String showMainHomePageWhenLogin(ModelMap model,@RequestParam String username,@RequestParam String password, @RequestParam String role)
    {
    	System.out.println("model: " + model); 
        System.out.println("authentication done, username: " + username + " password: " + password + " role: " + role);

        model.put("username", "Admin");
        if (userService.validateLogin(username, password, role)) {
			
	        if (role.equals("2")) {
	    		System.out.println("Auhenticated, admin");
	    		return "admin-home";
	        }
	        
	        else if (role.equals("1")) {
	        	model.put("customers", customerService.getCustomerByUsername(username));
	        	System.out.println("customers: " + customerService.getCustomerByUsername(username));
	    		System.out.println("Authenticated, User");
	    		return "user-home";
	        	
	        }
	       
		}
		else {
			model.addAttribute("error", "Invalid Login Credentials!!");
		}
		 return "login";
       
    }
    @RequestMapping("/home")
    public String showHomePage(ModelMap model)
    {
    	
        return "home";
    }
    
    @RequestMapping("/admin-home")
    public String showAdminPage(ModelMap model)
    {
    	
        return "admin-home";
    }
    
    
    @GetMapping("/logout")
    public String displayLogin(ModelMap model)
    {
    	System.out.println("login page: " + model);
        return "login";
    }


}
