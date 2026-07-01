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

<h1>✈ DELTA AIRLINES</h1>

<hr>

<h2>E-Ticket</h2>

<p><b>PNR :</b> ${booking.pnr}</p>

<p><b>Passenger :</b> ${booking.passenger.passengerName}</p>

<p><b>Flight :</b> ${booking.flight.flightName}</p>

<p><b>From :</b> ${booking.flight.source}</p>

<p><b>To :</b> ${booking.flight.destination}</p>

<p><b>Seats :</b> ${booking.numberOfSeats}</p>

<tr>
    <th>Seat Number</th>
    <td>${booking.seatNumber}</td>
</tr>

<tr>
    <th>Payment Method</th>
    <td>${booking.paymentMethod}</td>
</tr>

<tr>
    <th>Payment Status</th>
    <td>${booking.paymentStatus}</td>
</tr>

<tr>
    <th>Transaction ID</th>
    <td>${booking.transactionId}</td>
</tr>

<tr>
    <th>Departure</th>
    <td>${booking.flight.departureTime}</td>
</tr>

<tr>
    <th>Arrival</th>
    <td>${booking.flight.arrivalTime}</td>
</tr>

<tr>
    <th>Gate</th>
    <td>${booking.flight.gate}</td>
</tr>

<tr>
    <th>Terminal</th>
    <td>${booking.flight.terminal}</td>
</tr>

<p><b>Status :</b> ${booking.status}</p>

<p><b>Booking Date :</b> ${booking.bookingDate}</p>

<p><b>Total Fare :</b>
₹ ${booking.flight.price * booking.numberOfSeats}
</p>

<br>

<a href="/user/downloadTicket/${booking.id}">
Download PDF
</a>

&nbsp;&nbsp;

<a href="/user/myBookings">
Back
</a>

</div>

</body>
</html>