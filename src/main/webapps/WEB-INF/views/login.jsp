<!--Define JSP Tags Before Deploying JSP pages-->
<%@ page language="java" contentType="text/html; charset=UTF-8" %>

	<!DOCTYPE html>
	<html>

	<head>
		<title>Login</title>
	</head>

	<body>

		<h2>Login Page</h2>
		<form action="/api/auth/login" method="post">

			Email : <input type="text" name="userEmail">
			<br><br>
			Password : <input type="password" name="userPass">
			<br><br>

			<button type="submit">Login</button>
			<button type="reset">Cancel</button>

		</form>

		<a href="/register">Register</a>

	</body>

	</html>