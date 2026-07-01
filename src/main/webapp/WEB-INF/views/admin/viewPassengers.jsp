<%@ page language="java" contentType="text/html;charset=UTF-8"
pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core"
prefix="c"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">

<title>Passengers</title>

<link rel="stylesheet"
href="/css/style.css">

</head>
<body>

<div class="table-container">

<h1 class="page-title">

👤 Passenger List

</h1>

<table>

<tr>

<th>ID</th>
<th>Name</th>
<th>Gender</th>
<th>Age</th>
<th>Phone</th>
<th>Email</th>

</tr>

<c:forEach items="${passengers}" var="p">

<tr>

<td>${p.id}</td>
<td>${p.passengerName}</td>
<td>${p.gender}</td>
<td>${p.age}</td>
<td>${p.phone}</td>
<td>${p.email}</td>

</tr>

</c:forEach>

</table>

</div>

</body>
</html>