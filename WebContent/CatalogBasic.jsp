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
	<h1>CART:</h1>
	<c:if test="${Cartlist != null}">
		<table border=1>
			<thead>
				<tr>
		            <th>Item</th>
		            <th>Item Description</th>
		            <th>Image</th>
		            <th>Size</th>
		            <th>Prescription Required</th>
		            <th>Quantity</th>
		            <th>Unit Price</th>
		            <th>Total Cost</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${Cartlist}" var="details">
		            <tr>
		                <td><c:out value="${details.name}" /></td>
		                <td><c:out value="${details.description}" /></td>
		                <td><c:out value="${details.size}" /></td>
		                <td><c:out value="${details.prescription}" /></td>
		                <td><c:out value="${details.quantity}" /></td>
		                <td><c:out value="${details.unitCost}" /></td>
		                <td><c:out value="${details.totalCost}" /></td>
		            </tr>
	            </c:forEach>
			</tbody>
		</table>
	</c:if>
	<c:if test="${Cartlist == null}">
		<h2>NOTHING ORDERED YET</h2>
	</c:if>
	
	<h1>SHOP:</h1>
	<table border=1>
		<thead>
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Generic Name</th>
				<th>Product Strength</th>
				<th>Product Form</th>
				<th>Product Packaging</th>
				<th>Product Description</th>
				<th>Quantity</th>
				<th>Buy</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productList}" var="item">
				<form action='PurchaseController' method='post'>
					<tr>
						<td><input type="number" name="ProductID" value="<c:out value="${item.productID}" />" readonly></td>
						<td><c:out value="${item.productName}" /></td>
						<td><c:out value="${item.genericName}" /></td>
						<td><c:out value="${item.productStrength}" /></td>
						<td><c:out value="${item.productForm}" /></td>
						<td><c:out value="${item.productPackaging}" /></td>
						<td><c:out value="${item.productDescription}" /></td>
						
						<c:if test="${item.isRXProduct == false}">
						<td>
							<select name='Quantity'>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
							</select>
						</td>
						<td>
							<input type='submit' name='Action' value="Addtocart" style='display: on-hover' />
						</td>
						</c:if>
						
						<c:if test="${item.isRXProduct == true}">
						<td>UNAVAILABLE</td>
						<td>PRESCRIPTION ONLY</td>
						</c:if>
					</tr>
				</form>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>