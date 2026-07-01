package com.deltaairline.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.deltaairline.repository.BookingRepository;

import com.deltaairline.entity.User;

import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/user")
public class UserHomeController {

	@Autowired
	private BookingRepository bookingRepo;
	
	@GetMapping("/home")
	public String home(HttpSession session,
	                   Model model) {

	    User user = (User) session.getAttribute("loggedUser");

	    if(user == null)
	        return "redirect:/user/login";

	    model.addAttribute("user", user);

	    model.addAttribute(
	            "totalBookings",
	            bookingRepo.countByUser(user));

	    model.addAttribute(
	            "confirmedBookings",
	            bookingRepo.countByUserAndStatus(
	                    user,
	                    "CONFIRMED"));

	    model.addAttribute(
	            "cancelledBookings",
	            bookingRepo.countByUserAndStatus(
	                    user,
	                    "CANCELLED"));

	    return "user/userHome";
	}


}