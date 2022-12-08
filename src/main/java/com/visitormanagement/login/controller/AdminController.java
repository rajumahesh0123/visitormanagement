package com.visitormanagement.login.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.visitormanagement.login.model.User;
import com.visitormanagement.login.model.Visitor;
import com.visitormanagement.login.services.IUserService;
import com.visitormanagement.login.services.IVisitorService;

@Controller
public class AdminController {


	@Autowired
	private IVisitorService visitorService;
	@Autowired
	private IUserService userService;
	
	RestTemplate restTemplate = new RestTemplate();
	
	
	@GetMapping("/approve-visitor")
	public String approveVisitor(ModelMap model,@RequestParam long id) {
		System.out.println("inside 1");
		restTemplate.getForObject("http://localhost:8081/approve-visitor/"+id, String.class);
		
		model.put("visitors", visitorService.listAll());
		System.out.println("inside1");
		return "admin-dashboard";
	}
	
	@GetMapping("/deny-visitor")
	public String denyVisitor(ModelMap model,@RequestParam long id) {
		System.out.println("inside 1 of deny");
		restTemplate.getForObject("http://localhost:8081/deny-visitor/"+id, String.class);
		
		
		model.put("visitors", visitorService.listAll());
		System.out.println("inside 1 of deny");
		return "admin-dashboard";
	}
}
