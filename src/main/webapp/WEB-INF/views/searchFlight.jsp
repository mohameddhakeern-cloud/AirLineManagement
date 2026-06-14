<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Search Flight</title>
</head>
<body>

<h2>Search Flight</h2>

<form action="/searchFlight" method="post">

Source:

<input type="text" name="source">

<br><br>

Destination:

<input type="text" name="destination">

<br><br>

<input type="submit" value="Search">

</form>

</body>
</html>