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
	Order:
	
	
	<table>
		<thead>
			<tr>
				<th></th>
				<th></th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${customers}" var="customer">
				<tr>
					<td><c:out value="${customer.customerId}" /></td>
					<td><c:out value="${customer.firstName}" /></td>
					<td><c:out value="${customer.lastName}" /></td>
					<td><c:out value="${customer.middleName}" /></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	Within city: P50
	Inter city: P100
	<p>
		<a href="CustomerController?action=insert">Add Customer</a>
	</p>
</body>
</html>