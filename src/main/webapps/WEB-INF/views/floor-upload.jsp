<!--Define JSP Tags Before Deploying JSP pages-->
<html%@ page language="java" contentType="text/html; charset=UTF-8"%>

<!DOCTYPE html>
<html>
	
	<head>
		
		<title>Floor Upload</title>
		
	</head>
	
	<body>
		<h2>
			Upload Floor Plan
		</h2>
		
		<form action="/api/floor/upload" method="post" enctype="multipart/form-data">
			
			Select File : <input type="file" name="file">
			<br><br>
			
			<button type="submit">Upload</button>
			<button type="reset">Reset</button>
			
		</form>
		
		<a href="/dashboard">Dashboard</a>
		
	</body>
			
</html>