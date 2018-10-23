<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="/ProductController">
		<input type="hidden" />
		<h2>Product to add: </h2><br><br>
		Product Name:<br>
		<input type="text" name=""/><br><br>
		Generic Name:<br>
		<input type="text" name=""/><br><br>
		Registration Number:<br>
		<input type="text" name=""/><br><br>
		Product Strength:<br>
		<input type="text" name=""/><br><br>
		Product Form:<br>
		<input type="text" name=""/><br><br>
		Product Packaging:<br>
		<input type="text" name=""/><br><br>
		Product Manufacturing:<br>
		<input type="text" name=""/><br><br>
		Product Origin:<br>
		<input type="text" name=""/><br><br>
		Product Description:<br>
		<input type="text" name=""/><br><br>
		Product is an Rx Product?:<br>
		<input type="checkbox" name=""/><br><br>
		Is it Featured?: <br>
		<input type="checkbox" name="feature"/><br><br>
		Price: <br>
		<input type="number" name="Price"/><br>
		<input type="submit" name="action" value="addnewProduct"/> 
	</form>
</body>
</html>