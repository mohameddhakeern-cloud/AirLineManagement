package com.deltaairline.controller.user;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.deltaairline.repository.FlightRepository;

@Controller
@RequestMapping("/user")
public class UserFlightController {

    @Autowired
    FlightRepository flightRepo;

    @GetMapping("/searchFlight")
    public String searchPage() {

        return "user/searchFlight";
    }

    @PostMapping("/searchFlight")
    public String searchFlight(@RequestParam String source,
                               @RequestParam String destination,
                               Model model) {

        model.addAttribute(
                "flights",
                flightRepo.findBySourceAndDestination(source, destination));

        return "user/searchResult";
    }

}