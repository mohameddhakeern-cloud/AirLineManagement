<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Bookings</title>
</head>
<body>

<h2>Booking Details</h2>

<table border="1">

<tr>
<th>ID</th>
<th>Passenger</th>
<th>Flight</th>
<th>Booking Date</th>
<th>Seats</th>
</tr>

<c:forEach items="${bookings}" var="b">

<tr>
<td>${b.id}</td>
<td>${b.passenger.passengerName}</td>
<td>${b.flight.flightName}</td>
<td>${b.bookingDate}</td>
<td>${b.numberOfSeats}</td>
</tr>

</c:forEach>

</table>

</body>
</html>