<%@ page language="java" contentType="text/html;charset=UTF-8"%>

<html>
<head>
<title>Add Passenger</title>
</head>
<body>

<h2>Add Passenger</h2>

<form action="/savePassenger" method="post">

Name:
<input type="text" name="passengerName"><br><br>

Gender:
<input type="text" name="gender"><br><br>

Age:
<input type="number" name="age"><br><br>

Phone:
<input type="text" name="phone"><br><br>

Email:
<input type="email" name="email"><br><br>

<input type="submit" value="Save Passenger">    <input type="Reset" value="Reset Details">


</form>

</body>
</html>