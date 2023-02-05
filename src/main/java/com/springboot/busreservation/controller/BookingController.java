package com.springboot.busreservation.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.springboot.busreservation.model.BookingDetails;
import com.springboot.busreservation.model.Bus;
import com.springboot.busreservation.model.JourneyDetails;
import com.springboot.busreservation.service.IBookingService;
import com.springboot.busreservation.service.IBusService;
import com.springboot.busreservation.service.ICustomerService;



@Controller
public class BookingController {
	
	@Autowired
	IBusService busService;
	
	@Autowired
	IBookingService bookingService;
	
	@Autowired
	ICustomerService customerService;
	
	RestTemplate restTemplate = new RestTemplate();
	
	@RequestMapping(value = "/book-ticket", method = RequestMethod.POST)
	public String addBooking(ModelMap model, BookingDetails bookingDetails, BindingResult result, @RequestParam int id) {
		System.out.println("model: " +model);
		System.out.println("id: " + id);
		if (result.hasErrors()) {
			System.out.println(result.getAllErrors());
			return "book-ticket";
		}
		bookingDetails.setBusNumber(bookingDetails.getBusNumber().substring(0,bookingDetails.getBusNumber().indexOf(",")));
		System.out.println("bookingDetails: " +bookingDetails);
		bookingDetails.setAmount((busService.findById(id).get().getFare())*Integer.parseInt(bookingDetails.getNoOfTickets()));
		bookingService.saveBookings(bookingDetails);
		model.put("customers", customerService.getCustomerUsingId(bookingDetails.getCustID()));
		return "redirect:/pending-bookings?id=" + bookingDetails.getCustID();
	}
	
	@RequestMapping(value = "/book-ticket", method = RequestMethod.GET)
	public String displayBookTicketPage(@RequestParam long id,@RequestParam String custId, ModelMap model) {
		Bus bus = busService.findById(id).get();
		System.out.println("custId: " + custId);
		BookingDetails bookingDetails = new BookingDetails();
		bookingDetails.setBusNumber(bus.getId()+ ", " + bus.getBusNumber() + ", " + bus.getAvailableSeats());
		model.put("customers", customerService.getCustomerUsingId(Integer.parseInt(custId)));
		bookingDetails.setCustID(Integer.parseInt(custId));
		model.put("bookingDetails", bookingDetails);
		return "book-ticket";
	}

	
	
	@RequestMapping(value = "/booking-status", method = RequestMethod.GET)
	public String displayBookingStatus(ModelMap model, @RequestParam int id, @RequestParam(defaultValue = "0") String bookingStatus) {
		System.out.println("bookingService.listAll(): " + bookingService.getBookingDetailsWithBusData(id));
		
		model.put("bookingDetails", bookingService.getBookingDetailsWithBusData(id));
		model.put("customers", customerService.getCustomerUsingId(id));
		model.put("bookingStatus", bookingStatus);
		return "list-bookings";
	}

	@RequestMapping(value = "/journey-details", method = RequestMethod.GET)
	public String displayJourneyDetails(ModelMap model, @RequestParam int id) {
		int customerId= id;
		List<JourneyDetails> jdList = new ArrayList<JourneyDetails>();
		
		
		for (BookingDetails b: bookingService.getBookingDetails(customerId)) {
			JourneyDetails jd = new JourneyDetails();
			jd.setCustomerId(customerId);
			
			jd.setPassengerName(b.getName());
			jd.setMobileNumber(b.getMobileNumber());
			jd.setNoOfTickets(b.getNoOfTickets());
			
			Bus bus = busService.findById(Integer.parseInt(b.getBusNumber())).get();
			jd.setBusNumber(bus.getBusNumber());
			jd.setSource(bus.getSource());
			jd.setDestination(bus.getDestination());
			jd.setSourceTime(bus.getSourceTime());
			jd.setDestinationTime(bus.getDestinationTime());
			jdList.add(jd);
		}
		
		System.out.println("JourneyDetails: " + jdList);
		jdList.sort(Comparator.comparing(JourneyDetails::getSourceTime, Comparator.nullsLast(Comparator.reverseOrder())));
		model.put("JourneyDetails", jdList);
		model.put("customers", customerService.getCustomerUsingId(id));
		
		return "journey-details";
	}
	
