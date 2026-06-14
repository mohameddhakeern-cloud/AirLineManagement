package com.deltaairline.controller;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import com.deltaairline.entity.Booking;
import com.deltaairline.entity.Flight;
import com.deltaairline.entity.Passenger;
import com.deltaairline.repository.BookingRepository;
import com.deltaairline.repository.FlightRepository;
import com.deltaairline.repository.PassengerRepository;

@Controller
public class BookingController {

    @Autowired
    private BookingRepository bookingRepo;

    @Autowired
    private PassengerRepository passengerRepo;

    @Autowired
    private FlightRepository flightRepo;

    @GetMapping("/addBooking")
    public String addBookingPage(Model model) {

        model.addAttribute("passengers", passengerRepo.findAll());
        model.addAttribute("flights", flightRepo.findAll());

        return "addBooking";
    }

    @PostMapping("/saveBooking")
    public String saveBooking(@RequestParam int passengerId,
                              @RequestParam int flightId,
                              @RequestParam int numberOfSeats) {

        Passenger passenger = passengerRepo.findById(passengerId).get();
        Flight flight = flightRepo.findById(flightId).get();

        Booking booking = new Booking();

        booking.setPassenger(passenger);
        booking.setFlight(flight);
        booking.setNumberOfSeats(numberOfSeats);
        booking.setBookingDate(LocalDate.now());

        if (flight.getAvailableSeats() >= numberOfSeats) {

            flight.setAvailableSeats(
                    flight.getAvailableSeats() - numberOfSeats);

            flightRepo.save(flight);

            bookingRepo.save(booking);

            return "redirect:/viewBookings";
        }
        else {

            return "bookingFail";
        }
    }

    @GetMapping("/viewBookings")
    public String viewBookings(Model model) {

        model.addAttribute("bookings", bookingRepo.findAll());

        return "viewBookings";
    }
    
    @GetMapping("/cancelBooking/{id}")
    public String cancelBooking(@PathVariable int id) {

        Booking booking = bookingRepo.findById(id).get();

        Flight flight = booking.getFlight();

        flight.setAvailableSeats(
                flight.getAvailableSeats()
                + booking.getNumberOfSeats());

        flightRepo.save(flight);

        bookingRepo.delete(booking);

        return "redirect:/viewBookings";
    }

}