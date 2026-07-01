<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Available Flights</title>

<link rel="stylesheet" href="/css/style.css">

</head>
<body>

<div class="table-container">

<h1 class="page-title">
✈ Available Flights
</h1>

<table>

<tr>

<th>ID</th>
<th>Flight Name</th>
<th>Source</th>
<th>Destination</th>
<th>Price</th>
<th>Available Seats</th>
<th>Status</th>
<th>Status</th>
<th>Departure</th>
<th>Arrival</th>
<th>Gate</th>
<th>Terminal</th>

</tr>

<c:forEach items="${flights}" var="f">

<tr>

<td>${f.id}</td>
<td>${f.flightName}</td>
<td>${f.source}</td>
<td>${f.destination}</td>
<td>₹ ${f.price}</td>
<td>${f.availableSeats}</td>
<td>${f.status}</td>
<th>Status</th>
<th>Update</th>
<td>

<c:choose>

<c:when test="${flight.status=='On Time'}">
<span style="color:green;font-weight:bold;">
🟢 On Time
</span>
</c:when>

<c:when test="${flight.status=='Boarding'}">
<span style="color:orange;font-weight:bold;">
🟡 Boarding
</span>
</c:when>

<c:when test="${flight.status=='Delayed'}">
<span style="color:red;font-weight:bold;">
🔴 Delayed
</span>
</c:when>

<c:when test="${flight.status=='Departed'}">
<span style="color:blue;font-weight:bold;">
✈ Departed
</span>
</c:when>

<c:when test="${flight.status=='Arrived'}">
<span style="color:green;font-weight:bold;">
✅ Arrived
</span>
</c:when>

<c:otherwise>
${flight.status}
</c:otherwise>

</c:choose>

</td>
<td>${flight.status}</td>

<td>

<a href="/admin/editStatus/${flight.id}">
Update Status
</a>

</td>
<td>${f.departureTime}</td>
<td>${f.arrivalTime}</td>
<td>${f.gate}</td>
<td>${f.terminal}</td>

</tr>

</c:forEach>

</table>

</div>

</body>
</html>