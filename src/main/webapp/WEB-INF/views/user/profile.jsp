<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">

<title>My Profile</title>

<link rel="stylesheet" href="/css/style.css">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">

</head>

<body>

<div class="form-container">

<h1>

<i class="fa-solid fa-user"></i>

My Profile

</h1>

<form action="/user/updateProfile" method="post">

<input
type="hidden"
name="id"
value="${user.id}">

<label>Name</label>

<input
class="input-box"
type="text"
name="name"
value="${user.name}"
required>

<label>Email</label>

<input
class="input-box"
type="email"
name="email"
value="${user.email}"
required>

<label>Password</label>

<input
class="input-box"
type="password"
name="password"
value="${user.password}"
required>

<label>Role</label>

<input
class="input-box"
type="text"
value="${user.role}"
readonly>

<input
class="submit-btn"
type="submit"
value="Update Profile">

</form>

<br>

<div align="center">

<a href="/user/home">

<button class="submit-btn">

<i class="fa-solid fa-house"></i>

Back to Home

</button>

</a>

</div>

</div>

</body>

</html>