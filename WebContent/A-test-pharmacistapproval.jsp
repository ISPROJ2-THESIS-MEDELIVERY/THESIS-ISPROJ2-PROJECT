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
	<table border = "2">
		<thead>
			<tr>
				<th>Order ID</th>
				<th>Order Address</th>
				<th>Order Type</th>
				<th>Payment Method</th>
				<th colspan="2">Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${orderPharmacistCheck}" var="order">
			<tr>
				<td><c:out value="${order.orderID}" /></td>
				<td><c:out value="${order.customerInfo}" /></td>
				<td><c:out value="${order.cityName}" /></td>
				<td><c:out value="${order.prescriptionID}" /></td>
				<td><c:out value="${order.orderAddress}" /></td>
				<td><c:out value="${order.dateOrdered}" /></td>
				<td><c:out value="${order.orderStatus}" /></td>
				<td><c:out value="${order.seniorDiscount}" /></td>
				<td>${order.orderDetails}</td>
				<td><c:out value="${order.actualCost}" /></td>
				<td><a href="PurchaseController?action=Reject&orderID=<c:out value="${order.orderID}"/>">REJECT</a></td>
				<td><a href="PurchaseController?action=Approve&orderID=<c:out value="${order.orderID}"/>">APPROVE</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>