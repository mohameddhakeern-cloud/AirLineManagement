<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
<title>Passengers List</title>
</head>
<body>

<h2>Passengers List</h2>

<table border="1">

<tr>
<th>ID</th>
<th>Name</th>
<th>Gender</th>
<th>Age</th>
<th>Phone</th>
<th>Email</th>
</tr>

<c:forEach var="p" items="${passengers}">

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

</body>
</html>