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
	<table>
		<thead>
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Generic Name</th>
				<th>Registration No</th>
				<th>Product Strength</th>
				<th>Product Form</th>
				<th>Product Packaging</th>
				<th>Product Manufacturer</th>
				<th>Product Origin</th>
				<th>Product Description</th>
				<th>Quantity</th>
				<th>Buy</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productList}" var="item">
				<tr>
					<td><c:out value="${item.productID}" /></td>
					<td><c:out value="${item.productName}" /></td>
					<td><c:out value="${item.genericName}" /></td>
					<td><c:out value="${item.registrationNo}" /></td>
					<td><c:out value="${item.productStrength}" /></td>
					<td><c:out value="${item.productForm}" /></td>
					<td><c:out value="${item.productPackaging}" /></td>
					<td><c:out value="${item.productManufacturer}" /></td>
					<td><c:out value="${item.productOrigin}" /></td>
					<td><c:out value="${item.productDescription}" /></td>
					<td>
						<select>
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</td>
					<td>
						<a href="Controller?action=Approve&orderID=<c:out value="${item.productID}"/>">APPROVE</a>
						<button class='btn btn-outline-primary btn-sm' type='submit' name='add' value="<c:out value="${order.productID}"/>" style='display: on-hover'>Buy</button>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>