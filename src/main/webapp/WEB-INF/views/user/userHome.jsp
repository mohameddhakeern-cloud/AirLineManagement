<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>User Dashboard</title>

<link rel="stylesheet" href="/css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

<style>

body{
    font-family:Arial,sans-serif;
    background:#f4f6f9;
    margin:0;
}

.header{
    background:#003366;
    color:white;
    padding:20px;
    display:flex;
    justify-content:space-between;
    align-items:center;
}

.header h2{
    margin:0;
}

.container{
    width:90%;
    margin:auto;
    margin-top:30px;
}

.cards{
    display:flex;
    gap:20px;
    margin-bottom:30px;
}

.card{
    flex:1;
    background:white;
    padding:20px;
    border-radius:10px;
    box-shadow:0 0 10px rgba(0,0,0,.15);
    text-align:center;
}

.card h3{
    margin:0;
    color:#003366;
}

.card p{
    font-size:30px;
    font-weight:bold;
}

.search-box{

    background:white;

    padding:25px;

    border-radius:10px;

    box-shadow:0 0 10px rgba(0,0,0,.15);

    margin-bottom:30px;
}

.search-box h2{
    margin-top:0;
}

.input-box{

    width:100%;

    padding:12px;

    margin-top:10px;

    margin-bottom:20px;

    border-radius:5px;

    border:1px solid gray;
}

.submit-btn{

    background:#003366;

    color:white;

    border:none;

    padding:12px 25px;

    border-radius:5px;

    cursor:pointer;
}

.submit-btn:hover{

    background:#0055aa;
}

.menu{

    display:flex;

    gap:20px;

    flex-wrap:wrap;
}

.menu a{

    text-decoration:none;

    background:#003366;

    color:white;

    padding:12px 20px;

    border-radius:5px;
}

.menu a:hover{

    background:#0055aa;
}

</style>

</head>

<body>

<div class="header">

<h2>
✈ DELTA AIRLINES
</h2>

<h3>
Welcome,
${user.name}
</h3>

</div>

<div class="container">

<div class="cards">

<div class="card">

<h3>Total Bookings</h3>

<p>${totalBookings}</p>

</div>

<div class="card">

<h3>Confirmed</h3>

<p>${confirmedBookings}</p>

</div>

<div class="card">

<h3>Cancelled</h3>

<p>${cancelledBookings}</p>

</div>

</div>

<div class="search-box">

<h2>
<i class="fa-solid fa-plane-departure"></i>
Search Flights
</h2>

<form action="/user/searchFlight" method="post">

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
class="submit-btn"
type="submit"
value="Search Flights">

</form>

</div>

<div class="menu">

<a href="/user/myBookings">
<i class="fa-solid fa-ticket"></i>
My Bookings
</a>

<a href="/user/profile">
<i class="fa-solid fa-user"></i>
Profile
</a>

<a href="/user/logout">
<i class="fa-solid fa-right-from-bracket"></i>
Logout
</a>

</div>

</div>

</body>
</html>