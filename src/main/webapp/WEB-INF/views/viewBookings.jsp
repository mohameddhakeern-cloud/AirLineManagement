<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Bookings</title>

<link rel="stylesheet"
href="/css/style.css">

</head>
<body>

<div class="table-container">

<h1 class="page-title">

🎫 Booking Details

</h1>

<table>

<tr>

<th>ID</th>

<th>PNR</th>

<th>Passenger</th>

<th>Flight</th>

<th>Date</th>

<th>Seats</th>

<th>Action</th>

</tr>


<c:forEach items="${bookings}" var="b">

<tr>

<td>${b.id}</td>

<td class="pnr">${b.pnr}</td>

<td>${b.passenger.passengerName}</td>

<td>${b.flight.flightName}</td>

<td>${b.bookingDate}</td>

<td>${b.numberOfSeats}</td>

<td>

<a class="cancel-btn"

href="/cancelBooking/${b.id}">

Cancel

</a>

</td>

</tr>

</c:forEach>

</table>

</div>

</body>
</html>