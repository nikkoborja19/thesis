<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Admit yourselves now!</title>
	</head>
	<body>
		<form action="submitAdmissionForm" method="POST">
			<label>ID NUMBER: </label><input type="text" name="idnumber" placeholder="${idnumber}"/><br>
			<label>PASSWORD: </label><input type="text" name="password" placeholder="${password}"/><br>
			<input type="submit" value="Submit" />
		</form>
	</body>
</html>