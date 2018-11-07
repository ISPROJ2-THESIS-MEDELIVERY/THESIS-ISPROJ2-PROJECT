<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<title>Home Page</title>
<link rel="stylesheet" href="assets/bootstrap/css/jquery.dataTables.min.css" />
<!-- <link rel="stylesheet" href="assets/bootstrap/js/bootstrap.min.js" />
<link rel="stylesheet" href="assets/bootstrap/js/jquery.min.js" />
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" /> -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" />
<link rel="stylesheet" href="assets/css/Header-Blue.css" />
<link rel="stylesheet" href="assets/css/styles.css" />
<link rel="stylesheet" href="assets/css/style.css" />
<link rel="stylesheet" href="assets/css/Footer-Dark.css" />
<link rel="icon" href="assets/img/medlogo.png" />
</head>



<body>
	<!-- This will be used as a jumping point to test the controllers -->
	<div>
		<div class="header-blue">
			<nav
				class="navbar navbar-dark navbar-expand-md navigation-clean-search">
			<div class="container">
				<a href="index.jsp" class="navbar-brand">Medelivery</a>
				<div class="collapse navbar-collapse" id="navcol-1">
					<ul class="nav navbar-nav"></ul>
					<form target="_self" class="form-inline mr-auto">
						<div class="form-group">
							<label for="search-field"></label>
						</div>
					</form>
					<c:if test="${userAccess == null}">
						<span class="navbar-text" style="float: right"><a
							href="login.jsp" class="login">Log In</a></span>
						<span class="navbar-text" style="float: right"><a
							href="RegistrationController?Action=AddCustomer" class="login">Register</a></span>
					</c:if>
					<c:if test="${userAccess == 1}">
						<span class="navbar-text" style="float: right"><a
							href="LoginController" class="login">Log Out</a></span>
					</c:if>
					<c:if test="${userAccess == 2}">
						<span class="navbar-text" style="float: right"><a
							href="LoginController" class="login">Logout</a></span>
						<span class="navbar-text" style="float: right"><a
							href="DispatcherController?Action=DispatchOrder" class="login">Order
								Dispatch - Regular</a><br></span>
					</c:if>
					<c:if test="${userAccess == 3}">
						<span class="navbar-text" style="float: right"><a
							href="LoginController" class="login">Logout</a><br></span>
						<span class="navbar-text" style="float: right"><a
							href="PharmacistController?Action=Prescription" class="login">Approve/Disapprove
								prescription orders</a></span>
						<span class="navbar-text" style="float: right"><a
							href="ProductController?Action=AddnewProduct" class="login">Add
								New Product</a><br></span>
					</c:if>
					<c:if test="${userAccess == 4}">
						<span class="navbar-text" style="float: right"><a
							href="LoginController" class="login">Log Out</a></span>
					</c:if>
				</div>
			</div>
			</nav>
		</div>
	</div>
	<c:if test="${justReg != null}">
		<div role="alert" class="alert alert-info">
			<span><strong>A confirmation email has been sent to
					your email address</strong></span>
		</div>
	</c:if>
	
	
	<c:if test="${userAccess == null}">
		<c:forEach items="${Featurepharm}" var="pharm">
			<div class="row">
				<h3>
					<center>
						Featured products of
						<c:out value="${pharm.pharmacyName}">: </c:out>
					</center>
				</h3>
				<div id="featured-products" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#featured-products" data-slide-to="0"
							class="active"></li>
						<li data-target="#featured-products" data-slide-to="1"></li>
						<li data-target="#featured-products" data-slide-to="2"></li>
						<li data-target="#featured-products" data-slide-to="3"></li>
					</ol>

					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img class="center-block"
								src="images/<c:out value="${pharm.pharmacyLogo}"/>" />
						</div>
						<c:forEach items="${Featurestock}" var="stock">
							<c:forEach items="${Featureitems}" var="items">
								<c:if test="${stock.productID == items.productID}">
									<c:if test="${stock.pharmacyID == pharm.pharmacyID}">
										<div class="item">
											<a> <img class="center-block"
												src="images/<c:out value="${items.productImage}"/>" />
											</a>
										</div>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>

					<a class="left carousel-control" href="#featured-products"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#featured-products"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</c:forEach>
	</c:if>
	
	<c:if test="${userAccess == 1}">
		<c:forEach items="${Featurepharm}" var="pharm">
			<div class="row">
				<h3>
					<center>
						Featured products of
						<c:out value="${pharm.pharmacyName}">: </c:out>
					</center>
				</h3>
				<div id="featured-products" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#featured-products" data-slide-to="0"
							class="active"></li>
						<li data-target="#featured-products" data-slide-to="1"></li>
						<li data-target="#featured-products" data-slide-to="2"></li>
						<li data-target="#featured-products" data-slide-to="3"></li>
					</ol>

					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img class="center-block"
								src="images/<c:out value="${pharm.pharmacyLogo}"/>" />
						</div>
						<c:forEach items="${Featurestock}" var="stock">
							<c:forEach items="${Featureitems}" var="items">
								<c:if test="${stock.productID == items.productID}">
									<c:if test="${stock.pharmacyID == pharm.pharmacyID}">
										<div class="item">
											<a href="http://www.google.com/"> <img
												class="center-block"
												src="images/<c:out value="${items.productImage}"/>" />
											</a>
										</div>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>

					<a class="left carousel-control" href="#featured-products"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#featured-products"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</c:forEach>
	</c:if>




	<%-- <c:forEach items="${Featurepharm}" var="pharm">
			<h3>Featured products of <c:out value="${pharm.pharmacyName}">: </c:out></h3>
			
			<c:forEach items="${Featurestock}" var="stock">
				<c:forEach items="${Featureitems}" var="items">
					<c:if test="${stock.productID == items.productID}">
						<c:if test="${stock.pharmacyID == pharm.pharmacyID}">
							<h3><c:out value="${items.productName}"></c:out></h3>
						</c:if>
					</c:if>
				</c:forEach>
			</c:forEach>
			
			<hr>
		</c:forEach> --%>
	<!-- <c:if test="${userAccess == null}">
				<a href="login.jsp">Login</a><br>
				<a href="register.jsp">Registration</a><br>
			</c:if> -->
	<c:if test="${userAccess == 1}">
		<hr>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<c:if test="${message != null}">
						<c:out value="${message}" />
					</c:if>
					<div class="list-group">
						<a class="list-group-item">
							<h4 class="list-group-item-heading">Select Pharmacy to order
								from:</h4>
						</a>
					</div>
					<!-- <br>Select Pharmacy to order from:<br> -->
					<c:forEach items="${PharmcyList}" var="pharmacy">
						<a
							href="CustomerController?action=GoToCatalog&PharmaID=<c:out value="${pharmacy.pharmacyID}" />"
							class="btn btn-info btn-sm" role="button"><c:out
								value="${pharmacy.pharmacyName}" /></a>
						<br>
					</c:forEach>
				</div>

				<div class="col-md-6">
					<div class="list-group">
						<a class="list-group-item">
							<h4 class="list-group-item-heading">Select Pharmacy to order
								from (Prescription):</h4>
						</a>
					</div>
					<!-- <br>Select Pharmacy to order from (Prescription):<br> -->
					<c:forEach items="${PharmcyList}" var="pharmacy">
						<!-- <a href="CustomerController?action=GoToPrescription&PharmaID=<c:out value="${pharmacy.pharmacyID}" />" class="btn btn-info btn-sm" role="button"><c:out value="${pharmacy.pharmacyName}" /></a><br> -->
						<a
							href="CustomerController?action=GoToCatalogPrescription&PharmaID=<c:out value="${pharmacy.pharmacyID}" />"
							class="btn btn-info btn-sm" role="button"><c:out
								value="${pharmacy.pharmacyName}" /></a>
						<br>
					</c:forEach>
				</div>
				<br>

				<div class="col-md-6">
					<div class="list-group">
						<a class="list-group-item">
							<h4 class="list-group-item-heading">Customer Details:</h4>
							<p class="list-group-item-text">
								User ID:
								<c:out value="${userID}" />
							</p>
							<p class="list-group-item-text">
								Username:
								<c:out value="${username}" />
							</p>
							<p class="list-group-item-text">
								User Type:
								<c:out value="${userAccess}" />
							</p>
						</a>
					</div>
				</div>
				<div class="col-md-6">
					<!-- Order History: -->
					<br> <a href="CustomerController?action=GoToOrders"
						class="btn btn-primary" role="button" />Go to Order History</a><br>
					<br>
					<!-- Order Pending: -->
					<a href="CustomerController?action=GoToPending"
						class="btn btn-primary" role="button" />View your Current Orders</a><br>
					<br>
					<a href="CustomerController?action=GoToReturns"
						class="btn btn-primary" role="button" />View your Orders that can be returned</a><br>
					<br>
				</div>
			</div>
		</div>
		<%-- Customer Details:<br>
			<c:out value="${userID}" /><br>
			<c:out value="${username}" /><br>
			<c:out value="${userAccess}" /><br>
			<a href="LoginController">Logout</a><br>
			<br>Pharmacies:<br>
			<c:forEach items="${PharmcyList}" var="pharmacy">
				<a href="CustomerController?action=GoToCatalog&PharmaID=<c:out value="${pharmacy.pharmacyID}" />"><c:out value="${pharmacy.pharmacyName}" /></a><br>
			</c:forEach>
			Order History:
				<a href="CustomerController?action=GoToOrders" />To to Order History</a><br> --%>
		<hr>
	</c:if>
	<c:if test="${userAccess == 2}">
		<hr>
		<div class="container">
    		<div class="row">
        		<div class="col-md-6">
        			<div class="list-group">
    					<a class="list-group-item">
      						<h4 class="list-group-item-heading">Dispatcher Details:</h4>
      						<p class="list-group-item-text">User ID: <c:out value="${userID}" /></p>
      						<p class="list-group-item-text">Username: <c:out value="${username}" /></p>
      						<p class="list-group-item-text">User Type: <c:out value="${userAccess}" /></p>
    					</a>
    				</div>
    				<a href="DispatcherController?Action=DispatchOrder" class="btn btn-info" role="button">Order Dispatch</a><br>
        			<%-- <p class="font-weight-bold">Dispatcher Details:</p><br>
					User ID: <c:out value="${userID}" /><br>
					Username: <c:out value="${username}" /><br>
					User Type: <c:out value="${userAccess}" /><br> --%>
					<!-- <a href="DispatcherController?Action=DispatchOrder">Order Dispatch</a><br> -->
					<!-- <a href="DispatcherController?Action=DispatchPrescription">Order Dispatch - Prescription</a><br> -->
					<!-- <a href="LoginController">Logout</a><br> -->
				</div>
    		</div>
		</div>		
			<%-- Dispatcher<br>
			<c:out value="${userID}" /><br>
			<c:out value="${username}" /><br>
			<c:out value="${userAccess}" /><br>
			<a href="LoginController">Logout</a><br> --%>
		<hr>
		</c:if>
	<c:if test="${userAccess == 3}">
		<hr>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<%-- <p class="font-weight-bold">Pharmacist Details:</p>
					<c:forEach items="${Prescription}" var="prescription">
						<img src='images/<c:out value="${prescription.prescription}"></c:out>'>
					</c:forEach>
					User ID: <c:out value="${userID}" /><br>
					Username: <c:out value="${username}" /><br>
					User Type: <c:out value="${userAccess}" /><br> --%>
					<!-- <a href="LoginController">Logout</a><br> -->
					<div class="list-group">
						<a class="list-group-item">
							<h4 class="list-group-item-heading">Pharmacist Details</h4>
							<p class="list-group-item-text">
								User ID:
								<c:out value="${userID}" />
							</p>
							<p class="list-group-item-text">
								Username:
								<c:out value="${username}" />
							</p>
							<p class="list-group-item-text">
								User Type:
								<c:out value="${userAccess}" />
							</p>
						</a>
					</div>
					<a href="ProductController?Action=addProduct" class="btn btn-info"
						role="button">Add Existing Product to Catalog</a><br> <br />
					<a href="PharmacistController?Action=Prescription"
						class="btn btn-info" role="button">Approve/Disapprove
						prescription orders</a><br> <br />
				</div>
			</div>
			</div>
			<br>
			<%-- Current Orders Heading to your Pharmacy:
					<a href="PharmacistController?Action=GoToOrders" class="btn btn-info" role="button"><c:out value="${PharmacistPharmacy.pharmacyName}" />'s Regular Orders</a> --%>
			<%-- <a href="PharmacistController?action=GoToOrders&PharmaID=<c:out value="${PharmacistPharmacy.pharmacyID}" />"><c:out value="${PharmacistPharmacy.pharmacyName}" />'s Pharmacy Orders</a> --%>
			<div id="container">
				<div class="list-group">
					<a class="list-group-item list-group-item-info">
						<h4 class="list-group-item-heading">
							<center>Current Orders Heading to your Pharmacy That DO
								NOT require a prescription:</center>
						</h4>
					</a>
				</div>
			</div>
				<br>
				<table id="wpres" class="table table-striped table-bordered"
					width="100%">
					<thead>
						<tr>
							<th>OrderID</th>
							<th>ProductID</th>
							<th>Quantity</th>
							<th>Address</th>
							<th>Date Ordered</th>
							<th>Type</th>
							<th>Senior Citizen?</th>
							<th>Product Bought</th>
							<th>Total Cost</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${IncomingOrders}" var="order">
							<c:if test="${order.prescriptionID == 0 && order.branchID == PharmacistBranch.branchID && order.orderStatus == 'PROCESSED'}">
								<tr>
									<td><c:out value="${order.customerID}" /></td>
									<td><c:out value="${order.pharmacyID}" /></td>
									<td><c:out value="${order.cityID}" /></td>
									<td><c:out value="${order.orderAddress}" /></td>
									<td><c:out value="${order.dateOrdered}" /></td>
									<td><c:out value="${order.orderType}" /></td>
									<td><c:out value="${order.seniorDiscount}" /></td>
									<td>
										<table class="table-wrapper table-striped table-bordered"
											width="100%">
											<thead>
												<tr>
													<th>OrderID</th>
													<th>Product Name</th>
													<th>Quantity</th>
													<th>Cost Per Unit</th>
													<th>Total Cost</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${IncomingOrderDetails}"
													var="orderdetails">
													<c:if test="${order.orderID == orderdetails.orderID}">
														<tr>
															<td><c:out value="${orderdetails.orderID}" /></td>
															<td><c:forEach items="${ProductTranslation}"
																	var="product">
																	<c:if
																		test="${orderdetails.productID == product.productID}">
																		<c:out value="${product.productName}" />
																	</c:if>
																</c:forEach></td>
															<td><c:out value="${orderdetails.quantity}" /></td>
															<td>&#8369;<c:out
																	value="${orderdetails.costPerUnit}" /></td>
															<td>&#8369;<c:out value="${orderdetails.totalCost}" /></td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</td>
									<td>&#8369;<c:out value="${order.actualCost}" /></td>
									<td>
										<form action="ApprovalController" method="post">
											<input type="hidden" Name="action" value="OrderReject" />
											<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
											<input type="submit" value="Reject">
										</form>

										<form action="ApprovalController" method="post">
											<input type="hidden" Name="action" value="OrderApprove" />
											<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
											<input type="submit" value="Approve">
										</form>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			
			<div class="list-group">
				<a class="list-group-item list-group-item-info">
					<h4 class="list-group-item-heading">
						<center>Current Orders Heading to your Pharmacy That DO
							require a prescription:</center>
					</h4>
				</a>
			</div>
			<br>
			<table id="wopres" class="table table-striped table-bordered"
				width="125%">
				<thead>
					<tr>
						<th>OrderID</th>
						<th>ProductID</th>
						<th>Quantity</th>
						<th>Address</th>
						<th>Date Ordered</th>
						<th>Type</th>
						<th>Senior Citizen?</th>
						<th>Product Bought</th>
						<th>Total Cost</th>
						<th>Prescription</th>
						<th>Action</th>
						<th>Reason</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${IncomingOrders}" var="order">
						<c:if test="${order.prescriptionID != 0 && order.branchID == PharmacistBranch.branchID && order.orderStatus == 'PROCESSED'}">
							<tr>
								<td><c:out value="${order.customerID}" /></td>
								<td><c:out value="${order.pharmacyID}" /></td>
								<td><c:out value="${order.cityID}" /></td>
								<td><c:out value="${order.orderAddress}" /></td>
								<td><c:out value="${order.dateOrdered}" /></td>
								<td><c:out value="${order.orderType}" /></td>
								<td><c:out value="${order.seniorDiscount}" /></td>
								<td>
									<table class="table-wrapper table-striped table-bordered"
										width="100%">
										<thead>
											<tr>
												<th>OrderID</th>
												<th>Product Name</th>
												<th>Quantity</th>
												<th>Cost Per Unit</th>
												<th>Total Cost</th>
											</tr>
										</thead>
										<tbody>
											<c:forEach items="${IncomingOrderDetails}" var="orderdetails">
												<c:if test="${order.orderID == orderdetails.orderID}">
													<tr>
														<td><c:out value="${orderdetails.orderID}" /></td>
														<td><c:forEach items="${ProductTranslation}"
																var="product">
																<c:if
																	test="${orderdetails.productID == product.productID}">
																	<c:out value="${product.productName}" />
																</c:if>
															</c:forEach></td>
														<td><c:out value="${orderdetails.quantity}" /></td>
														<td>&#8369;<c:out value="${orderdetails.costPerUnit}" /></td>
														<td>&#8369;<c:out value="${orderdetails.totalCost}" /></td>
													</tr>
												</c:if>
											</c:forEach>
										</tbody>
									</table>
								</td>
								<td>&#8369;<c:out value="${order.actualCost}" /></td>
								<td><c:forEach items="${PrescriptionImage}"
										var="prescription">
										<c:if
											test="${order.prescriptionID == prescription.prescriptionID}">
											<img
												src="images/<c:out value="${prescription.prescription}" />"
												alt="Medicine Image" width="100px" height="100px">
										</c:if>
									</c:forEach>
								</td>
								<td>
									<form action="ApprovalController" method="post">
										<input type="hidden" Name="action" value="OrderReject" />
										<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
										<input type="submit" value="Reject">
									</form>
									<form action="ApprovalController" method="post">
										<input type="hidden" Name="action" value="OrderApprove" />
										<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
										<input type="submit" value="Approve">
									</form>
								</td>
								<td>
									<form action="ApprovalController" method="post">
										<input type="hidden" Name="action"  value="OrderInvalidate" />
										<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
										REASON:
										<input type="text"   Name="Reason" required/>
										<input type="submit" value="Invalidate">
									</form>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
			<div id="container">
				<div class="list-group">
					<a class="list-group-item list-group-item-info">
						<h4 class="list-group-item-heading">
							<center>Current Orders That are requested to be returned:</center>
						</h4>
					</a>
				</div>
			</div>
				<br>
				<table id="retpres" class="table table-striped table-bordered"
					width="100%">
					<thead>
						<tr>
							<th>OrderID</th>
							<th>ProductID</th>
							<th>Quantity</th>
							<th>Address</th>
							<th>Date Ordered</th>
							<th>Type</th>
							<th>Senior Citizen?</th>
							<th>Product Bought</th>
							<th>Total Cost</th>
							<th>Reason</th>
							<th>Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${IncomingOrders}" var="order">
							<c:if test="${order.branchID == PharmacistBranch.branchID && order.orderStatus == 'RETURN'}">
								<tr>
									<td><c:out value="${order.customerID}" /></td>
									<td><c:out value="${order.pharmacyID}" /></td>
									<td><c:out value="${order.cityID}" /></td>
									<td><c:out value="${order.orderAddress}" /></td>
									<td><c:out value="${order.dateOrdered}" /></td>
									<td><c:out value="${order.orderType}" /></td>
									<td><c:out value="${order.seniorDiscount}" /></td>
									<td>
										<table class="table-wrapper table-striped table-bordered"
											width="100%">
											<thead>
												<tr>
													<th>OrderID</th>
													<th>Product Name</th>
													<th>Quantity</th>
													<th>Cost Per Unit</th>
													<th>Total Cost</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${IncomingOrderDetails}"
													var="orderdetails">
													<c:if test="${order.orderID == orderdetails.orderID}">
														<tr>
															<td><c:out value="${orderdetails.orderID}" /></td>
															<td><c:forEach items="${ProductTranslation}"
																	var="product">
																	<c:if
																		test="${orderdetails.productID == product.productID}">
																		<c:out value="${product.productName}" />
																	</c:if>
																</c:forEach></td>
															<td><c:out value="${orderdetails.quantity}" /></td>
															<td>&#8369;<c:out
																	value="${orderdetails.costPerUnit}" /></td>
															<td>&#8369;<c:out value="${orderdetails.totalCost}" /></td>
														</tr>
													</c:if>
												</c:forEach>
											</tbody>
										</table>
									</td>
									<td>&#8369;<c:out value="${order.actualCost}" /></td>
									</td>
									<td>
										<form action="ApprovalController" method="post">
											<input type="hidden" Name="action" value="ReturnReject" />
											<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
											<input type="submit" value="Reject">
										</form>
										<form action="ApprovalController" method="post">
											<input type="hidden" Name="action" value="ReturnApprove" />
											<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
											<input type="submit" value="Approve">
										</form>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			
		
		
		<%-- Pharmacist Details<br>
			<c:out value="${userID}" /><br>
			<c:out value="${username}" /><br>
			<c:out value="${userAccess}" /><br>
			<a href="LoginController">Logout</a><br>
			<a href="ProductController?Action=AddProduct">Add Product</a><br> --%>
		<hr>
	</c:if>
	<c:if test="${userAccess == 4}">
		<hr>
		<div class="container">
			<div class="list-group">
				<a class="list-group-item">
					<h4 class="list-group-item-heading">Admin Details:</h4>
					<p class="list-group-item-text">
						User ID:
						<c:out value="${userID}" />
					</p>
					<p class="list-group-item-text">
						Username:
						<c:out value="${username}" />
					</p>
					<p class="list-group-item-text">
						User Type:
						<c:out value="${userAccess}" />
					</p>
				</a>
			</div>
		</div>
		<hr>
		<%-- <p class="font-weight-bold">Admin Details</p>
			User ID: <c:out value="${userID}" /><br>
			Username: <c:out value="${username}" /><br>
			User Type: <c:out value="${userAccess}" /><br> --%>
		<hr>
		<h2>
			<center>List of customers:</center>
		</h2>
		<br>
		<table id="customerTable" class="table table-striped table-bordered"
			width="100%">
			<thead>
				<tr>
					<th>Customer Name</th>
					<th>Customer CityID</th>
					<th>Customer Email</th>
					<th>Senior Citizen?</th>
					<th>Senior Citizen ID</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${CustomerList}" var="customer">
					<tr>
						<td><c:out value="${customer.customerName}" /></td>
						<td><c:out value="${customer.cityID}" /></td>
						<td><c:out value="${customer.email}" /></td>
						<td><c:out value="${customer.isSeniorCitizen}" /></td>
						<td><c:out value="${customer.seniorCitizenID}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<hr>
		<h2>
			<center>List of dispatchers:</center>
		</h2>
		<br>
		<table id="dispatcherTable" class="table table-striped table-bordered"
			width="100%">
			<thead>
				<tr>
					<th>Dispatcher Name</th>
					<th>Dispatcher Contact Number</th>
					<th>Dispatcher Address</th>
					<th>Dispatcher Birthday</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${DispatcherList}" var="dispatcher">
					<tr>
						<td><c:out value="${dispatcher.firstName}" /> <c:out
								value="${dispatcher.lastName}" /></td>
						<td><c:out value="${dispatcher.contactNumber}" /></td>
						<td><c:out value="${dispatcher.address}" /></td>
						<td><c:out value="${dispatcher.birthdate}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="RegistrationController?Action=AddDispatcher"
			class="btn btn-info btn-sm" role="button">Register a new
			Dispatcher</a>
		<br>
		<br>
		<hr>
		<h2>
			<center>List of pharmacists:</center>
		</h2>
		<br>
		<table id="pharmacistTable" class="table table-striped table-bordered"
			width="100%">
			<thead>
				<tr>
					<th>Pharmacist Name</th>
					<th>Pharmacist PRC Number</th>
					<th>Pharmacist Position</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${PharmacistList}" var="pharmacist">
					<tr>
						<td><c:out value="${pharmacist.firstName}" /> <c:out
								value="${pharmacist.lastName}" /></td>
						<td><c:out value="${pharmacist.PRCNo}" /></td>
						<td><c:out value="${pharmacist.position}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<c:forEach items="${PharmcyList}" var="pharmacy">
			<a
				href="RegistrationController?Action=AddPharmacist&PharmacyID=<c:out value="${pharmacy.pharmacyID}" />"
				class="btn btn-info btn-sm" role="button">Register a new
				Pharmacist in <c:out value="${pharmacy.pharmacyName}" />
			</a>
			<br>
			<br>
		</c:forEach>
		<hr>
		<h2>
			<center>List of admin:</center>
		</h2>
		<br>
		<table id="adminTable" class="table table-striped table-bordered"
			width="100%">
			<thead>
				<tr>
					<th>Admin Name</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${AdminList}" var="admin">
					<tr>
						<td><c:out value="${admin.firstName}" /> <c:out
								value="${admin.surname}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="RegistrationController?Action=AddAdmin"
			class="btn btn-info btn-sm" role="button">Register a new Admin</a>
		<br>
		<br>
		<hr>
		<h2>
			<center>Add a new Item:</center>
		</h2>
		<br>
		<hr>
		<h2>
			<center>List of Pharmacies:</center>
		</h2>
		<br>
		<table id="pharmaciesTable" class="table table-striped table-bordered"
			width="100%">
			<thead>
				<tr>
					<th>Pharmacy Name</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${PharmcyList}" var="pharmacy">
					<tr>
						<td><c:out value="${pharmacy.pharmacyName}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="InformationController?Action=AddPharmacy"
			class="btn btn-info btn-sm" role="button">Add a new Pharmacy</a>
		<br>
		<br>
		<hr>
		<h2>
			<center>List of branches:</center>
		</h2>
		<br>
		<table id="branchesTable" class="table table-striped table-bordered"
			width="100%">
			<thead>
				<tr>					
					<th>Branch Address</th>
					<th>Branch Landline</th>
					<th>Branch Cellphone</th>
					<th>Branch Contact</th>		
					<th>Pharmacy ID</th>		
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${BranchList}" var="branch">
					<tr>						
						<td><c:out value="${branch.branchStreet}" />,<c:out
								value="${branch.branchBarangay}" />,<c:out
								value="${branch.cityID}" />,<c:out
								value="${branch.branchProvince}" /></td>
						<td><c:out value="${branch.branchLandline}" /></td>
						<td><c:out value="${branch.branchCellular}" /></td>
						<td><c:out value="${branch.branchOwner}" /></td>
						<td><c:out value="${branch.pharmacyID}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="InformationController?Action=AddBranch"
			class="btn btn-info btn-sm" role="button">Add a new Branch</a>
		<br>
		<br>
		<hr>
		<h2>
			<center>List of Courier Services:</center>
		</h2>
		<br>
		<table id="courierTable" class="table table-striped table-bordered"
			width="100%">
			<thead>
				<tr>					
					<th>Courier Name</th>
					<th>Courier Address</th>
					<th>Courier Landline</th>
					<th>Courier Cellphone</th>
					<th>Courier Contact</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${CourierList}" var="courier">
					<tr>						
						<td><c:out value="${courier.companyName}" /></td>
						<td><c:out value="${courier.companyStreet}" />,<c:out
								value="${courier.companyBarangay}" />,<c:out
								value="${courier.companyCity}" />,<c:out
								value="${courier.companyProvince}" /></td>
						<td><c:out value="${courier.companyLandline}" /></td>
						<td><c:out value="${courier.companyCellular}" /></td>
						<td><c:out value="${courier.companyContact}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<a href="InformationController?Action=AddCourier"
			class="btn btn-info btn-sm" role="button">Add a new Courier
			Service</a>
		<br>
		<br>
	</c:if>

	<div class="row">
		<div class="col-md-4">
			<h2>Product Catalog</h2>
			<div class="panel panel-default">
				<div class="panel-body">
					<center>
						<img
							src="assets/img/Attractive-Pharmaceutical-Packaging-Design-Inspiration-014.jpg"
							class="img-responsive" style="height: 550px; width: 400px;" />
					</center>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<h2>Frequently Asked Questions</h2>
			<div class="panel panel-default">
				<div class="panel-body">
					<center>
						<img src="assets/img/DoctorWho.jpg" class="img-responsive" />
					</center>
				</div>
			</div>
		</div>
		<div class="col-md-4">
			<h2>Contact Us</h2>
			<h5>
				<strong><center>Phone: 555-0199</center></strong>

			</h5>

			<div class="panel panel-default">
				<div class="panel-body">
					<div id="map-canvas" style="height: 300px; width: 500px"></div>
				</div>
			</div>
		</div>
	</div>




	<div class="footer-dark">
		<footer>
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-md-3 item">
					<h3>Services</h3>
					<ul>
						<li><a href="#">Delivery</a></li>
						<li><a href="#">Prescription Orders</a></li>
						<li><a href="#">Partnership</a></li>
					</ul>
				</div>
				<div class="col-sm-6 col-md-3 item">
					<h3>About</h3>
					<ul>
						<li><a href="#">Company</a></li>
						<li><a href="#">Team</a></li>
						<li><a href="#">Careers</a></li>
					</ul>
				</div>
				<div class="col-md-6 item text">
					<h3>Medelivery</h3>
					<p>
						<br />Our mission is to create a measurable, sustainable and
						profitable link between pharmacies, couriers and customers.
						 Providing the best system in storing databases of available
						pharmacies and delivery couriers, as well as management of theses
						deliveries. Our operation is also to bring convenience to
						customers by filtering their needs according to the type of
						payment they want and the type of delivery schedule that fits
						their respective timeframes.<br /> <br /> <br />
					</p>
				</div>
			</div>
			<p class="copyright">Company Name © 2017</p>
		</div>
		</footer>
	</div>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false"></script>

	<script>
		var map;
		function initialize() {
			var mapOptions = {
				zoom : 8,
				center : new google.maps.LatLng(-34.397, 150.644)
			};
			map = new google.maps.Map(document.getElementById('map-canvas'),
					mapOptions);
		}

		google.maps.event.addDomListener(window, 'load', initialize);
	</script>

