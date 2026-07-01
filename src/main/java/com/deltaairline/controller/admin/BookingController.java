package com.deltaairline.controller.admin;

import java.time.LocalDate;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.deltaairline.entity.Booking;
import com.deltaairline.entity.Flight;
import com.deltaairline.entity.Passenger;
import com.deltaairline.repository.BookingRepository;
import com.deltaairline.repository.FlightRepository;
import com.deltaairline.repository.PassengerRepository;
import com.deltaairline.service.EmailService;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/admin")
public class BookingController {

    @Autowired
    private BookingRepository bookingRepo;

    @Autowired
    private PassengerRepository passengerRepo;

    @Autowired
    private FlightRepository flightRepo;
    
    @Autowired
    private EmailService emailService;

    @GetMapping("/addBooking")
    public String addBookingPage(Model model) {

        model.addAttribute("passengers", passengerRepo.findAll());
        model.addAttribute("flights", flightRepo.findAll());

        return "admin/addBooking";
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

            // Generate PNR
            String pnr = "DEL" + (System.currentTimeMillis() % 1000000);

            booking.setPnr(pnr);
            
            booking.setStatus("CONFIRMED");

            bookingRepo.save(booking);
            
            String body =
                    "Dear "
                    + passenger.getPassengerName()
                    + ",\n\n"
                    + "Your booking has been confirmed.\n\n"
                    + "PNR : " + booking.getPnr()
                    + "\nFlight : " + flight.getFlightName()
                    + "\nRoute : "
                    + flight.getSource()
                    + " -> "
                    + flight.getDestination()
                    + "\nSeats : "
                    + numberOfSeats
                    + "\nBooking Date : "
                    + booking.getBookingDate()
                    + "\n\nThank you for choosing Delta Airlines.";

            try {

                emailService.sendMail(
                        passenger.getEmail(),
                        "Delta Airlines Ticket Confirmation",
                        body);

            } catch (Exception e) {

                System.out.println("Email failed : " + e.getMessage());

            }
            return "redirect:/user/ticket/" + booking.getId();
        }
        else {

            return "useer/bookingFail";
        }
    }

    @GetMapping("/viewBookings")
    public String viewBookings(Model model) {

        model.addAttribute("bookings", bookingRepo.findAll());

        return "admin/viewBookings";
    }
    
    @GetMapping("/cancelBooking/{id}")
    public String cancelBooking(@PathVariable int id) {

        Booking booking = bookingRepo.findById(id).get();

        Flight flight = booking.getFlight();

        flight.setAvailableSeats(
                flight.getAvailableSeats()
                + booking.getNumberOfSeats());

        flightRepo.save(flight);

        booking.setStatus("CANCELLED");

        bookingRepo.save(booking);

        return "redirect:/admin/viewBookings";
    }
    
    @GetMapping("/ticket/{id}")
    public String showTicket(@PathVariable int id,
                             Model model) {

        Booking booking = bookingRepo.findById(id).get();

        model.addAttribute("booking", booking);

        return "user/ticket";
    }
    
    @GetMapping("/downloadTicket/{id}")
    public void downloadTicket(@PathVariable int id,
                               HttpServletResponse response)
            throws Exception {

        Booking booking = bookingRepo.findById(id).get();

        response.setContentType("application/pdf");

        response.setHeader(
                "Content-Disposition",
                "attachment; filename=ticket_" +
                        booking.getPnr() + ".pdf");

        Document document = new Document();

        PdfWriter.getInstance(
                document,
                response.getOutputStream());

        document.open();

        document.add(new Paragraph(
                "DELTA AIRLINES E-TICKET"));

        document.add(new Paragraph(" "));

        document.add(new Paragraph(
                "PNR : " + booking.getPnr()));

        document.add(new Paragraph(
                "Passenger : "
                        + booking.getPassenger()
                        .getPassengerName()));

        document.add(new Paragraph(
                "Flight : "
                        + booking.getFlight()
                        .getFlightName()));

        document.add(new Paragraph(
                "Route : "
                        + booking.getFlight().getSource()
                        + " -> "
                        + booking.getFlight().getDestination()));

        document.add(new Paragraph(
                "Booking Date : "
                        + booking.getBookingDate()));

        document.add(new Paragraph(
                "Seats : "
                        + booking.getNumberOfSeats()));

        double total =
                booking.getFlight().getPrice()
                        * booking.getNumberOfSeats();

        document.add(new Paragraph(
                "Total Amount : ₹" + total));

        document.close();
    }

}