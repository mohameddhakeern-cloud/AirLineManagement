<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Search Result</title>
</head>
<body>

<h2>Available Flights</h2>

<table border="1">

<tr>
<th>Flight Name</th>
<th>Source</th>
<th>Destination</th>
<th>Price</th>
<th>Available Seats</th>
</tr>

<c:forEach items="${flights}" var="f">

<tr>
<td>${f.flightName}</td>
<td>${f.source}</td>
<td>${f.destination}</td>
<td>${f.price}</td>
<td>${f.availableSeats}</td>
</tr>

</c:forEach>

</table>

</body>
</html>