package com.deltaairline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.deltaairline.entity.Flight;
import com.deltaairline.repository.FlightRepository;

@Controller
public class FlightController {

    @Autowired
    private FlightRepository repo;

    @GetMapping("/flightHome")
    public String home() {
        return "index";
    }

    @GetMapping("/addFlight")
    public String addFlightPage() {
        return "addFlight";
    }
    
    @GetMapping("/searchFlight")
    public String searchPage() {

        return "searchFlight";
    }
    
    @PostMapping("/searchFlight")
    public String searchFlight(@RequestParam String source,
                               @RequestParam String destination,
                               Model model) {

        model.addAttribute(
                "flights",
                repo.findBySourceAndDestination(source, destination));

        return "searchResult";
    }

    @PostMapping("/saveFlight")
    public String saveFlight(@ModelAttribute Flight flight) {

        repo.save(flight);

        return "redirect:/viewFlights";
    }

    @GetMapping("/viewFlights")
    public String viewFlights(Model model) {

        model.addAttribute("flights", repo.findAll());

        return "viewFlights";
    }
}