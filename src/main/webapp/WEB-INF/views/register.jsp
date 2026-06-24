<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register</title>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

<h1 align="center">User Registration</h1>

<form action="/saveUser" method="post">

Name :
<input type="text" name="name">
<br><br>

Email :
<input type="email" name="email">
<br><br>

Password :
<input type="password" name="password">
<br><br>

<button type="submit">
Register
</button>

</form>

</body>
</html>