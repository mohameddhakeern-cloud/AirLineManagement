<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Dashboard</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link rel="stylesheet" href="/css/style.css">

</head>

<body>

<h1 align="center">

✈ Delta Airlines Dashboard

</h1>

<div class="dashboard">

<div class="card">

<i class="fa-solid fa-plane"></i>

<h2>${flightCount}</h2>

<p>Flights</p>

</div>


<div class="card">

<i class="fa-solid fa-user"></i>

<h2>${passengerCount}</h2>

<p>Passengers</p>

</div>


<div class="card">

<i class="fa-solid fa-ticket"></i>

<h2>${bookingCount}</h2>

<p>Bookings</p>

</div>

</div>

</body>
</html>