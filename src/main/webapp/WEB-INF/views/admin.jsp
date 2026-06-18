<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<title>Airline Management System</title>

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<link rel="stylesheet" href="/css/style.css">

</head>

<body>

<nav>

<h2>✈ Delta Airlines</h2>

<ul>

<li><a href="/">Home</a></li>

<li><a href="/viewFlights">Flights</a></li>

<li><a href="/viewPassengers">Passengers</a></li>

<li><a href="/viewBookings">Bookings</a></li>

<li><a href="/searchFlight">Search</a></li>

<li>

<a href="/logout">

Logout

</a>

</li>

</ul>

</nav>


<section class="hero">

<div class="hero-content">

<h1>Fly Beyond Limits</h1>

<p>
Book your dream destination with comfort and confidence.
</p>

<a href="/searchFlight" class="hero-btn">
Search Flights
</a>

</div>

</section>

<section class="stats">

<div class="stat-card">

<i class="fa-solid fa-plane"></i>

<h1>${flightCount}</h1>

<p>Total Flights</p>

</div>


<div class="stat-card">

<i class="fa-solid fa-user"></i>

<h1>${passengerCount}</h1>

<p>Total Passengers</p>

</div>


<div class="stat-card">

<i class="fa-solid fa-ticket"></i>

<h1>${bookingCount}</h1>

<p>Total Bookings</p>

</div>

</section>


<div class="container">


<div class="card">

<i class="fa-solid fa-plane"></i>

<h2>Flight Module</h2>

<p>Manage flights and schedules.</p>

<a class="button" href="/addFlight">Add Flight</a>

<a class="button" href="/viewFlights">View Flights</a>

</div>


<div class="card">

<i class="fa-solid fa-user"></i>

<h2>Passenger Module</h2>

<p>Passenger information management.</p>

<a class="button" href="/addPassenger">Add Passenger</a>

<a class="button" href="/viewPassengers">View Passengers</a>

</div>


<div class="card">

<i class="fa-solid fa-ticket"></i>

<h2>Booking Module</h2>

<p>Book and manage tickets.</p>

<a class="button" href="/addBooking">Book Flight</a>

<a class="button" href="/viewBookings">View Bookings</a>

</div>


<div class="card">

<i class="fa-solid fa-magnifying-glass"></i>

<h2>Search Module</h2>

<p>Find flights by source and destination.</p>

<a class="button" href="/searchFlight">
Search Flight
</a>

</div>

</div>

<footer>

<h3>© 2026 Delta Airlines | Airline Management System</h3>

</footer>

</body>
</html>