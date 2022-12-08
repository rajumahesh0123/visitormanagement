package com.visitormanagement.login.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.visitormanagement.login.services.IUserService;
import com.visitormanagement.login.services.IVisitorService;
import com.visitormanagement.login.services.VisitorService;

@Controller
public class LoginController {

	@Autowired
	private IUserService userService;
	
	@Autowired
	private IVisitorService visitorService;
	
	
	@GetMapping("/")
	public String welcome() {
		return "login";
	}
	
	@PostMapping("/login")
    public String showMainHomePageWhenLogin(ModelMap model,@RequestParam String username,@RequestParam String password, @RequestParam String role)
    {
        
        System.out.println("authentication: " + username + " " + password + " role: " + role);
		
		if (userService.validateLogin(username, password, role)) {
			
	        if (role.equals("3")) {
	        	
	        	System.out.println("visitors: " + visitorService.listAll());
	        	model.put("visitors", visitorService.listAll());
	    		System.out.println("Auhenticated, admin");
	    		return "admin-dashboard";
	        }
	        
	        else if (role.equals("2")) {
	        	model.put("visitors", visitorService.listAll());
	    		System.out.println("Authenticated, gate");
	    		return "gate-dashboard";
	        	
	        }
	        else if (role.equals("1")) {
	        
	        	model.put("visitors", visitorService.findByMobilenumber(username));
        		System.out.println("Authenticated, visitor");
        		return "visitor-dashboard";
	        	
	        }
		}
		else {
			model.addAttribute("error", "Invalid Login Credentials!!");
		}
		 return "login";
	       
		
    }
}
