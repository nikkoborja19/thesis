<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Admit yourselves now!</title>
		<link rel="stylesheet" type="text/css" href="resources/css/loginStyle.css">
		<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
	</head>
	
	<body>
	
		<div id="login-error-div">${loginError}</div>
		
		<form action="submitAdmissionForm.html" method="POST">
			<input type="text" name="name" placeholder="Enter your name here!"/><br>
			<input type="text" name="hobby" placeholder="Enter your hobby here!"/><br>
			<input type="submit" value="Submit" />
		</form>
		
	</body>
</html>