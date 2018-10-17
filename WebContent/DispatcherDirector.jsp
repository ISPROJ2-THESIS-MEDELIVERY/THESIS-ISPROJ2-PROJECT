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
	            <th>OrderID</th>
	            <th>ProductID</th>
	            <th>Quantity</th>
	            <th>Address</th>
	            <th>Date Ordered</th>
	            <th>Type</th>
	            <th>Status</th>
	            <th>Senior Citizen?</th>
	            <th>Order Details</th>
	            <th>Total Cost</th>
	            <th>Pharmacy</th>
	            <th colspan="2">Set Pharmacy</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${DispatcherOrderList}" var="order">
				<c:if test="${order.orderStatus == 'PENDING'}">
					<tr>
			            <td><c:out value="${order.customerID}" /></td>
			            <td><c:out value="${order.pharmacyID}" /></td>
			            <td><c:out value="${order.cityID}" /></td>
			            <td><c:out value="${order.orderAddress}" /></td>
			            <td><c:out value="${order.dateOrdered}" /></td>
			            <td><c:out value="${order.orderType}" /></td>
			            <td><c:out value="${order.orderStatus}" /></td>
			            <td><c:out value="${order.seniorDiscount}" /></td>
			            <td>
				            <table class="table" border = "2">
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
							    	<c:forEach items="${DispatcherOrderDetailsList}" var="orderdetails">
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
			            </td>
			            <td><c:out value="${order.actualCost}" /></td>
			            <td>
							<c:forEach items="${SelectPharmacy}" var="pharmacy">
								<c:if test="${pharmacy.pharmacyID == order.pharmacyID}">
									<c:out value="${pharmacy.pharmacyName}" />
								</c:if>
							</c:forEach>
						</td>
						<td>
							<form action='DispatcherController' method='post'>
								
								<select name="BranchID">
									<c:forEach items="${ListBranches}" var="branch">
										<c:if test="${branch.pharmacyID == order.pharmacyID}">
											<option value="<c:out value="${branch.branchID}" />"><c:out value="${branch.branchOwner}" /></option>
										</c:if>
									</c:forEach>
								</select>
								<input type="submit" name="action" value="assignOrder" placeholder="Set Order">
							</form>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>