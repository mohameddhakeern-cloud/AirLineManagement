package com.deltaairline.controller.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.deltaairline.entity.Flight;
import com.deltaairline.repository.FlightRepository;

@Controller
@RequestMapping("/admin")
public class FlightController {

    @Autowired
    private FlightRepository repo;

    @GetMapping("/flightHome")
    public String home() {
        return "common/index";
    }

    @GetMapping("/addFlight")
    public String addFlightPage() {
        return "admin/addFlight";
    }
    
    @GetMapping("/searchFlight")
    public String searchPage() {

        return "admin/searchFlight";
    }
    
    @PostMapping("/searchFlight")
    public String searchFlight(@RequestParam String source,
                               @RequestParam String destination,
                               Model model) {

        model.addAttribute(
                "flights",
                repo.findBySourceAndDestination(source, destination));

        return "admin/searchResult";
    }

    @PostMapping("/saveFlight")
    public String saveFlight(@ModelAttribute Flight flight ) {

        repo.save(flight);
      
       

        return "redirect:/admin/viewFlights";
    }

    @GetMapping("/viewFlights")
    public String viewFlights(Model model) {

        model.addAttribute("flights", repo.findAll());

        return "admin/viewFlights";
    }
}