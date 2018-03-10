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
	<table>
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
			<c:forEach items="${ordersList}" var="order">
			<tr>
				<td><c:out value="${order.OrderID}" /></td>
				<td><c:out value="${order.OrderAddress}" /></td>
				<td><c:out value="${order.OrderType}" /></td>
				<td><c:out value="${order.PaymentMethod}" /></td>
				<td><a href="CustomerController?action=Reject&orderId=<c:out value="${order.orderId}"/>">REJECT</a></td>
				<td><a href="CustomerController?action=Approve&orderId=<c:out value="${order.orderId}"/>">APPROVE</a></td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<p>
		<a href="CustomerController?action=insert">Add Customer</a>
	</p>
</body>
</html>