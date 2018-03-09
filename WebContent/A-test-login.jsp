<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="LoginController" method="post">
		<fieldset>
			<div align="center">
				<label for="Username">Username</label><br />
				<input type="text" name="Username" placeholder="Username" maxlength="25"/>
			</div>&nbsp;
			<div align="center">
				<label for="Password">Password</label><br />
				<input type="text" name="Password" placeholder="Password" maxlength="25"/>
			</div>&nbsp;
			<div align="center">
				<input type="submit" value="Submit" />
			</div>
		</fieldset>
	</form>
</body>
</html>