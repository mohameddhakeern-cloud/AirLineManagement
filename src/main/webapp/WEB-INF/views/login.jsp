<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<title>Login</title>

<link rel="stylesheet" href="/css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>
<body>

<div class="form-container">

<h1>

<i class="fa-solid fa-user-shield"></i>

Admin Login

</h1>

<form action="/login" method="post">

<input
class="input-box"
type="text"
name="username"
placeholder="Username"
required>

<input
class="input-box"
type="password"
name="password"
placeholder="Password"
required>

<input
class="submit-btn"
type="submit"
value="Login">

</form>

</div>

</body>
</html>