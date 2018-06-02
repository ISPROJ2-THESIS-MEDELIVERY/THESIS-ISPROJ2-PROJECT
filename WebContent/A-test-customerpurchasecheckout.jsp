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
	<h2>Checkout Page</h2>
		Order ID: <c:out value="${Order.customerID}" /><br />
		Order Address: <c:out value="${Order.orderAddress}" /><br />
		Senior Discount: <c:out value="${Order.seniorDiscount}" /><br />
	<table>
		<thead>
			<tr>
				<th>ProductID</th>
				<th>quantity</th>
				<th>CostPerUnit</th>
				<th>TotalCost</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${OrderDetails}" var="details">
				<tr>
					<td><c:out value="${details.productID}" /></td>
					<td><c:out value="${details.quantity}" /></td>
					<td><c:out value="${details.costPerUnit}" /></td>
					<td><c:out value="${details.totalCost}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br />
	<br />
	<br />
	Within city: P50
	<br />
	Inter city: P100
	<p>
		<a href="/PurchaseController?action=Customer">Add Customer</a>
	</p>
</body>
</html>