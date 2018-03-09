<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Purchase an item</title>
</head>
<body>
	<form action="LoginController" method="post">
		<fieldset>
			<div align="center">
				<label for="OrderAddress">Order Address</label>
				<input type="text" name="OrderAddress" placeholder="Order Address" maxlength="25"/><br />
				<label for="PaymentMethod">Payment Method</label>
				<input type="text" name="PaymentMethod" placeholder="Payment Method" maxlength="25"/><br />
			</div>&nbsp;
			<div align="center">
				<h3>Order 1:</h3>
				<label for="Password">First Name</label>
				<input type="text" name="Password" placeholder="Password" maxlength="25"/><br />
				<label for="Password">First Name</label>
				<input type="text" name="Password" placeholder="Password" maxlength="25"/><br />
				<label for="Password">First Name</label>
				<input type="text" name="Password" placeholder="Password" maxlength="25"/><br />
				<label for="Password">First Name</label>
				<input type="text" name="Password" placeholder="Password" maxlength="25"/><br />
				<label for="Password">First Name</label>
				<input type="text" name="Password" placeholder="Password" maxlength="25"/><br />
			</div>&nbsp;
			<div align="center">
				<input type="submit" value="Submit" />
			</div>
		</fieldset>
	</form>
</body>
</html>