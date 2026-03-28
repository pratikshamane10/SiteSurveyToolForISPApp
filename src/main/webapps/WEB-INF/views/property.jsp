<!--Define JSP Tags Before Deploying JSP pages-->
<html%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	
	<head>
		
		<title>Property</title>
		
	</head>
	
	<body>
		<h2>Add Property</h2>
		
		<form action="/api/property" method="post">
			
			Property Name : <input type="text" name="propertyName">
			<br><br>
			
			Property Type : <input type="text" name="propertyType">
			<br><br>
			
			<button type="submit">Save</button>
			<button type="reset">Cancel</button>
			
		</form>
		
		<!--For Return To Dashboard-->
		<a href="/dashboard">Dashboard</a>
		
		
	</body>
	
</html>