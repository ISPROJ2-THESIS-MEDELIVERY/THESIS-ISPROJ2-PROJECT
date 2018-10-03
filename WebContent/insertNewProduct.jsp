<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<a href="login.jsp" class="already" style="color:#282d32;font-size:20px;">Insert Product</a>
	<table border=1>
		<thead>
			<tr>
		    	<th>Registration Number</th>
		        <th>Product Name</th>
		        <th>Generic Name</th>
		        <th>Product Strength</th>
		        <th>Product Form</th>
		        <th>Product Packaging</th>
		        <th>Product Manufacturer</th>
		        <th>Product Origin</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ProductList}" var="product">
		        <tr>
					<td><c:out value="${product.registrationNo}"/></td>
					<td><c:out value="${product.productName}"/></td>
					<td><c:out value="${product.genericName}"/></td>
					<td><c:out value="${product.productStrength}"/></td>
					<td><c:out value="${product.productForm}"/></td>
					<td><c:out value="${product.productPackaging}"/></td>
					<td><c:out value="${product.productManufacturer}"/></td>
					<td><c:out value="${product.productOrigin}"/></td>
		        </tr>
			</c:forEach>
		</tbody>
	</table>
	<form action="InformationController" method="post">
		Registration Number:<br>
		<input type="text" name="RegistrationNo"/><br>
		Quantity:<br>
		<input type="number" name="Quantity"/><br>
		<input type="hidden" name="Action" />
		<input type="submit" value="Submit" />
	</form>
</body>
</html>