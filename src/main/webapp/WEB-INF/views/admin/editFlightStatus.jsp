<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>Update Flight Status</title>

<link rel="stylesheet" href="/css/style.css">

</head>

<body>

<div class="form-container">

<h2>Update Flight Status</h2>

<form action="/admin/updateFlightStatus" method="post">

<input
type="hidden"
name="id"
value="${flight.id}">

<label>Flight Name</label>

<input
type="text"
value="${flight.flightName}"
readonly>

<label>Status</label>

<select
name="status">

<option
value="ON TIME">

ON TIME

</option>

<option
value="BOARDING">

BOARDING

</option>

<option
value="DELAYED">

DELAYED

</option>

<option
value="CANCELLED">

CANCELLED

</option>

</select>

<br><br>

<input
type="submit"
value="Update Status">

</form>

</div>

</body>

</html>