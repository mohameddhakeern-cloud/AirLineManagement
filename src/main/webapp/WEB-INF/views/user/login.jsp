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

User Login

</h1>

<form action="/user/login" method="post">

<input
class="input-box"
type="email"
name="email"
placeholder="Email"
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

<br>

<p align="center">
Don't have an account?
<a href="/user/register">Register Here</a>
</p>

</div>

</body>
</html>