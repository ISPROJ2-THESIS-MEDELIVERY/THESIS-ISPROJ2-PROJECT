<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<style type="text/css">
table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
}
</style>
<title>Show All Customers</title>
</head>
<body>
	<table>
		<thead>
			<tr>
				<th>Product</th>
				<th>Pharmacy</th>
				<th>Price</th>
				<th>Quantity</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${FeaturedStock}" var="stockItem">
				<tr>
					<td><c:out value="${stockItem.Product}" /></td>
					<td><c:out value="${stockItem.Pharmacy}" /></td>
					<td><c:out value="${stockItem.Price}" /></td>
					<td><c:out value="${stockItem.Quantity}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>