<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Add Booking</title>
</head>
<body>

<h2>Book Flight</h2>

<form action="/saveBooking" method="post">

Passenger:
<select name="passengerId">

<c:forEach items="${passengers}" var="p">
<option value="${p.id}">
${p.passengerName}
</option>
</c:forEach>

</select>

<br><br>

Flight:

<select name="flightId">

<c:forEach items="${flights}" var="f">
<option value="${f.id}">
${f.flightName}
</option>
</c:forEach>

</select>

<br><br>

Number of Seats:

<input type="number" name="numberOfSeats">

<br><br>

<input type="submit" value="Book Flight">

</form>

</body>
</html>