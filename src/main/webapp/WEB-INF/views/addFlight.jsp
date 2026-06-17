<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Add Flight</title>

<link rel="stylesheet" href="/css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>
<body>

<div class="form-container">

<h1>
<i class="fa-solid fa-plane"></i>
Add Flight
</h1>

<form action="/saveFlight" method="post">

<input
class="input-box"
type="text"
name="flightName"
placeholder="Flight Name"
required>

<input
class="input-box"
type="text"
name="source"
placeholder="Source"
required>

<input
class="input-box"
type="text"
name="destination"
placeholder="Destination"
required>

<input
class="input-box"
type="number"
name="price"
placeholder="Price"
required>

<input
class="input-box"
type="number"
name="availableSeats"
placeholder="Available Seats"
required>

<input
class="submit-btn"
type="submit"
value="Add Flight">

</form>

</div>

</body>
</html>