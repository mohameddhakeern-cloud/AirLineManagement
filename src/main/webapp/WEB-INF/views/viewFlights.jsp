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

</tr>

<c:forEach items="${flights}" var="f">

<tr>

<td>${f.id}</td>
<td>${f.flightName}</td>
<td>${f.source}</td>
<td>${f.destination}</td>
<td>₹ ${f.price}</td>
<td>${f.availableSeats}</td>

</tr>

</c:forEach>

</table>

</div>

</body>
</html>