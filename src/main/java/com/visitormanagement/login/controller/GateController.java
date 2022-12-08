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
public class GateController {


	@Autowired
	private IVisitorService visitorService;
	@Autowired
	private IUserService userService;
	
	RestTemplate restTemplate = new RestTemplate();
	
	
	@GetMapping("/mark-visited")
	public String markVisited(ModelMap model,@RequestParam long id) {
		restTemplate.getForObject("http://localhost:8081/mark-visited/"+id, String.class);
		
		
		model.put("visitors", visitorService.listAll());
		return "gate-dashboard";
	}
	
	@GetMapping("/unmark-visited")
	public String unmarkVisited(ModelMap model,@RequestParam long id) {
		restTemplate.getForObject("http://localhost:8081/unmark-visited/"+id, String.class);
		model.put("visitors", visitorService.listAll());
		return "gate-dashboard";
	}
}
