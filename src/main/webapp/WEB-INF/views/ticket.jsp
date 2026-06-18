<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>E-Ticket</title>

<link rel="stylesheet" href="/css/style.css">

</head>
<body>

<div class="ticket-container">

<h1>✈ BOOKING SUCCESSFUL</h1>

<div class="ticket-card">

<h2>PNR : ${booking.pnr}</h2>

<hr>

<p>
<b>Passenger :</b>
${booking.passenger.passengerName}
</p>

<p>
<b>Flight :</b>
${booking.flight.flightName}
</p>

<p>
<b>Route :</b>
${booking.flight.source}
→
${booking.flight.destination}
</p>

<p>
<b>Booking Date :</b>
${booking.bookingDate}
</p>

<p>
<b>Seats :</b>
${booking.numberOfSeats}
</p>

<p>
<b>Total Amount :</b>
₹ ${booking.flight.price * booking.numberOfSeats}
</p>

<br>

<a class="button" href="/viewBookings">

View All Bookings

</a>
<br><br>

<a class="button"
href="/downloadTicket/${booking.id}">

Download Ticket PDF

</a>

</div>

</div>

</body>
</html>