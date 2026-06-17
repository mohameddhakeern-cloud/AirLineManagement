<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Search Result</title>

<link rel="stylesheet"
href="/css/style.css">

</head>
<body>

<h1 class="page-title">

✈ Available Flights

</h1>

<div class="result-container">

<c:forEach items="${flights}" var="f">

<div class="flight-card">

<h2>${f.flightName}</h2>

<p>

📍 ${f.source}
→
${f.destination}

</p>

<p>

💰 ₹ ${f.price}

</p>

<p>

💺 Available Seats :
${f.availableSeats}

</p>

</div>

</c:forEach>

</div>

</body>
</html>