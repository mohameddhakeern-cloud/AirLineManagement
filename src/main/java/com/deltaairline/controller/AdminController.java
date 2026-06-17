package com.deltaairline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.deltaairline.repository.BookingRepository;
import com.deltaairline.repository.FlightRepository;
import com.deltaairline.repository.PassengerRepository;

@Controller
public class AdminController {

    @Autowired
    FlightRepository flightRepo;

    @Autowired
    PassengerRepository passengerRepo;

    @Autowired
    BookingRepository bookingRepo;

    @GetMapping("/dashboard")
    public String home(Model model) {

        model.addAttribute(
                "flightCount",
                flightRepo.count());

        model.addAttribute(
                "passengerCount",
                passengerRepo.count());

        model.addAttribute(
                "bookingCount",
                bookingRepo.count());

        return "admin";
    }
}