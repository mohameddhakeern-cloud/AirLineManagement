<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>My Bookings</title>

<link rel="stylesheet" href="/css/style.css">

</head>

<body>

<h1 align="center">My Bookings</h1>

<table border="1" cellpadding="10" cellspacing="0" align="center">

<tr>

<th>PNR</th>
<th>Flight</th>
<th>Route</th>
<th>Booking Date</th>
<th>Status</th>
<th>Seats</th>
<th>Seat No</th>
<th>Payment</th>
<th>Transaction ID</th>
<th>Method</th>
<th>Ticket</th>
<th>Action</th>

</tr>

<c:forEach items="${bookings}" var="b">

<tr>

<td>${b.pnr}</td>

<td>${b.flight.flightName}</td>

<td>${b.flight.source} → ${b.flight.destination}</td>

<td>${b.bookingDate}</td>

<td>${b.status}</td>

<td>${b.numberOfSeats}</td>

<td>${b.seatNumber}</td>

<td>${b.paymentStatus}</td>

<td>${b.transactionId}</td>

<td>${b.paymentMethod}</td>

<td>

<a href="/user/ticket/${b.id}">
View Ticket
</a>

<a href="/user/boardingPass/${b.id}">
    Boarding Pass
</a>

</td>

<td>

<c:choose>

<c:when test="${b.status=='CONFIRMED'}">

<a href="/user/cancelBooking/${b.id}"
onclick="return confirm('Are you sure?')">

Cancel

</a>

</c:when>

<c:otherwise>

<span style="color:red">
Cancelled
</span>

</c:otherwise>

</c:choose>

</td>

</tr>

</c:forEach>

</table>

</body>

</html>