	@RequestMapping(value = "/pending-bookings", method = RequestMethod.GET)
	public String displayPendingBookingsPage(ModelMap model, @RequestParam int id) {
		System.out.println("bookingService.listAll(): " + bookingService.getBookingDetails(id));
		
		model.put("bookingDetails", bookingService.getPendingBookings(id));
		model.put("customers", customerService.getCustomerUsingId(id));
		return "pending-bookings";
	}
	
	@RequestMapping(value = "/pending-approvals", method = RequestMethod.GET)
	public String displayPendingApprovalsPage(ModelMap model) {
		model.put("bookingDetails", bookingService.getPendingBookings());
		
		return "pending-approvals";
	}
	
	@RequestMapping(value = "/payment-history", method = RequestMethod.GET)
	public String displayPaymentHistoryPage(ModelMap model) {
		model.put("bookingDetails", bookingService.getApprovedBookings());
		
		return "payment-history";
	}

	@RequestMapping(value = "/cancel-ticket", method = RequestMethod.GET)
	public String cancelBooking(@RequestParam long id) {
		System.out.println("inside 1");
		restTemplate.getForObject("http://localhost:8081/cancel-ticket/"+id, String.class);
		
		
		System.out.println("inside1");

		
		return "redirect:/booking-status?id=" + bookingService.getBookingsById(id).get().getCustID();
	}
	
	@RequestMapping(value = "/update-paymentstatus", method = RequestMethod.GET)
	public String updatePaymentStatus(@RequestParam long id) {
		System.out.println("inside 1");
		restTemplate.getForObject("http://localhost:8081/update-paymentstatus/"+id, String.class);
		
		
		System.out.println("inside1");

		return "redirect:/booking-status?id=" + bookingService.getBookingsById(id).get().getCustID();
	}
	
	@RequestMapping(value = "/approve-booking", method = RequestMethod.GET)
	public String approvePaymentStatus(@RequestParam long id) {
		System.out.println("inside 1");
		restTemplate.getForObject("http://localhost:8081/approve-booking/"+id, String.class);
		
		
		System.out.println("inside1");
		return "redirect:/pending-approvals";
	}
	
	@RequestMapping(value = "/seats", method = RequestMethod.GET)
	public String displaySeats(ModelMap model, @RequestParam int id) {
		System.out.println("id: " + id);
		String busId= bookingService.getBookingsById(id).get().getBusNumber();
		System.out.println("Already Booked Seats " + bookingService.getBookedSeats(busId));
		System.out.println("bookingService.getBookingsById(id).get().getNoOfTickets(): " + bookingService.getBookingsById(id).get().getNoOfTickets());
		System.out.println("bookingService.getBookedSeats(busId): " + bookingService.getBookedSeats(busId));

		model.put("noOfTickets", bookingService.getBookingsById(id).get().getNoOfTickets());
		model.put("bookedSeats", bookingService.getBookedSeats(busId));
		model.put("id", id);
		return "seats";
	}
	
	@RequestMapping(value = "/seats", method = RequestMethod.POST)
	public String bookSeats(ModelMap model, @RequestParam String seatsSelected, @RequestParam int id ) {
		

		
		System.out.println("id: " + id);
		System.out.println("seatsSelected: " + seatsSelected);
		
		//check if the seats are still available or not
		String busId= bookingService.getBookingsById(id).get().getBusNumber();
		for (String seats: seatsSelected.split(",")) {
			for (String bookedSeats: bookingService.getBookedSeats(busId)) {
				System.out.println("Already Booked Seats " + bookedSeats);
				if (bookedSeats != null) {
					if (bookedSeats.equals(seats)){
						
						return "redirect:/booking-status?id=" + bookingService.getBookingsById(id).get().getCustID()+"&bookingStatus=1"; 
					}
				}
			}
		}
		
		//if the seats are available then:
		//save the seats to database and return to booking-status page
		
		BookingDetails bd = bookingService.getBookingsById(id).get();
		bd.setSeatNums(seatsSelected);
		bookingService.saveBookings(bd);
		return "redirect:/booking-status?id=" + bookingService.getBookingsById(id).get().getCustID(); 
	}
	
}
