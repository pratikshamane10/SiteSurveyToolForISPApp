<!--Define JSP Tags Before Deploying JSP pages-->
<%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	
	<head>
		<title>Register</title>
	</head>
	
	<body>
		
		<h2>New Registration</h2>
		<form action="/api/auth/register" method="post">
			
			Name : <input type="text" name="userFullName">
			<br><br>
			
			Email : <input type="text" name="userEmail">
			<br><br>
			
			Password : <input type="password" name="userPass">
			<br><br>
			
			Role : <input type="text" name="userRole">
			<br><br>
			
			<button type="submit">Register</button>
			<button type="reset">Cancel</button>
			
		</form>
		
		
	</body>
	
	
</html>