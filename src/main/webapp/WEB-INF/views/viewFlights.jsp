<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flights</title>

<style>

table{
width:80%;
margin:auto;
border-collapse:collapse;
}

th{
background:#1d3557;
color:white;
padding:12px;
}

td{
padding:10px;
text-align:center;
}

tr:nth-child(even){
background:#f2f2f2;
}

</style>

</head>
<body>

<h1 align="center">Available Flights</h1>

<table border="1">

<tr>
<th>ID</th>
<th>Flight Name</th>
<th>Source</th>
<th>Destination</th>
<th>Price</th>
<th>Seats</th>
</tr>

<c:forEach items="${flights}" var="f">

<tr>

<td>${f.id}</td>
<td>${f.flightName}</td>
<td>${f.source}</td>
<td>${f.destination}</td>
<td>${f.price}</td>
<td>${f.availableSeats}</td>

</tr>

</c:forEach>

</table>

</body>
</html>