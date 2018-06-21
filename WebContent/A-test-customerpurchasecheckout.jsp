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
		Order ID: <c:out value="${orderReciept.customerID}" /><br />
		Order Address: <c:out value="${orderReciept.orderAddress}" /><br />
		Senior Discount: <c:out value="${orderReciept.seniorDiscount}" /><br />
	<table>
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
			<c:forEach items="${CartlistReciept}" var="cartdetails">
	            <tr>
	                <td><c:out value="${cartdetails.name}" /></td>
	                <td><c:out value="${cartdetails.description}" /></td>
	                <td>IMAGE HERE</td>
	                <!-- <td><img src="data:image/jpeg;base64,${cartdetails.image}" /></td>  -->
	                <td><c:out value="${cartdetails.size}" /></td>
	                <td><c:out value="${cartdetails.prescription}" /></td>
	                <td><c:out value="${cartdetails.quantity}" /></td>
	                <td><c:out value="${cartdetails.unitCost}" /></td>
	                <td><c:out value="${cartdetails.totalCost}" /></td>
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
		<a href="A-test-index.jsp">Store</a>
	</p>
</body>
</html>