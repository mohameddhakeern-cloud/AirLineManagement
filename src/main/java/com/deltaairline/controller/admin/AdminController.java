package com.deltaairline.controller.admin;

import jakarta.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.deltaairline.repository.BookingRepository;
import com.deltaairline.repository.FlightRepository;
import com.deltaairline.repository.PassengerRepository;

@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    FlightRepository flightRepo;

    @Autowired
    PassengerRepository passengerRepo;

    @Autowired
    BookingRepository bookingRepo;

    @GetMapping("/dashboard")
    public String dashboard(Model model,
                            HttpSession session) {


        model.addAttribute(
                "flightCount",
                flightRepo.count());

        model.addAttribute(
                "passengerCount",
                passengerRepo.count());

        model.addAttribute(
                "bookingCount",
                bookingRepo.count());

        return "admin/admin";
    }
}