</body>

<style>
.btn-group-sm>.btn, .btn-sm {
	padding: 5px 10px;
	font-size: 12px;
	line-height: 1.5;
	border-radius: 3px;
	margin-top: 15px;
	margin-left: 100px
}

.col-md-6 {
	width: 50%;
	margin-top: 15px;
}

.table {
	/* width: 100%; */
	max-width: 100%;
	margin-bottom: 20px;
}

.carousel-inner>.item>a>img, .carousel-inner>.item>img {
	line-height: 1;
	width: 300px;
	height: 300px;
}

.carousel {
    position: relative;
    margin-left: 300px;
    margin-right: 300px;
}

.carousel-control.left {
    background-image: -webkit-linear-gradient(left,rgba(0,0,0,.5) 0,rgba(0,0,0,.0001) 100%);
    background-image: -o-linear-gradient(left,rgba(0,0,0,.5) 0,rgba(0,0,0,.0001) 100%);
    background-image: -webkit-gradient(linear,left top,right top,from(rgba(0,0,0,.5)),to(rgba(0,0,0,.0001)));
    background-image: linear-gradient(to right,rgba(0,0,0,.5) 0,rgba(0,0,0,.0001) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#80000000', endColorstr='#00000000', GradientType=1);
    background-repeat: repeat-x;
    background-color: #172a74;
}

.carousel-control.right {
    right: 0;
    left: auto;
    background-image: -webkit-linear-gradient(left,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 100%);
    background-image: -o-linear-gradient(left,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 100%);
    background-image: -webkit-gradient(linear,left top,right top,from(rgba(0,0,0,.0001)),to(rgba(0,0,0,.5)));
    background-image: linear-gradient(to right,rgba(0,0,0,.0001) 0,rgba(0,0,0,.5) 100%);
    filter: progid:DXImageTransform.Microsoft.gradient(startColorstr='#00000000', endColorstr='#80000000', GradientType=1);
    background-repeat: repeat-x;
    background-color: #21a9af;
}
</style>

<script src="assets/bootstrap/js/jquery.dataTables.min.js"></script>
<script src="assets/bootstrap/js/dataTables.bootstrap.min.js"></script>



	<script type="text/javascript">
		 $(document).ready(function() {
			$("#wpres").DataTable({
				"sPaginationType": "full_numbers",
                "bJQueryUI": true, "sScrollX": "100%",
                "bScrollCollapse": true,
                "autowidth": false
			});
		}); 
	</script>

	<script type="text/javascript">
		 $(document).ready(function() {
			$("#wopres").DataTable({
				"sPaginationType": "full_numbers",
                "bJQueryUI": true, "sScrollX": "100%",
                "bScrollCollapse": true,
                "autowidth": false
			});
		}); 
	</script>
	
		<script type="text/javascript">
		 $(document).ready(function() {
			$("#retpres").DataTable({
				"sPaginationType": "full_numbers",
                "bJQueryUI": true, "sScrollX": "100%",
                "bScrollCollapse": true,
                "autowidth": false
			});
		}); 
	</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#customerTable").DataTable({
			"sPaginationType" : "full_numbers",
			"bJQueryUI" : true,
			"sScrollX" : "100%",
			"bScrollCollapse" : true
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#dispatcherTable").DataTable({
			"sPaginationType" : "full_numbers",
			"bJQueryUI" : true,
			"sScrollX" : "100%",
			"bScrollCollapse" : true
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#pharmacistTable").DataTable({
			"sPaginationType" : "full_numbers",
			"bJQueryUI" : true,
			"sScrollX" : "100%",
			"bScrollCollapse" : true
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#adminTable").DataTable({
			"sPaginationType" : "full_numbers",
			"bJQueryUI" : true,
			"sScrollX" : "100%",
			"bScrollCollapse" : true
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#pharmaciesTable").DataTable({
			"sPaginationType" : "full_numbers",
			"bJQueryUI" : true,
			"sScrollX" : "100%",
			"bScrollCollapse" : true
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#branchesTable").DataTable({
			"sPaginationType" : "full_numbers",
			"bJQueryUI" : true,
			"sScrollX" : "100%",
			"bScrollCollapse" : true
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#courierTable").DataTable({
			"sPaginationType" : "full_numbers",
			"bJQueryUI" : true,
			"sScrollX" : "100%",
			"bScrollCollapse" : true
		});
	});
</script>


</html>