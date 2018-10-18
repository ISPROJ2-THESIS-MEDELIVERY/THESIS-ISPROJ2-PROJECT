<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/styles.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" />
<link rel="stylesheet" href="assets/css/Header-Blue.css" />
</head>
<body>
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
	<c:forEach items="${OrderHistory}" var="order">
	<c:if test="${order.orderStatus == 'PENDING'}">
	<p class="font-weight-bold">Customer ID:</p> <c:out value="${order.customerID}" /><br>
	<p class="font-weight-bold">Pharmacy ID:</p> <c:out value="${order.pharmacyID}" /><br>
	<p class="font-weight-bold">City ID:</p> <c:out value="${order.cityID}" /><br>
	<p class="font-weight-bold">Address:</p> <c:out value="${order.orderAddress}" /><br>
	<p class="font-weight-bold">Date:</p> <c:out value="${order.dateOrdered}" /><br>
	<p class="font-weight-bold">Type:</p> <c:out value="${order.orderType}" /><br>
	<p class="font-weight-bold">Status:</p> <c:out value="${order.orderStatus}" /><br>
	<p class="font-weight-bold">Senior:</p> <c:out value="${order.seniorDiscount}" /><br>
	<p class="font-weight-bold">Actual:</p> <c:out value="${order.actualCost}" /><br>
	<div class="table-responsive">
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
	</div>
	<hr>
	<a href="CustomerController?action=CancelOrder&OrderID=<c:out value="${order.orderID}" />" />Cancel Order</a>
	</c:if>
	</c:forEach>
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
</body>
</html>