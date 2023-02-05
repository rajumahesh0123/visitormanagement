package com.springboot.busreservation.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.springboot.busreservation.model.Bus;
import com.springboot.busreservation.service.IBusService;



@Controller
public class BusController {

	@Autowired
	IBusService busService;
	

	@RequestMapping(value = "/list-buses", method = RequestMethod.GET)
	public String displayBuses(ModelMap model) {
		System.out.println("busService.listAll(): " + busService.listAll());
		model.put("buses", busService.listAll());
		// model.put("todos", service.retrieveTodos(name));
		return "list-buses";
	}

	

	@RequestMapping(value = "/add-bus", method = RequestMethod.GET)
	public String displayAddBus(ModelMap model) {
		System.out.println("adding bus");
		model.addAttribute("bus", new Bus());
		return "bus";
	}

	@RequestMapping(value = "/delete-bus", method = RequestMethod.GET)
	public String deleteBus(@RequestParam long id) {
		busService.deleteBus(id);
		// service.deleteTodo(id);
		return "redirect:/list-buses";
	}

	@RequestMapping(value = "/update-bus", method = RequestMethod.GET)
	public String displayUpdateBookPage(@RequestParam long id, ModelMap model) {
		Bus bus = busService.findById(id).get();
		System.out.println("bus: " + bus);
		model.put("bus", bus);
		return "bus";
	}

	@RequestMapping(value = "/update-bus", method = RequestMethod.POST)
	public String updateBus(ModelMap model,  Bus bus, BindingResult result) {

		if (result.hasErrors()) {
			return "bus";
		}
		
		bus.setAvailableSeats(busService.findById(bus.getId()).get().getAvailableSeats());
		busService.updateBus(bus);
		return "redirect:/list-buses";
	}

	@RequestMapping(value = "/add-bus", method = RequestMethod.POST)
	public String addBook(ModelMap model, Bus bus, BindingResult result) {
		System.out.println("model: " +model);
		System.out.println("bus: " +bus);
		System.out.println("result: " +result);
		
		System.out.println("hey");
		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());
			return "bus";
		}
		bus.setAvailableSeats(bus.getNoOfSeats());
		busService.save(bus);
		return "redirect:/list-buses";
	}
	
}
