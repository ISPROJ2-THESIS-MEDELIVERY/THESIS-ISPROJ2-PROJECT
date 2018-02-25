<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Test</title>
</head>
<body>

	<form action="RegistrationController" method="post">
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
				<label for="CustomerName">Customer Name</label><br />
				<input type="text" name="CustomerName" placeholder="CustomerName" maxlength="25"/>
			</div>&nbsp;
			<div align="center">
				<label for="Address">Address</label><br />
				<input type="text" name="Address" placeholder="Address" maxlength="50"/>
			</div>&nbsp;
			<div align="center">
				<label for="Email">Email</label><br />
				<input type="text" name="Email" placeholder="Email"/>
			</div>&nbsp;
			<div align="center">
				<label for="phoneNo">Phone Number</label><br />
				<input type="number" name="ContactNumber" placeholder="Phone Number"/>
			</div>&nbsp;
			<div align="center">
				<input type="submit" value="Submit" />
			</div>
		</fieldset>
	</form>
</body>
</html>