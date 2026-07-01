<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Add Passenger</title>

<link rel="stylesheet" href="/css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>
<body>

<div class="form-container">

<h1>
<i class="fa-solid fa-user"></i>
Add Passenger
</h1>

<form action="/admin/savePassenger" method="post">

<input
class="input-box"
type="text"
name="passengerName"
placeholder="Passenger Name"
required>

<input
class="input-box"
type="text"
name="gender"
placeholder="Gender"
required>

<input
class="input-box"
type="number"
name="age"
placeholder="Age"
required>

<input
class="input-box"
type="text"
name="phone"
placeholder="Phone Number"
required>

<input
class="input-box"
type="email"
name="email"
placeholder="Email Address"
required>

<input
class="submit-btn"
type="submit"
value="Add Passenger">

</form>

</div>

</body>
</html>