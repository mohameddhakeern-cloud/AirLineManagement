package com.deltaairline.controller.user;

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
import com.deltaairline.entity.User;
import com.deltaairline.repository.BookingRepository;
import com.deltaairline.repository.FlightRepository;
import com.deltaairline.repository.PassengerRepository;
import com.deltaairline.service.EmailService;
import com.itextpdf.text.Document;
import com.itextpdf.text.Paragraph;
import com.itextpdf.text.pdf.PdfWriter;

import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.List;
import java.util.ArrayList;

@Controller
@RequestMapping("/user")
public class UserBookingController {

    @Autowired
    private FlightRepository flightRepo;

    @Autowired
    private PassengerRepository passengerRepo;

    @Autowired
    private BookingRepository bookingRepo;

    @Autowired
    private EmailService emailService;

    // ==========================
    // Open Booking Page
    // ==========================

    
    @GetMapping("/bookFlight/{id}")
    public String bookFlightPage(@PathVariable int id,
                                 Model model,
                                 HttpSession session) {

        if (session.getAttribute("loggedUser") == null) {
            return "redirect:/user/login";
        }

        Flight flight = flightRepo.findById(id).orElse(null);

        if (flight == null) {
            return "redirect:/user/searchFlight";
        }

        // Already booked seats
        List<String> bookedSeats = bookingRepo.findBookedSeatsByFlightId(id);

        // Generate aircraft seats
        List<String> seats = new ArrayList<>();

        for(char row='A'; row<='D'; row++) {

            for(int col=1; col<=4; col++) {

                seats.add(row + String.valueOf(col));

            }
        }

        model.addAttribute("flight", flight);
        model.addAttribute("bookedSeats", bookedSeats);
        model.addAttribute("seats", seats);

        return "user/bookFlight";
    }

    // ==========================
    // Save Booking
    // ==========================

    @PostMapping("/bookFlight")
    public String bookFlight(

            @RequestParam int flightId,
            @RequestParam String passengerName,
            @RequestParam int age,
            @RequestParam String gender,
            @RequestParam String email,
            @RequestParam String phoneNumber,
            @RequestParam int numberOfSeats,

            Model model,
            HttpSession session) {

        User user = (User) session.getAttribute("loggedUser");

        if (user == null)
            return "redirect:/user/login";

        Flight flight = flightRepo.findById(flightId).orElse(null);

        if (flight == null)
            return "redirect:/user/searchFlight";

        if (flight.getAvailableSeats() < numberOfSeats)
            return "bookingFail";

        double amount = flight.getPrice() * numberOfSeats;

        model.addAttribute("flight", flight);
        model.addAttribute("amount", amount);

        model.addAttribute("passengerName", passengerName);
        model.addAttribute("age", age);
        model.addAttribute("gender", gender);
        model.addAttribute("email", email);
        model.addAttribute("phoneNumber", phoneNumber);
        model.addAttribute("numberOfSeats", numberOfSeats);

        return "user/payment";
    }
    
//    =====================
//    		Payment
//   ====================== 		

