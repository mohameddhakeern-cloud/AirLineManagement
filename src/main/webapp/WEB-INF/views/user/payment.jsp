<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Payment</title>

<link rel="stylesheet" href="/css/style.css">

</head>

<body>

<div class="form-container">

<h1>Payment</h1>

<h3>Flight : ${flight.flightName}</h3>

<h3>Total Amount : ₹${amount}</h3>

<form action="/user/paymentSuccess" method="post">

<input type="hidden" name="flightId" value="${flight.id}">
<input type="hidden" name="passengerName" value="${passengerName}">
<input type="hidden" name="age" value="${age}">
<input type="hidden" name="gender" value="${gender}">
<input type="hidden" name="email" value="${email}">
<input type="hidden" name="phoneNumber" value="${phoneNumber}">
<input type="hidden" name="numberOfSeats" value="${numberOfSeats}">

<label>Select Payment Method</label>

<select
class="input-box"
name="paymentMethod">

<option>UPI</option>
<option>Credit Card</option>
<option>Debit Card</option>
<option>Net Banking</option>

</select>

<br><br>

<input
class="submit-btn"
type="submit"
value="Pay Now">

</form>

</div>

</body>

</html>