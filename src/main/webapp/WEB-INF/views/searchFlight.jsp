<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Search Flight</title>

<link rel="stylesheet" href="/css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>
<body>

<div class="search-container">

<div class="search-card">

<h1>

<i class="fa-solid fa-magnifying-glass"></i>

Search Flights

</h1>

<form action="/searchFlight" method="post">

<input
class="input-box"
type="text"
name="source"
placeholder="Enter Source"
required>

<input
class="input-box"
type="text"
name="destination"
placeholder="Enter Destination"
required>

<input
class="submit-btn"
type="submit"
value="Search">

</form>

</div>

</div>

</body>
</html>