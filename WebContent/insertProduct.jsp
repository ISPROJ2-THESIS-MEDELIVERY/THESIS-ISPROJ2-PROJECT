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
	<a href="login.jsp" class="already" style="color:#282d32;font-size:20px;">Insert New Product</a>
	<form action="InformationController" method="post">
		<select>
			<c:foreach items="ProductList" var="product">
				<option value='<c:out value="product.productID"/>'>
					<c:out value="product.registrationNo"/> - 
					<c:out value="product.productName"/> - 
					<c:out value="product.productGeneric"/> - 
					<c:out value="product.productStrength"/> - 
					<c:out value="product.productForm"/> - 
					<c:out value="product.productPackaging"/> - 
					<c:out value="product.productManufacturer"/> - 
					<c:out value="product.productOrigin"/>
				</option>
			</c:foreach>
		</select>
		<input type="number" name="Quantity"/>
		<input type="submit" value="Submit" />
	</form>
</body>
</html>