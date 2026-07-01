<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Book Flight</title>

<link rel="stylesheet" href="/css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>
<body>

<div class="form-container">

<h1>

<i class="fa-solid fa-ticket"></i>

Book Flight

</h1>

<form action="/admin/saveBooking" method="post">

<select class="input-box" name="passengerId">

<option selected disabled>

Select Passenger

</option>

<c:forEach items="${passengers}" var="p">

<option value="${p.id}">

${p.passengerName}

</option>

</c:forEach>

</select>


<select class="input-box" name="flightId">

<option selected disabled>

Select Flight

</option>

<c:forEach items="${flights}" var="f">

<option value="${f.id}">

${f.flightName}

</option>

</c:forEach>

</select>


<input
class="input-box"
type="number"
name="numberOfSeats"
placeholder="Number of Seats"
required>

<input
class="submit-btn"
type="submit"
value="Book Flight">

</form>

</div>

</body>
</html>