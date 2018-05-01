<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
				<th>Product Type</th>
				<th>Payment Method</th>
				<th>Quantity</th>
				<th>Buy</th>
			</tr>
		</thead>
		<tbody>
			<form method='post' action='AddtoCartCheck.php'>
				<c:forEach items="${productList}" var="item">
				<tr>
					<td><c:out value="${item.orderID}" /></td>
					<td><c:out value="${item.orderAddress}" /></td>
					<td><c:out value="${item.orderType}" /></td>
					<td><c:out value="${item.paymentMethod}" /></td>
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
						<a href="Controller?action=Approve&orderID=<c:out value="${order.orderID}"/>">APPROVE</a>
						<button class='btn btn-outline-primary btn-sm' type='submit' name='add' value="<c:out value="${order.orderID}"/>" style='display: on-hover'>Buy</button>
					</td>
				</tr>
				</c:forEach>
			</form>
		</tbody>
	</table>
</body>
</html>