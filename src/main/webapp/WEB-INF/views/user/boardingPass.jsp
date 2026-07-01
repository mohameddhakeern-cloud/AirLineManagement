<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Boarding Pass</title>

<link rel="stylesheet" href="/css/style.css">

<style>

body{
    background:#f2f5f9;
    font-family:Arial;
}

.boarding-pass{

    width:850px;

    margin:40px auto;

    background:white;

    border-radius:15px;

    overflow:hidden;

    box-shadow:0px 0px 20px rgba(0,0,0,.2);

}

.header{

    background:#0056b3;

    color:white;

    padding:20px;

    text-align:center;

}

.header h1{

    margin:0;

}

.content{

    display:flex;

}

.left{

    width:70%;

    padding:25px;

}

.right{

    width:30%;

    background:#f7f7f7;

    border-left:2px dashed gray;

    text-align:center;

    padding:25px;

}

.row{

    display:flex;

    justify-content:space-between;

    margin-bottom:18px;

}

.label{

    font-weight:bold;

    color:#666;

}

.value{

    font-size:18px;

    font-weight:bold;

}

.qr{

    width:180px;

    height:180px;

    border:2px solid #333;

    margin:auto;

    display:flex;

    justify-content:center;

    align-items:center;

    font-size:20px;

    font-weight:bold;

}

.print-btn{

    margin:30px;

    text-align:center;

}

button{

    padding:12px 30px;

    border:none;

    background:#0056b3;

    color:white;

    border-radius:8px;

    cursor:pointer;

    font-size:16px;

}

button:hover{

    background:#003d80;

}

</style>

</head>

<body>

<div class="boarding-pass">

<div class="header">

<h1>✈ DELTA AIRLINES</h1>

<h3>BOARDING PASS</h3>

</div>

<div class="content">

<div class="left">

<div class="row">

<div>

<div class="label">Passenger</div>

<div class="value">${booking.passenger.passengerName}</div>

</div>

<div>

<div class="label">PNR</div>

<div class="value">${booking.pnr}</div>

</div>

</div>

<div class="row">

<div>

<div class="label">Flight</div>

<div class="value">${booking.flight.flightName}</div>

</div>

<div>

<div class="label">Seat</div>

<div class="value">${booking.seatNumber}</div>

</div>

</div>

<div class="row">

<div>

<div class="label">From</div>

<div class="value">${booking.flight.source}</div>

</div>

<div>

<div class="label">To</div>

<div class="value">${booking.flight.destination}</div>

</div>

</div>

<div class="row">

<div>

<div class="label">Departure</div>

<div class="value">${booking.flight.departureTime}</div>

</div>

<div>

<div class="label">Arrival</div>

<div class="value">${booking.flight.arrivalTime}</div>

</div>

</div>

<div class="row">

<div>

<div class="label">Terminal</div>

<div class="value">${booking.flight.terminal}</div>

</div>

<div>

<div class="label">Gate</div>

<div class="value">${booking.flight.gate}</div>

</div>

</div>

<div class="row">

<div>

<div class="label">Booking Date</div>

<div class="value">${booking.bookingDate}</div>

</div>

<div>

<div class="label">Status</div>

<div class="value">${booking.status}</div>

</div>

</div>

<div class="row">

<div>

<div class="label">Payment</div>

<div class="value">${booking.paymentStatus}</div>

</div>

<div>

<div class="label">Method</div>

<div class="value">${booking.paymentMethod}</div>

</div>

</div>

</div>

<div class="right">

<h3>QR CODE</h3>

<img
src="/user/qr?text=${booking.pnr}-${booking.passenger.passengerName}-${booking.flight.flightName}-${booking.seatNumber}"
width="180"
height="180">

<br>

<b>${booking.pnr}</b>

</div>

</div>

</div>

<div class="print-btn">

<button onclick="window.print()">

Print Boarding Pass

</button>

<br><br>

<a href="/user/myBookings">

<button>

Back

</button>

</a>

</div>

</body>

</html>