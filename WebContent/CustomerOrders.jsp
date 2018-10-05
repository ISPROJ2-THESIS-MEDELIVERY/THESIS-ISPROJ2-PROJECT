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
	<c:forEach items="${OrderHistory}" var="order">
	Customer ID: <c:out value="${order.customerID}" /><br>
	Pharmacy ID: <c:out value="${order.pharmacyID}" /><br>
	City ID: <c:out value="${order.cityID}" /><br>
	Address: <c:out value="${order.orderAddress}" /><br>
	Date: <c:out value="${order.dateOrdered}" /><br>
	Type: <c:out value="${order.orderType}" /><br>
	Status <c:out value="${order.orderStatus}" /><br>
	Senior: <c:out value="${order.seniorDiscount}" /><br>
	Actual: <c:out value="${order.actualCost}" /><br>
	<table class="table">
	    <thead>
	        <tr>
	            <th>OrderID</th>
	            <th>ProductID</th>
	            <th>Quantity</th>
	            <th>Cost Per Unit</th>
	            <th>Total Cost</th>
	        </tr>
	    </thead>
	    <tbody>
	    	<c:forEach items="${OrderDetailHistory}" var="orderdetails">
				<c:if test="${order.orderID == orderdetails.orderID}">
	            <tr>
	                <td><c:out value="${orderdetails.orderID}" /></td>
	                <td><c:out value="${orderdetails.productID}" /></td>
	                <td><c:out value="${orderdetails.quantity}" /></td>
	                <td><c:out value="${orderdetails.costPerUnit}" /></td>
	                <td><c:out value="${orderdetails.totalCost}" /></td>
	            </tr>
	            </c:if>
			</c:forEach>
	    </tbody>
	</table>
	<hr>
	</c:forEach>>
</body>
</html>