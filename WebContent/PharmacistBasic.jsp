<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<title>Insert title here</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" />
<link rel="stylesheet" href="assets/css/Header-Blue.css" />
<link rel="stylesheet" href="assets/css/styles.css" />
</head>
<body>

</body>
	 <div>
        <div class="header-blue">
            <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                <div class="container"><a href="index.jsp" class="navbar-brand">Medelivery</a>
                    <div class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav"></ul>
                        <form target="_self" class="form-inline mr-auto">
                            <div class="form-group"><label for="search-field"></label></div>
                        </form>
                        <c:if test="${userAccess == 1}">
                        <span class="navbar-text"><a href="LoginController" class="login">Log Out</a></span>
                        </c:if>
                        <c:if test="${userAccess == 2}">
                        <span class="navbar-text"><a href="DispatcherController?Action=DispatchOrder">Order Dispatch - Regular</a><br></span>
						<span class="navbar-text"><a href="LoginController">Logout</a></span>
                        </c:if>
                        <c:if test="${userAccess == 3}">
                        <span class="navbar-text"><a href="ProductController?Action=AddProduct">Add Product</a></span>
                        <span class="navbar-text"><a href="PharmacistController?Action=Prescription">Approve/Disapprove prescription orders</a></span>
						<span class="navbar-text"><a href="LoginController">Logout</a><br></span>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    
	<table class="table table-striped table-bordered" width="100%">
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
	            <th colspan="2">Accept or Reject?</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${PharmacyOrders}" var="order">
				<c:if test="${order.orderStatus == 'PROCESSED'}">
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
							    	<c:forEach items="${PharmacyOrderDetailsList}" var="orderdetails">
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
						<td><a href="PharmacistController?PharmaID=<c:out value="${order.pharmacyID}" />&Action=RejectOrder&orderID=<c:out value="${order.orderID}"/>">CANCEL</a></td>
						<td><a href="PharmacistController?PharmaID=<c:out value="${order.pharmacyID}" />&Action=ApproveOrder&orderID=<c:out value="${order.orderID}"/>">CONFIRM</a></td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
		<footer class="footer text-center">
    		<div class="container">
        		<div class="row">
            		<div class="col-md-4 mb-5 mb-lg-0">
                		<h4 class="text-uppercase mb-4">Location</h4>
                		<p></p>
            		</div>
            		<div class="col-md-4 mb-5 mb-lg-0">
                		<h4 class="text-uppercase">Around the Web</h4>
                		<ul class="list-inline">
                    		<li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="#"><i class="fa fa-facebook fa-fw"></i></a></li>
                    		<li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="#"><i class="fa fa-google-plus fa-fw"></i></a></li>
                    		<li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="#"><i class="fa fa-twitter fa-fw"></i></a></li>
                    		<li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="#"><i class="fa fa-dribbble fa-fw"></i></a></li>
                		</ul>
            		</div>
            		<div class="col-md-4">
                		<h4 class="text-uppercase mb-4">About medelivery</h4>
                		<p class="lead mb-0"><span></span></p>
            		</div>
        		</div>
    		</div>
		</footer>
</html>