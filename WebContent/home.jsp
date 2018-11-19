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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
						<span class="navbar-text" style="float: right"><a href="CustomerSeniorCitizen.jsp" class="login">Senior Citizen/PWD? Click here</a></span>
						<span class="navbar-text" style="float: right"><a href="CustomerController?action=UpdateCustomer" class="login">Update Your Profile</a></span>
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
							href="PharmacistController?Action=Prescription && #return" class="login">Return Orders</a></span>
						<span class="navbar-text" style="float: right"><a
							href="PharmacistController?Action=Prescription && #approve" class="login">Approve/Disapprove
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
				<div id="${pharm.pharmacyID}" class="carousel slide"
					data-ride="carousel">
					<ol class="carousel-indicators">
						<li data-target="#${pharm.pharmacyID}" data-slide-to="0"
							class="active"></li>
						<li data-target="#${pharm.pharmacyID}" data-slide-to="1"></li>
						<li data-target="#${pharm.pharmacyID}" data-slide-to="2"></li>
						<li data-target="#${pharm.pharmacyID}" data-slide-to="3"></li>
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
											<img class="center-block" src="images/<c:out value="${items.productImage}"/>" />
										</div>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>
									
					<a class="left carousel-control" href="#${pharm.pharmacyID}"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#${pharm.pharmacyID}"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</c:forEach>
	</c:if>
	
	<c:if test="${userAccess == 1}">
	<nav class="side-menu">
    <ul>

		<li class="title"><a>Order OTC<span><i class="fa fa-medkit"></i></span></a></li>
		<c:forEach items="${PharmcyList}" var="pharmacy">
      <li><a href="CustomerController?action=GoToCatalog&PharmaID=<c:out value="${pharmacy.pharmacyID}" />"><c:out
								value="${pharmacy.pharmacyName}" /><span><i></i></span></a></li>
      	</c:forEach>
      	<br>
      	<li class="title"><a>Prescription<span><i class="fa fa-ambulance"></i></span></a></li>
		<c:forEach items="${PharmcyList}" var="pharmacy">
      <li><a href="CustomerController?action=GoToCatalogPrescription&PharmaID=<c:out value="${pharmacy.pharmacyID}" />"><c:out
								value="${pharmacy.pharmacyName}" /><span><i></i></span></a></li>
      	</c:forEach>
      	<br>
      	<li><a href="CustomerController?action=GoToOrders">Go to Order History<span><i></i></span></a></li>
      	<li><a href="CustomerController?action=GoToPending">View your Current Orders<span><i></i></span></a></li>
      	<li><a href="CustomerController?action=GoToReturns">View your Order Returns<span><i></i></span></a></li>
	    
      
    </ul>
  	</nav>
		<c:forEach items="${Featurepharm}" var="pharm">
			<div class="row">
				<h3>
					<center>
						Featured products of
						<c:out value="${pharm.pharmacyName}">: </c:out>
					</center>
				</h3>
				<div id="${pharm.pharmacyID}" class="carousel slide"
					data-ride="carousel">

					<div class="carousel-inner" role="listbox">
						<div class="item active">
							<img class="center-block"
								src="images/<c:out value="${pharm.pharmacyLogo}"/>" />
							<br><br><center>Start browsing <c:out value="${pharm.pharmacyName}"></c:out> items.</center>
						</div>
						<c:forEach items="${Featurestock}" var="stock">
							<c:forEach items="${Featureitems}" var="items">
								<c:if test="${stock.productID == items.productID}">
									<c:if test="${stock.pharmacyID == pharm.pharmacyID}">
										<div class="item">
											<img class="center-block" src="images/<c:out value="${items.productImage}"/>" /><br>
											<form action='ShopController' method='post'>
												<select name='Quantity' class="center-block">
													<option value="1">1</option>
													<option value="2">2</option>
													<option value="3">3</option>
													<option value="4">4</option>
													<option value="5">5</option>
													<option value="6">6</option>
													<option value="7">7</option>
													<option value="8">8</option>
													<option value="9">9</option>
												</select>
												<input class="center-block" type="hidden" name="ProductID" value="<c:out value="${items.productID}" />" readonly>
												<input class="center-block" type="hidden" name="SelectedPharmacy" value="<c:out value="${pharm.pharmacyID}" />" readonly>
												<input class="center-block" type="hidden" name="FromCarosel" value="FromCarosel" readonly />
												<div class="text-center"><button class="btn btn-success btn-md" type="submit" name="Action" value="Addtocart">Add to Cart</button></div>
												<!-- <input class="center-block" type='submit' name='Action' value="Addtocart" style='display: on-hover' /> -->
											</form>
										</div>
									</c:if>
								</c:if>
							</c:forEach>
						</c:forEach>
					</div>

					<a class="left carousel-control" href="#${pharm.pharmacyID}"
						role="button" data-slide="prev"> <span
						class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> <a class="right carousel-control" href="#${pharm.pharmacyID}"
						role="button" data-slide="next"> <span
						class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
			</div>
		</c:forEach>
	</c:if>

	<c:if test="${userAccess == 1}">
		<hr>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
					<%-- <c:if test="${message != null}">
						<c:out value="${message}" />
					</c:if> --%>
					<div class="list-group">
						<a class="list-group-item">
							<h4 class="list-group-item-heading">Select Pharmacy to order
								from:</h4>
						</a>
					</div>
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
					<a href="CustomerSeniorCitizen.jsp" class="login && btn btn-warning" role="button">Are you a senior citizen?<br> Upload your senior citizen ID here</a>
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
						class="btn btn-primary" role="button" />View your Order Returns</a><br>
					<br>
				</div>
			</div>
		</div>
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
      						<a href="UpdateUser.jsp">Update User Details</a>
    					</a>
    				</div>
    				<a href="DispatcherController?Action=DispatchOrder" class="btn btn-info" role="button">Order Dispatch</a><br>
    			</div>
    		</div>
    	</div>
		<table id="driverTable" class="table table-striped table-bordered"
			width="100%">
			<thead>
				<tr>
					<th>Driver Name</th>
					<th>Driver Address</th>
					<th>Driver Contact Number</th>
					<th>Driver In Transit?</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${DriverList}" var="driver">
					<tr>
						<td><c:out value="${driver.driverName}" /></td>
						<td><c:out value="${driver.driverAddress}" /></td>
						<td><c:out value="${driver.driverContactNumber}" /></td>
						<td><c:out value="${driver.inTransit}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
			<div id="container">
				<div class="list-group">
					<a class="list-group-item list-group-item-info">
						<h4 class="list-group-item-heading">
							<center>Add New Driver</center>
						</h4>
					</a>
				</div>
			</div>	
				<!-- <tr>
					<th colspan ="4">Add New Driver</th>
				</tr> -->
		<table class="table table-striped table-bordered" width="100%">
			<thead>
				<tr>
					<th>Driver Name</th>
					<th>Driver Address</th>
					<th>Driver Contact Number</th>
					<th>Driver In Transit?</th>
				</tr>
			</thead>
			<tbody>
				<form action="DispatcherController">
					<tr>
						<td><input type="text" name="driverName" class="form-control"/></td>
						<td><input type="text" name="driverAddr" class="form-control"/></td>
						<td><input type="text" name="driverCont" class="form-control"/></td>
						<td><div class="text-center"><button class="btn btn-success btn-md" type="submit" name="Action" value="addDriver">Add Driver</button></div></td>
						<!-- <td><input type="submit" name="Action" value="addDriver"/></td> -->
					</tr>
				</form>
			</tbody>
		</table>	
		<hr>
		</c:if>
	<c:if test="${userAccess == 3}">
		<hr>
		<div class="container">
			<div class="row">
				<div class="col-md-6">
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
					<a href="PharmacistController?Action=Prescription && #approve"
						class="btn btn-info" role="button">Approve/Disapprove
						prescription orders</a><br> <br />
				</div>
			</div>
			</div>
			<br>
			<div id="container">
				<div class="list-group">
					<a class="list-group-item list-group-item-info">
						<h4 class="list-group-item-heading">
							<center>Your Pharmacy's Current Catalog</center>
						</h4>
					</a>
				</div>
			</div>	
	<table id="phardruglistTable" class="table table-striped table-bordered" width="100%">
		<thead>
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Generic Name</th>
				<th>Product Strength</th>
				<th>Image</th>
				<th>Product Form</th>
				<th>Product Packaging</th>
				<th>Product Description</th>
                <th>Unit Price</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${pharmaProductList}" var="item">
					<tr>
						<td><c:out value="${item.productID}" /></td>
						<td><c:out value="${item.productName}" /></td>
						<td><c:out value="${item.genericName}" /></td>
						<td><c:out value="${item.productStrength}" /></td>
						<td><div class="pop">
    						<img id="imageresource" src="images/<c:out value="${item.productImage}" />" alt="Medicine Image" width="100px" height="100px">
   						 	Click to Enlarge
						</div></td>
						<td><c:out value="${item.productForm}" /></td>
						<td><c:out value="${item.productPackaging}" /></td>
						<td><c:out value="${item.productDescription}" /></td>
						<td>&#8369;<c:out value="${item.priceSet}" /></td>
					</tr>
			</c:forEach>
		</tbody>
	</table>
			<br>
			<div id="container">
				<div class="list-group">
					<a id="approve" class="list-group-item list-group-item-info">
						<h4 class="list-group-item-heading">
							<center>Current Orders Heading to your Pharmacy That DO
								NOT require a prescription:</center>
						</h4>
					</a>
				</div>
			</div>
				<br>
				<table id="wopres" class="table table-striped table-bordered"
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
							<c:if test="${order.prescriptionID == 0 && order.branchID == PharmacistBranch.branchID && order.orderStatus.startsWith('PROCESSED')}">
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
											<div class="text-center"><button class="btn btn-danger btn-md" type="submit" value="Reject">Reject</button></div>
											<!-- <input type="submit" value="Reject"> -->
										</form>
										<br>
										<form action="ApprovalController" method="post">
											<input type="hidden" Name="action" value="OrderApprove" />
											<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
											<div class="text-center"><button class="btn btn-success btn-md" type="submit" value="Approve">Approve</button></div>
											<!-- <input type="submit" value="Approve"> -->
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
			<table id="wpres" class="table table-striped table-bordered"
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
						<c:if test="${order.prescriptionID != 0 && order.branchID == PharmacistBranch.branchID && order.orderStatus.startsWith('PROCESSED')}">
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
								<td><c:forEach items="${PrescriptionImage}" var="prescription">
										<c:if test="${order.prescriptionID == prescription.prescriptionID}">
											<div class = "pop"><img id="imageresource" src="images/<c:out value="${prescription.prescription}" />" alt="Medicine Image" width="100px" height="100px"></div>
										</c:if>
									</c:forEach>
								</td>
								<td>
									<form action="ApprovalController" method="post">
										<input type="hidden" Name="action" value="OrderReject" />
										<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
										<div class="text-center"><button class="btn btn-danger btn-md" type="submit" value="Reject">Reject</button></div>
										<!-- <input type="submit" value="Reject"> -->
									</form>
									<br>
									<form action="ApprovalController" method="post">
										<input type="hidden" Name="action" value="OrderApprove" />
										<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
										<div class="text-center"><button class="btn btn-success btn-md" type="submit" value="Approve">Approve</button></div>
										<!-- <input type="submit" value="Approve"> -->
									</form>
								</td>
								<td>
									<form action="ApprovalController" method="post">
										<input type="hidden" Name="action"  value="OrderInvalidate" />
										<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
										REASON:
										<input type="text"   Name="Reason" class="form-control" required/>
										<div class="text-center"><button class="btn btn-success btn-md" type="submit" value="Invalidate">Invalidate</button></div>
										<!-- <input type="submit" value="Invalidate"> -->
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
						<h4 id="return" class="list-group-item-heading">
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
									<td>
										<c:forEach items="${DeliveryReason}" var="delivery">
											<c:if test="${order.deliveryID == delivery.deliveryID}">
												<c:out value="${delivery.comments}" />
											</c:if>
										</c:forEach>
									</td>
									<td>
										<form action="ApprovalController" method="post">
											<input type="hidden" Name="action" value="ReturnReject" />
											<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
											<div class="text-center"><button class="btn btn-danger btn-md" type="submit" value="Reject">Reject</button></div>
											<!-- <input type="submit" value="Reject"> -->
										</form>
										<br>
										<form action="ApprovalController" method="post">
											<input type="hidden" Name="action" value="ReturnApprove" />
											<input type="hidden" Name="orderID" value="<c:out value="${order.orderID}"/>" />
											<div class="text-center"><button class="btn btn-success btn-md" type="submit" value="Approve">Approve</button></div>
											<!-- <input type="submit" value="Approve"> -->
										</form>
									</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			

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
					<th>Valid SSID?</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${CustomerList}" var="customer">
					<tr>
						<td><c:out value="${customer.customerName}" /></td>
						<td><c:out value="${customer.cityID}" /></td>
						<td><c:out value="${customer.email}" /></td>
						
						<c:if test="${customer.isSeniorCitizen == false && customer.seniorCitizenID == null}">
							<td>NO</td>
							<td>N/A</td>
							<td>N/A</td>
						</c:if>
						<c:if test="${customer.isSeniorCitizen == false && customer.seniorCitizenID != null}">
							<td>PENDING</td>
							<td><img class="center-block" src="images/<c:out value="${customer.seniorCitizenID}" />" /></td>
							<td>
								<form action="InformationController" method="post">
									<input type="hidden" Name="customerID" value="<c:out value="${customer.customerID}" />" />
									<div class="text-center"><button class="btn btn-success btn-md" type="submit" Name="Actionthing" value="SSIDApprove">SSIDApprove</button></div>
									<!-- <input type="submit" Name="Actionthing" value="SSIDApprove" /> -->
									<br>
									<div class="text-center"><button class="btn btn-danger btn-md" type="submit" Name="Actionthing" value="SSIDReject">SSIDReject</button></div>
									<!-- <input type="submit" Name="Actionthing" value="SSIDReject" /> -->
								</form>
							</td>
						</c:if>
						<c:if test="${customer.isSeniorCitizen == true}">
							<td>YES</td>
							<td><img class="center-block" src="images/<c:out value="${customer.seniorCitizenID}" />" width="300px" height="300px"/></td>
							<td>N/A</td>
						</c:if>
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
					<th>Courier Company</th>
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
						<td>
							<c:forEach items="${CourierList}" var="courier">
								<c:if test="${courier.courierServiceID == dispatcher.courierServiceID}">
									<c:out value="${courier.companyName}" />
								</c:if>
							</c:forEach>
						</td>
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
					<th>Pharmacy</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${PharmacistList}" var="pharmacist">
					<tr>
						<td><c:out value="${pharmacist.firstName}" /> <c:out
								value="${pharmacist.lastName}" /></td>
						<td><c:out value="${pharmacist.PRCNo}" /></td>
						<td><c:out value="${pharmacist.position}" /></td>
						<td>
						<c:forEach items="${PharmcyList}" var="pharmacy">
							<c:forEach items="${BranchList}" var="branch">
								<c:if test="${pharmacy.pharmacyID == branch.pharmacyID && pharmacist.branchID == branch.branchID}">
									<c:out value="${pharmacy.pharmacyName}" />
								</c:if>
							</c:forEach>
						</c:forEach>
						</td>
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
			<center>Items Inventory:</center>
		</h2>
		<table id="druglistTable" class="table table-striped table-bordered" width="100%">
			<thead>
				<tr>
					<th>Product ID</th>
					<th>Product Name</th>
					<th>Generic Name</th>
					<th>Product Strength</th>
					<th>Image</th>
					<th>Product Form</th>
					<th>Product Packaging</th>
					<th>Product Description</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${ProductList}" var="product">
					<tr>
						<td><c:out value="${product.productID}" /></td>
						<td><c:out value="${product.productName}" /></td>
						<td><c:out value="${product.genericName}" /></td>
						<td><c:out value="${product.productStrength}" /></td>
						<td><div class="pop">
	    					<img id="imageresource" src="images/<c:out value="${product.productImage}" />" alt="Medicine Image" width="100px" height="100px">
	   					 	Click to Enlarge
						</div></td>
						<td><c:out value="${product.productForm}" /></td>
						<td><c:out value="${product.productPackaging}" /></td>
						<td><c:out value="${product.productDescription}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
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
						<td>
							<c:forEach items="${PharmcyList}" var="pharmacy">
								<c:if test="${pharmacy.pharmacyID == branch.pharmacyID}">
									<c:out value="${pharmacy.pharmacyName}" />
								</c:if>
							</c:forEach>
						</td>
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

