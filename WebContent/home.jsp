<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<title>Home Page</title>
<!-- <link rel="stylesheet" href="assets/bootstrap/js/bootstrap.min.js" />
<link rel="stylesheet" href="assets/bootstrap/js/jquery.min.js" />
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" /> -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" />
<link rel="stylesheet" href="assets/css/Header-Blue.css" />
<link rel="stylesheet" href="assets/css/styles.css" />
<link rel="stylesheet" href="assets/css/style.css" />

</head>
<body>
	<!-- This will be used as a jumping point to test the controllers -->
	 <div>
        <div class="header-blue">
            <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                <div class="container"><a href="index.jsp" class="navbar-brand">Medelivery</a>
                    <div class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav"></ul>
                        <form target="_self" class="form-inline mr-auto">
                            <div class="form-group"><label for="search-field"></label></div>
                        </form>
                        <c:if test="${userAccess == null}">
                        <span class="navbar-text" style="float: right"><a href="login.jsp" class="login">Log In</a></span>
                        <span class="navbar-text" style="float: right"><a href="register.jsp" class="login">Register</a></span>
                        </c:if>
                        <c:if test="${userAccess == 1}">
                        <span class="navbar-text" style="float: right"><a href="LoginController" class="login">Log Out</a></span>
                        </c:if>
                        <c:if test="${userAccess == 2}">
                        <span class="navbar-text" style="float: right"><a href="DispatcherController?Action=DispatchOrder">Order Dispatch - Regular</a><br></span>
						<span class="navbar-text" style="float: right"><a href="LoginController">Logout</a></span>
                        </c:if>
                        <c:if test="${userAccess == 3}">
                        <span class="navbar-text" style="float: right"><a href="ProductController?Action=AddProduct">Add Product</a><br></span>
                        <span class="navbar-text" style="float: right"><a href="PharmacistController?Action=Prescription">Approve/Disapprove prescription orders</a></span>
						<span class="navbar-text" style="float: right"><a href="LoginController">Logout</a><br></span>
                        </c:if>
                        <c:if test="${userAccess == 4}">
                        <span class="navbar-text" style="float: right"><a href="LoginController" class="login">Log Out</a></span>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
	    <c:if test="${justReg != null}"> 
	    	<div role="alert" class="alert alert-info"><span><strong>A confirmation email has been sent to your email address</strong></span></div>
		</c:if>
		
	
	<c:forEach items="${Featurepharm}" var="pharm">
	<div class="row">
	<h3>Featured products of <c:out value="${pharm.pharmacyName}">: </c:out></h3>
			<div id="featured-products" class="carousel slide"
				data-ride="carousel">
				<ol class="carousel-indicators">
					<li data-target="#featured-products" data-slide-to="0" class="active"></li>
					<li data-target="#featured-products" data-slide-to="1"></li>
					<li data-target="#featured-products" data-slide-to="2"></li>
					<li data-target="#featured-products" data-slide-to="3"></li>
				</ol>

				<div class="carousel-inner" role="listbox">		
				<div class="item active"><img class="img-responsive"src="images/product1.jpg"/></div>
				<c:forEach items="${Featurestock}" var="stock">
					<c:forEach items="${Featureitems}" var="items">
							<c:if test="${stock.productID == items.productID}">
								<c:if test="${stock.pharmacyID == pharm.pharmacyID}">	  
									<div class="item">	
									<a href="http://www.google.com/">					
										<img width="500" height="500" class="center-block" src="images/<c:out value="${items.productImage}"/>"/>																											
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
		

	
	<div class="row">
			<div class="col-md-4">
				<h2>Product Catalog</h2>
				<div class="panel panel-default">
					<div class="panel-body">
						<center><img
							src="assets/img/Attractive-Pharmaceutical-Packaging-Design-Inspiration-014.jpg"
							class="img-responsive" style="height:550px;width:400px;"/></center>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<h2>Frequently Asked Questions</h2>
				<div class="panel panel-default">
					<div class="panel-body">
						<center><img src="assets/img/DoctorWho.jpg" class="img-responsive" /></center>
					</div>
				</div>
			</div>
			<div class="col-md-4">
				<h2>Contact Us</h2>
				<h5>
					<strong><center>Phone: 555-0199 </center></strong>

				</h5>

				<div class="panel panel-default">
					<div class="panel-body">
						<div id="map-canvas" style="height:300px; width:500px"></div>
					</div>
				</div>
			</div>
		</div>

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
        			<br>Select Pharmacy to order from:<br>
					<c:forEach items="${PharmcyList}" var="pharmacy">
					<a href="CustomerController?action=GoToCatalog&PharmaID=<c:out value="${pharmacy.pharmacyID}" />" class="btn btn-info btn-sm" role="button"><c:out value="${pharmacy.pharmacyName}" /></a><br>
					</c:forEach>
        		</div>
        		<div class="col-md-6">
        			<br>Select Pharmacy to order from (Prescription):<br>
					<c:forEach items="${PharmcyList}" var="pharmacy">
					<a href="CustomerController?action=GoToPrescription&PharmaID=<c:out value="${pharmacy.pharmacyID}" />" class="btn btn-info btn-sm" role="button"><c:out value="${pharmacy.pharmacyName}" /></a><br>
					</c:forEach>
        		</div>
        		
        		<div class="col-md-6">
        			<p class="font-weight-bold">Customer Details:</p>
					User ID: <c:out value="${userID}" /><br>
					Username: <c:out value="${username}" /><br>
					User Type: <c:out value="${userAccess}" /><br>
					<!-- <a href="LoginController">Logout</a><br> -->
				</div>
        		<div class="col-md-6">
        			<!-- Order History: -->
					<a href="CustomerController?action=GoToOrders" class="btn btn-primary" role="button"/>Go to Order History</a><br><br>
        			<!-- Order Pending: -->
					<a href="CustomerController?action=GoToPending" class="btn btn-primary" role="button"/>Go to Pending Orders</a><br>
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
        			<p class="font-weight-bold">Dispatcher Details:</p><br>
					User ID: <c:out value="${userID}" /><br>
					Username: <c:out value="${username}" /><br>
					User Type: <c:out value="${userAccess}" /><br>
					<a href="DispatcherController?Action=DispatchOrder">Order Dispatch - Regular</a><br>
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
        			<p class="font-weight-bold">Pharmacist Details:</p>
					<c:forEach items="${Prescription}" var="prescription">
						<img src='images/<c:out value="${prescription.prescription}"></c:out>'>
					</c:forEach>
					User ID: <c:out value="${userID}" /><br>
					Username: <c:out value="${username}" /><br>
					User Type: <c:out value="${userAccess}" /><br>
					<!-- <a href="LoginController">Logout</a><br> -->
					<a href="ProductController?Action=addProduct" class="btn btn-info" role="button">Add Product</a><br>
					<a href="PharmacistController?Action=Prescription" class="btn btn-info" role="button">Approve/Disapprove prescription orders</a><br>
					Current Orders Heading to your Pharmacy:
					<a href="PharmacistController?Action=GoToOrders" class="btn btn-info" role="button"><c:out value="${PharmacistPharmacy.pharmacyName}" />'s Regular Orders</a>
					<%-- <a href="PharmacistController?action=GoToOrders&PharmaID=<c:out value="${PharmacistPharmacy.pharmacyID}" />"><c:out value="${PharmacistPharmacy.pharmacyName}" />'s Pharmacy Orders</a> --%>
					
					<br>
				</div>
    		</div>
		</div>	
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
			<p class="font-weight-bold">Admin Details</p>
			User ID: <c:out value="${userID}" /><br>
			Username: <c:out value="${username}" /><br>
			User Type: <c:out value="${userAccess}" /><br>
			<hr>List of customers:<br>
				<table class="table table-striped table-bordered" width="100%">
					<thead>
						<tr>
							<th>Customer Name</th>
							<th>Customer Address</th>
							<th>Customer CityID</th>
							<th>Customer Email</th>
							<th>Senior Citizen?</th>
							<th>Senior Citizen ID</th>
							<th>Contact Number</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${CustomerList}" var="customer">
						<tr>
							<td><c:out value="${customer.customerName}" /></td>
							<td><c:out value="${customer.address}" /></td>
							<td><c:out value="${customer.cityID}" /></td>
							<td><c:out value="${customer.email}" /></td>
							<td><c:out value="${customer.isSeniorCitizen}" /></td>
							<td><c:out value="${customer.seniorCitizenID}" /></td>
							<td><c:out value="${customer.contactNumber}" /></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			<hr>List of dispatchers:<br>
				<a href="RegistrationController?Action=AddDispatcher" class="btn btn-info" role="button">Register a new Dispatcher</a><br>
				<table class="table table-striped table-bordered" width="100%">
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
							<td><c:out value="${dispatcher.firstName}" /> <c:out value="${dispatcher.lastName}" /></td>
							<td><c:out value="${dispatcher.contactNumber}" /></td>
							<td><c:out value="${dispatcher.address}" /></td>
							<td><c:out value="${dispatcher.birthdate}" /></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			<hr>List of pharmacists:<br>
				<c:forEach items="${PharmcyList}" var="pharmacy">
					<a href="RegistrationController?Action=AddPharmacist&PharmacyID=<c:out value="${pharmacy.pharmacyID}" />" class="btn btn-info" role="button">Register a new Pharmacist in <c:out value="${pharmacy.pharmacyName}" /></a><br>
				</c:forEach>
				<table class="table table-striped table-bordered" width="100%">
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
							<td><c:out value="${pharmacist.firstName}" /> <c:out value="${pharmacist.lastName}" /></td>
							<td><c:out value="${pharmacist.PRCNo}" /></td>
							<td><c:out value="${pharmacist.position}" /></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			<hr>List of admin:<br>
				<a href="RegistrationController?Action=AddAdmin" class="btn btn-info" role="button">Register a new Admin</a><br>
				<table class="table table-striped table-bordered" width="100%">
					<thead>
						<tr>
							<th>Admin Name</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${AdminList}" var="admin">
						<tr>
							<td><c:out value="${admin.firstName}" /> <c:out value="${admin.surname}" /></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			<hr>Add a new Item:<br>
			<hr>List of Pharmacies:<br>
				<a href="InformationController?Action=AddPharmacy" class="btn btn-info" role="button">Add a new Pharmacy</a><br>
				<table class="table table-striped table-bordered" width="100%">
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
			<hr>List of branches:<br>
				<a href="InformationController?Action=AddBranch" class="btn btn-info" role="button">Add a new Branch</a><br>
				<table class="table table-striped table-bordered" width="100%">
					<thead>
						<tr>
							<th>Branch Address</th>
							<th>Branch Landline</th>
							<th>Branch Cellphone</th>
							<th>Branch Contact</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${BranchList}" var="branch">
						<tr>
							<td><c:out value="${branch.branchStreet}" />,<c:out value="${branch.branchBarangay}" />,<c:out value="${branch.cityID}" />,<c:out value="${branch.branchProvince}" /></td>
							<td><c:out value="${branch.branchProvince}" /></td>
							<td><c:out value="${branch.branchLandline}" /></td>
							<td><c:out value="${branch.branchOwner}" /></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			<hr>List of Couriers:<br>
				<a href="InformationController?Action=AddCourier" class="btn btn-info" role="button">Add a new Courier branch</a><br>
				<table class="table table-striped table-bordered" width="100%">
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
							<td><c:out value="${courier.companyStreet}" />,<c:out value="${courier.companyBarangay}" />,<c:out value="${courier.companyCity}" />,<c:out value="${courier.companyProvince}" /></td>
							<td><c:out value="${courier.companyProvince}" /></td>
							<td><c:out value="${courier.companyLandline}" /></td>
							<td><c:out value="${courier.companyContact}" /></td>
						</tr>
						</c:forEach>
					</tbody>
				</table>
			<hr>Log out:<br>
				<a href="LoginController">Logout</a><br>
			<hr>
		</c:if>
		
		
		
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
		
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<script
    src="https://maps.googleapis.com/maps/api/js?v=3.exp&sensor=false
"></script>
<script>
var map;
function initialize() {
  var mapOptions = {
    zoom: 8,
    center: new google.maps.LatLng(-34.397, 150.644)
  };
  map = new google.maps.Map(document.getElementById('map-canvas'),
      mapOptions);
}

google.maps.event.addDomListener(window, 'load', initialize);
</script>
		
	</body>
</html>