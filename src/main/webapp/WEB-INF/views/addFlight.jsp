<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Add Flight</title>

<style>

body{
font-family:Arial;
background:#f4f4f4;
}

.container{
width:400px;
margin:auto;
margin-top:50px;
background:white;
padding:30px;
border-radius:15px;
box-shadow:0 0 10px gray;
}

input{
width:100%;
padding:12px;
margin-top:10px;
}

button{
width:100%;
padding:12px;
background:green;
color:white;
border:none;
margin-top:20px;
}

</style>

</head>
<body>

<div class="container">

<h2>Add Flight</h2>

<form action="saveFlight" method="post">

<input type="text" name="flightName" placeholder="Flight Name">

<input type="text" name="source" placeholder="Source">

<input type="text" name="destination" placeholder="Destination">

<input type="number" name="price" placeholder="Price">

<input type="number" name="availableSeats" placeholder="Available Seats">

<button>Add Flight</button>

</form>

</div>

</body>
</html>