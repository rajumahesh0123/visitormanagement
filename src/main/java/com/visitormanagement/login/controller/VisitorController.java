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

import com.visitormanagement.login.model.User;
import com.visitormanagement.login.model.Visitor;
import com.visitormanagement.login.services.IUserService;
import com.visitormanagement.login.services.IVisitorService;

@Controller
public class VisitorController {


	@Autowired
	private IVisitorService visitorService;
	@Autowired
	private IUserService userService;
	

	
	@GetMapping("/register")
	public String displayRegisterPage(ModelMap model) {
		System.out.println("adding visitor");
		model.addAttribute("register", new Visitor());
		return "register";
	}
	
	@PostMapping("/register")
    public String saveRegistrationDetails(ModelMap model,@RequestParam String name,@RequestParam String mobilenumber, @RequestParam String address,@RequestParam String idNumber,@RequestParam String dateOfVisit)
    {
		Visitor visitor = new Visitor();
        visitor.setName(name);
        visitor.setMobilenumber(mobilenumber);
        visitor.setAddress(address);
        visitor.setIdNumber(idNumber);
        visitor.setDateOfVisit(dateOfVisit);
        
        
        
        System.out.println("Visitor: " + visitor);
        visitorService.save(visitor);
        
        
        
        System.out.println("User: " + mobilenumber + " password: " + idNumber);
        User user = new User();
        user.setUsername(mobilenumber);
        user.setPassword(idNumber);
        user.setRole("1");
        userService.save(user);
        
        
        model.addAttribute("register", "Registration Successfull");
       
        return "login";
        
    }
	
	@RequestMapping(value = "/update-visitor", method = RequestMethod.GET)
	public String displayUpdatePage(@RequestParam long id, ModelMap model) {
		Visitor visitor = visitorService.findById(id).get();
		model.put("register", visitor);
		return "register";
	}
	
	@PostMapping("/update-visitor")
	public String updateVisitor(ModelMap model,@RequestParam long id, @RequestParam String name, @RequestParam String mobilenumber, @RequestParam String address,@RequestParam String idNumber,@RequestParam String dateOfVisit) {

		//get the user id registered with the mobilenumber before editing
		String username = visitorService.findById(id).get().getMobilenumber();
		//update user with the latest username and password
		User user = new User();
		user.setId(userService.findByUsername(username).getId());
		user.setUsername(mobilenumber);
		user.setPassword(idNumber);
		user.setRole("1");
		userService.updateUser(user);
		
		
		Visitor visitor = new Visitor();
		visitor.setId(id);
        visitor.setName(name);
        visitor.setMobilenumber(mobilenumber);
        visitor.setAddress(address);
        visitor.setIdNumber(idNumber);
        visitor.setDateOfVisit(dateOfVisit);
        
		visitorService.updateVisitor(visitor);
		
		model.put("visitors", visitorService.findByMobilenumber(mobilenumber));
		return "visitor-dashboard";
	}
	
	@RequestMapping(value = "/delete-visitor", method = RequestMethod.GET)
	public String deleteVisitor(ModelMap model, @RequestParam long id) {
		String username = visitorService.findById(id).get().getMobilenumber();
		userService.deleteUser(userService.findByUsername(username).getId());
		visitorService.deleteVisitor(id);
		
		return "login";
	}
}
