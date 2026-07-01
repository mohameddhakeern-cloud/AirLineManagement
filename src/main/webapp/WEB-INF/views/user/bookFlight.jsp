<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Book Flight</title>

<link rel="stylesheet" href="/css/style.css">

<style>

.form-container{
    width:700px;
    margin:auto;
    padding:20px;
}

.input-box{
    width:100%;
    padding:10px;
    margin-bottom:15px;
}

.submit-btn{
    padding:10px 25px;
    background:#007bff;
    color:white;
    border:none;
    cursor:pointer;
}

.submit-btn:hover{
    background:#0056b3;
}

.seat-container{

    display:grid;
    grid-template-columns:repeat(5,60px);
    gap:15px;
    justify-content:center;
    margin-top:20px;

}

.gap{
    visibility:hidden;
}

.seat{

    width:55px;
    height:55px;
    border-radius:8px;

    display:flex;
    justify-content:center;
    align-items:center;

    font-weight:bold;
    cursor:pointer;

    border:2px solid black;

}

.available{

    background:#4CAF50;
    color:white;

}

.booked{

    background:#e53935;
    color:white;
    cursor:not-allowed;

}

.selected{

    background:#ff9800 !important;

}

.legend{

    display:flex;
    justify-content:center;
    gap:30px;
    margin-top:20px;
    margin-bottom:20px;

}

.box{

    width:20px;
    height:20px;
    display:inline-block;
    margin-right:5px;

}

</style>

</head>

<body>

<div class="form-container">

<h1 align="center">✈ Book Flight</h1>

<form action="/user/bookFlight" method="post">

<input
type="hidden"
name="flightId"
value="${flight.id}">

<label>Passenger Name</label>

<input
class="input-box"
type="text"
name="passengerName"
required>

<label>Age</label>

<input
class="input-box"
type="number"
name="age"
required>

<label>Gender</label>

<select
class="input-box"
name="gender"
required>

<option value="Male">Male</option>
<option value="Female">Female</option>
<option value="Other">Other</option>

</select>

<label>Email</label>

<input
class="input-box"
type="email"
name="email"
required>

<label>Phone Number</label>

<input
class="input-box"
type="text"
name="phoneNumber"
required>

<label>Number of Seats</label>

<input
class="input-box"
type="number"
name="numberOfSeats"
min="1"
max="${flight.availableSeats}"
required>

<input
type="hidden"
id="seatNumber"
name="seatNumber"
required>

<div class="legend">

<div>
<span class="box" style="background:#4CAF50;"></span>
Available
</div>

<div>
<span class="box" style="background:#e53935;"></span>
Booked
</div>

<div>
<span class="box" style="background:#ff9800;"></span>
Selected
</div>

</div>

<h3 align="center">Select Seat</h3>

<div class="seat-container">

<c:forEach items="${seats}" var="seat">

    <div
        class="seat ${bookedSeats.contains(seat) ? 'booked' : 'available'}"

        <c:if test="${!bookedSeats.contains(seat)}">
            onclick="selectSeat(this,'${seat}')"
        </c:if>
    >

        ${seat}

    </div>

</c:forEach>

</div>

<br>

<div align="center">

<input
class="submit-btn"
type="submit"
value="Confirm Booking">

</div>

</form>

<br>

<div align="center">

<a href="/user/searchFlight">

<button type="button">

← Back

</button>

</a>

</div>

</div>

<script>

function selectSeat(element, seat){

    document.querySelectorAll(".seat.available")
            .forEach(function(s){

                s.classList.remove("selected");

            });

    element.classList.add("selected");

    document.getElementById("seatNumber").value = seat;

}

</script>

</body>

</html>