    @PostMapping("/paymentSuccess")
    public String paymentSuccess(

            @RequestParam int flightId,
            @RequestParam String passengerName,
            @RequestParam int age,
            @RequestParam String gender,
            @RequestParam String email,
            @RequestParam String phoneNumber,
            @RequestParam int numberOfSeats,
            @RequestParam String paymentMethod,

            HttpSession session) {

        User user = (User) session.getAttribute("loggedUser");

        if (user == null)
            return "redirect:/user/login";

        Flight flight = flightRepo.findById(flightId).orElse(null);

        if (flight == null)
            return "redirect:/user/searchFlight";

        Passenger passenger = new Passenger();

        passenger.setPassengerName(passengerName);
        passenger.setAge(age);
        passenger.setGender(gender);
        passenger.setEmail(email);
        passenger.setPhoneNumber(phoneNumber);

        passengerRepo.save(passenger);

        Booking booking = new Booking();

        booking.setPassenger(passenger);
        booking.setFlight(flight);
        booking.setUser(user);

        booking.setBookingDate(LocalDate.now());
        booking.setNumberOfSeats(numberOfSeats);

        booking.setStatus("CONFIRMED");
        
        booking.setPaymentMethod(paymentMethod);

        booking.setPaymentStatus("SUCCESS");

        booking.setPaymentDate(LocalDate.now());

        booking.setTransactionId(
                "TXN" + System.currentTimeMillis());
        
        booking.setPnr("DEL" + (System.currentTimeMillis() % 1000000));

        bookingRepo.save(booking);

        flight.setAvailableSeats(
                flight.getAvailableSeats() - numberOfSeats);

        flightRepo.save(flight);

        String body =
                "Dear " + passengerName +
                "\n\nYour payment was successful." +
                "\nPayment Method : " + paymentMethod +
                "\nPNR : " + booking.getPnr() +
                "\nFlight : " + flight.getFlightName() +
                "\nRoute : " + flight.getSource() +
                " -> " + flight.getDestination();

        try {
            emailService.sendMail(
                    email,
                    "Delta Airlines Booking Confirmation",
                    body);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return "redirect:/user/myBookings";
    }

    // ==========================
    // My Bookings
    // ==========================

    @GetMapping("/myBookings")
    public String myBookings(Model model,
                             HttpSession session) {

        User user =
                (User) session.getAttribute("loggedUser");

        if (user == null)
            return "redirect:/user/login";

        model.addAttribute(
                "bookings",
                bookingRepo.findByUser(user));

        return "user/myBookings";
    }

    // ==========================
    // View Ticket
    // ==========================

    @GetMapping("/ticket/{id}")
    public String ticket(@PathVariable int id,
                         HttpSession session,
                         Model model) {

        User user =
                (User) session.getAttribute("loggedUser");

        if (user == null)
            return "redirect:/user/login";

        Booking booking =
                bookingRepo.findById(id).orElse(null);

        if (booking == null)
            return "redirect:/user/myBookings";

        if (booking.getUser().getId() != user.getId())
            return "redirect:/user/myBookings";

        model.addAttribute("booking", booking);

        return "user/ticket";
    }

    // ==========================
    // Download Ticket PDF
    // ==========================

    @GetMapping("/downloadTicket/{id}")
    public void downloadTicket(@PathVariable int id,
                               HttpSession session,
                               HttpServletResponse response)
            throws Exception {

        User user =
                (User) session.getAttribute("loggedUser");

        if (user == null)
            return;

        Booking booking =
                bookingRepo.findById(id).orElse(null);

        if (booking == null)
            return;

        if (booking.getUser().getId() != user.getId())
            return;

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

        document.add(new Paragraph("DELTA AIRLINES E-TICKET"));
        document.add(new Paragraph(" "));
        document.add(new Paragraph("PNR : " + booking.getPnr()));
        document.add(new Paragraph("Passenger : " + booking.getPassenger().getPassengerName()));
        document.add(new Paragraph("Flight : " + booking.getFlight().getFlightName()));
        document.add(new Paragraph("Route : " + booking.getFlight().getSource() + " -> " + booking.getFlight().getDestination()));
        document.add(new Paragraph("Departure : " + booking.getFlight().getDepartureTime()));
        document.add(new Paragraph("Arrival : " + booking.getFlight().getArrivalTime()));
        document.add(new Paragraph("Gate : " + booking.getFlight().getGate()));
        document.add(new Paragraph("Terminal : " + booking.getFlight().getTerminal()));
        document.add(new Paragraph("Booking Date : " + booking.getBookingDate()));
        document.add(new Paragraph("Seats : " + booking.getNumberOfSeats()));
        document.add(new Paragraph(
                "Payment Method : "
                + booking.getPaymentMethod()));

        document.add(new Paragraph(
                "Payment Status : "
                + booking.getPaymentStatus()));

        document.add(new Paragraph(
                "Transaction ID : "
                + booking.getTransactionId()));

        double total =
                booking.getFlight().getPrice()
                        * booking.getNumberOfSeats();

        document.add(new Paragraph("Total Amount : ₹" + total));

        document.close();
    }
  
//    ---------------------
//      Cancel Booking 
//    ---------------------
    
    @GetMapping("/cancelBooking/{id}")
    public String cancelBooking(@PathVariable int id,
                                HttpSession session) {

        User user = (User) session.getAttribute("loggedUser");

        if (user == null) {
            return "redirect:/user/login";
        }

        Booking booking = bookingRepo.findById(id).orElse(null);

        if (booking == null) {
            return "redirect:/user/myBookings";
        }

        // Security: User can cancel only his own booking
        if (booking.getUser().getId() != user.getId()) {
            return "redirect:/user/myBookings";
        }

        // Already cancelled
        if ("CANCELLED".equals(booking.getStatus())) {
            return "redirect:/user/myBookings";
        }

        Flight flight = booking.getFlight();

        // Restore seats
        flight.setAvailableSeats(
                flight.getAvailableSeats() + booking.getNumberOfSeats());

        flightRepo.save(flight);

        booking.setStatus("CANCELLED");

        bookingRepo.save(booking);

        // Send Email
        String body =
                "Dear " + booking.getPassenger().getPassengerName()
                + ",\n\n"
                + "Your booking has been cancelled successfully.\n\n"
                + "PNR : " + booking.getPnr()
                + "\nFlight : " + flight.getFlightName()
                + "\nRoute : " + flight.getSource()
                + " -> " + flight.getDestination();

        try {

            emailService.sendMail(
                    booking.getPassenger().getEmail(),
                    "Delta Airlines Booking Cancelled",
                    body);

        } catch (Exception e) {

            System.out.println(e.getMessage());

        }

        return "redirect:/user/myBookings";
    }
    
//    ===========================
//    		Boarding Pass
//   ============================ 	
    
    @GetMapping("/boardingPass/{id}")
    public String boardingPass(@PathVariable int id,
                               HttpSession session,
                               Model model) {

        User user = (User) session.getAttribute("loggedUser");

        if (user == null)
            return "redirect:/user/login";

        Booking booking = bookingRepo.findById(id).orElse(null);

        if (booking == null)
            return "redirect:/user/myBookings";

        if (booking.getUser().getId() != user.getId())
            return "redirect:/user/myBookings";

        model.addAttribute("booking", booking);

        return "user/boardingPass";
    }
}