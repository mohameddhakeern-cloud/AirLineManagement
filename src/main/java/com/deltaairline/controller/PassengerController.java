package com.deltaairline.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.deltaairline.entity.Passenger;
import com.deltaairline.repository.PassengerRepository;

@Controller
public class PassengerController {

    @Autowired
    PassengerRepository repo;

    @GetMapping("/addPassenger")
    public String addPassengerPage() {
        return "addPassenger";
    }

    @PostMapping("/savePassenger")
    public String savePassenger(Passenger passenger) {

        repo.save(passenger);

        return "redirect:/viewPassengers";
    }

    @GetMapping("/viewPassengers")
    public String viewPassengers(Model model) {

        model.addAttribute("passengers", repo.findAll());

        return "viewPassengers";
    }
}