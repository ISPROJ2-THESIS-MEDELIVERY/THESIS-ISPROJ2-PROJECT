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
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" />
<link rel="stylesheet" href="assets/css/Header-Blue.css" />
<link rel="stylesheet" href="assets/css/styles.css" />
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
                        <span class="navbar-text"><a href="login.jsp" class="login">Log In</a></span>
                        <span class="navbar-text"><a href="register.jsp" class="login">Register</a></span>
                        </c:if>
                        <c:if test="${userAccess == 1}">
                        <span class="navbar-text"><a href="LoginController" class="login">Log Out</a></span>
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
		</c:forEach>
			<!-- <c:if test="${userAccess == null}">
				<a href="login.jsp">Login</a><br>
				<a href="register.jsp">Registration</a><br>
			</c:if> -->
		<c:if test="${userAccess == 1}">
			<hr>
		<div class="container">
    		<div class="row">
        		<div class="col-md-6">
        			Customer Details:<br>
					<c:out value="${userID}" /><br>
					<c:out value="${username}" /><br>
					<c:out value="${userAccess}" /><br>
					<a href="LoginController">Logout</a><br>
				</div>
        		<div class="col-md-6">
        			<br>Pharmacies:<br>
					<c:forEach items="${PharmcyList}" var="pharmacy">
					<a href="CustomerController?action=GoToCatalog&PharmaID=<c:out value="${pharmacy.pharmacyID}" />"><c:out value="${pharmacy.pharmacyName}" /></a><br>
					</c:forEach>
        		</div>
        		<div class="col-md-6">
        			Order History:
					<a href="CustomerController?action=GoToOrders" />To to Order History</a><br>
        			Order Pending:
					<a href="CustomerController?action=GoToPending" />To to Pending Orders</a><br>
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
        			Dispatcher<br>
					<c:out value="${userID}" /><br>
					<c:out value="${username}" /><br>
					<c:out value="${userAccess}" /><br>
					<a href="DispatcherController?Action=DispatchOrder">Add Product</a><br>
					<a href="LoginController">Logout</a><br>
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
        			Pharmacist Details<br>
					<c:out value="${userID}" /><br>
					<c:out value="${username}" /><br>
					<c:out value="${userAccess}" /><br>
					<a href="LoginController">Logout</a><br>
					<a href="ProductController?Action=AddProduct">Add Product</a><br>
					<a href="PharmacistController?Action=Prescription">Approve/Disapprove prescription orders</a><br>
					Current Orders Heading to your Pharmacy:
					<c:forEach items="${PharmcyList}" var="pharmacy">
						<a href="CustomerController?action=GoToCatalog&PharmaID=<c:out value="${pharmacy.pharmacyID}" />"><c:out value="${pharmacy.pharmacyName}" /></a><br>
					</c:forEach>
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
			Admin Details<br>
			<c:out value="${userID}" /><br>
			<c:out value="${username}" /><br>
			<c:out value="${userAccess}" /><br>
			<hr>List of customers:<br>
				<table border="1">
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
				<a href="RegistrationController?Action=AddDispatcher">Register a new Dispatcher</a><br>
				<table border="1">
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
					<a href="RegistrationController?Action=AddPharmacist&PharmacyID=<c:out value="${pharmacy.pharmacyID}" />">Register a new Pharmacist in <c:out value="${pharmacy.pharmacyName}" /></a><br>
				</c:forEach>
				<table border="1">
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
				<a href="RegistrationController?Action=AddAdmin">Register a new Admin</a><br>
				<table border="1">
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
				<a href="InformationController?Action=AddPharmacy">Add a new Pharmacy</a><br>
				<table border="1">
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
				<a href="InformationController?Action=AddBranch">Add a new Branch</a><br>
				<table border="1">
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
				<a href="InformationController?Action=AddCourier">Add a new Courier branch</a><br>
				<table border="1">
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
	</body>
</html>