<div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">              
      <div class="modal-body">
      	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <img src="" class="imagepreview" style="width: 100%;" >
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
    margin-left: 200px;
    margin-right: 200px;
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

.btn-primary {
    color: #fff;
    background-color: #337ab7;
    border-color: #2e6da4;
    margin-left: 100px;
}

.btn-warning {
    color: #fff;
    background-color: #ec971f;
    border-color: #d58512;
    margin-left: 100px;
}

body {
	background: #f1f7fc;
}

/* Test */
.side-menu {
    width:13em;
    height: auto;
    margin:4em auto 0;
    font-size: 1em;
    line-height: 2em;
    color: #fff;
    font-weight:700;
    text-transform:uppercase;
    position:absolute;
    top:0; 
    bottom:0;
    left: -10em;
    margin-top: 100px;
}
.side-menu ul {
    list-style: none;
    margin: 0;
    padding: 0;
}
.side-menu ul li {
  display:block;
    background-color: #333;
    height: 6em;
    padding: 1em 1.5em;
    position: relative;
    -webkit-transition: -webkit-transform 0.5s,     background-color .5s, color .5s;
    transition: transform .5s, background-color .5s, color .5s;
}
/*the colors of the different columns*/
.side-menu ul li:nth-child(1) { background-color: #172a74;}
.side-menu ul li:nth-child(2) { background-color: #21a9af;}
.side-menu ul li:nth-child(3) { background-color: #21a9af;}
.side-menu ul li:nth-child(4) { background-color: #21a9af;}
.side-menu ul li:nth-child(5) { background-color: #21a9af;}
.side-menu ul li:nth-child(6) { background-color: #21a9af;}
.side-menu ul li:nth-child(8) { background-color: #172a74;}
.side-menu ul li:nth-child(9) { background-color: #21a9af;}
.side-menu ul li:nth-child(10) { background-color: #21a9af;}
.side-menu ul li:nth-child(11) { background-color: #21a9af;}
.side-menu ul li:nth-child(12) { background-color: #21a9af;}
.side-menu ul li:nth-child(13) { background-color: #21a9af;}


.side-menu ul li:hover {
    background-color: ; /*you can make different colors depending on the nth-child like above*/
    -webkit-transform: translateX(10em);
    transform: translateX(10em);/*equal to left in the .side-menu*/
}
.side-menu ul li a {
  display:block;
    color: #FFF;
    text-decoration: none;
}
.side-menu ul li span {
    display:block;
    position: absolute;
    font-size:1em;
    line-height: 2em;
    height:2em;
    top:0; 
    bottom:0;
    margin:0 auto;
    padding:1em 1.5em;
    right: 0.16666666666667em;
    color: #F8F6FF;
}
</style>

<script src="assets/bootstrap/js/jquery.dataTables.min.js"></script>
<script src="assets/bootstrap/js/dataTables.bootstrap.min.js"></script>

<script>

$(function() {
	$('.pop').on('click', function() {
		$('.imagepreview').attr('src', $(this).find('img').attr('src'));
		$('#imagemodal').modal('show');   
	});		
});

</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#driverTable").DataTable({
			"sPaginationType" : "full_numbers",
			"bJQueryUI" : true,
			"sScrollX" : "100%",
			"bScrollCollapse" : true
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$("#phardruglistTable").DataTable({
			"sPaginationType" : "full_numbers",
			"bJQueryUI" : true,
			"sScrollX" : "100%",
			"bScrollCollapse" : true
		});
	});
</script>

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
		$("#druglistTable").DataTable({
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