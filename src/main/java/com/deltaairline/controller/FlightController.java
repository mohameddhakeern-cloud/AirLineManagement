package com.deltaairline.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.deltaairline.entity.Flight;
import com.deltaairline.repository.FlightRepository;

@RestController
@RequestMapping("/flights")
public class FlightController {

    @Autowired
    private FlightRepository repo;

    // Display all flights
    @GetMapping
    public List<Flight> getFlights() {
        return repo.findAll();
    }

    // Insert one sample flight
    @PostMapping("/add")
    public String addFlight() {

        Flight f = new Flight();

        f.setFlightName("Indigo 101");
        f.setSource("Chennai");
        f.setDestination("Delhi");

        repo.save(f);

        return "Flight Saved Successfully";
    }
    
    

    // Insert flight from request body
    @PostMapping
    public Flight saveFlight(@RequestBody Flight flight) {
        return repo.save(flight);
    }
}