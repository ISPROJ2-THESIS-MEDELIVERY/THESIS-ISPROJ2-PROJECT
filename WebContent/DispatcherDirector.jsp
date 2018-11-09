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
<link rel="stylesheet" href="assets/bootstrap/css/jquery.dataTables.min.css" />
<!-- <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" /> -->
<link rel="stylesheet" href="assets/css/styles.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" />
<link rel="stylesheet" href="assets/css/Header-Blue.css" />
<link rel="stylesheet" href="assets/css/Footer-Dark.css" />
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
                        <c:if test="${userAccess == null}">
                        <span class="navbar-text" style="float: right"><a href="login.jsp" class="login">Log In</a></span>
                        <span class="navbar-text" style="float: right"><a href="register.jsp" class="login">Register</a></span>
                        </c:if>
                        <c:if test="${userAccess == 1}">
                        <span class="navbar-text" style="float: right"><a href="LoginController" class="login">Log Out</a></span>
                        </c:if>
                        <c:if test="${userAccess == 2}">
                        <span class="navbar-text" style="float: right"><a href="LoginController" class="login">Logout</a></span>
                        <span class="navbar-text" style="float: right"><a href="DispatcherController?Action=DispatchOrder" class="login">Order Dispatch - Regular</a><br></span>						
                        </c:if>
                        <c:if test="${userAccess == 3}">
                        <span class="navbar-text" style="float: right"><a href="ProductController?Action=AddProduct" class="login">Add Product</a><br></span>
                        <span class="navbar-text" style="float: right"><a href="PharmacistController?Action=Prescription" class="login">Approve/Disapprove prescription orders</a></span>
						<span class="navbar-text" style="float: right"><a href="LoginController" class="login">Logout</a><br></span>
                        </c:if>
                        <c:if test="${userAccess == 4}">
                        <span class="navbar-text" style="float: right"><a href="LoginController" class="login">Log Out</a></span>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    
    <br>
    
    <div id="container-fluid">
	<h2>PENDING DELIVERIES</h2>
    <table id="pendingTable" class="table-wrapper table-striped table-bordered" width="100%">
		<thead>
			<tr>
	            <th>Address</th>
	            <th>Date Ordered</th>
	            <th>Type</th>
	            <th>Status</th>
	            <th>Prescription?</th>
	            <th>Senior Citizen?</th>
	            <th>Order Details</th>
	            <th>Total Cost</th>
	            <th>Pharmacy</th>
	            <th>Set Pharmacy</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${DispatcherOrderList}" var="order">
				<c:if test="${order.orderStatus.startsWith('PENDING') && order.pharmacyID >= 1}">
					<tr>
			            <td><c:out value="${order.orderAddress}" /></td>
			            <td><c:out value="${order.dateOrdered}" /></td>
			            <td><c:out value="${order.orderType}" /></td>
			            <td><c:out value="${order.orderStatus}" /></td>
			            <td>
							<c:if test="${order.prescriptionID == 0}">
								NO PRESCRIPTION
							</c:if>
							<c:if test="${order.prescriptionID != 0}">
								PRESCRIPTION REQUIRED
							</c:if>
			            </td>
			            <td><c:out value="${order.seniorDiscount}" /></td>
			            <td>			            	
				            <table class="table-wrapper table-striped table-bordered" width="100%">
							    <thead>
							        <tr>
							            <th>Product Name</th>
							            <th>Quantity</th>
							            <th>Cost Per Unit</th>
							            <th>Total Cost</th>
							        </tr>
							    </thead>
							    <tbody>
							    	<c:forEach items="${DispatcherOrderDetailsList}" var="orderdetails">
										<c:if test="${order.orderID == orderdetails.orderID}">
							            <tr>
							                <td>
							    				<c:forEach items="${ProductTranslation}" var="product">
							    					<c:if test="${orderdetails.productID == product.productID}">
							                			<c:out value="${product.productName}" />
							    					</c:if>
							                	</c:forEach>
							                </td>
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
			            <td>
							<c:forEach items="${SelectPharmacy}" var="pharmacy">
								<c:if test="${pharmacy.pharmacyID == order.pharmacyID}">
									<c:out value="${pharmacy.pharmacyName}" />
								</c:if>
							</c:forEach>
						</td>
						<td>
							<form action='DispatcherController' method='post'>
								<input type="hidden" name="OrderID" value="${order.orderID}"/>
								Branch:<br>
								<select name="BranchID">
									<c:forEach items="${ListBranches}" var="branch">
										<c:if test="${branch.pharmacyID == order.pharmacyID}">
											<option value="<c:out value="${branch.branchID}" />"><c:out value="${branch.branchOwner}" /></option>
										</c:if>
									</c:forEach>
								</select><br>
								Delivery Person:<br>
								<select name="DriverID">
									<c:forEach items="${DriverList}" var="driver">
										<c:if test="${CourierService == driver.courierserviceID}">
											<option value="<c:out value="${driver.driverID}" />"><c:out value="${driver.driverName}" /></option>
										</c:if>
									</c:forEach>
								</select><br>
								Plate Number: <br>
									<input type="text" name="PlateNumber"/><br>
								<input type="submit" name="action" value="assignOrder" placeholder="Set Order">
							</form>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<div id="container-fluid">
	<h2>APPROVED DELIVERIES</h2>
    <table id="approvedTable" class="table-wrapper table-striped table-bordered" width="100%">
		<thead>
			<tr>
	            <th>Quantity</th>
	            <th>Address</th>
	            <th>Date Ordered</th>
	            <th>Type</th>
	            <th>Status</th>
	            <th>Prescription?</th>
	            <th>Senior Citizen?</th>
	            <th>Order Details</th>
	            <th>Total Cost</th>
	            <th>Confirm Delivery</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${DispatcherOrderList}" var="order">
				<c:if test="${order.orderStatus == 'EN-ROUTE' && order.pharmacyID >= 1}">
					<tr>
			            <td><c:out value="${order.orderAddress}" /></td>
			            <td><c:out value="${order.dateOrdered}" /></td>
			            <td><c:out value="${order.orderType}" /></td>
			            <td><c:out value="${order.orderStatus}" /></td>
			            <td>
							<c:if test="${order.prescriptionID == 0}">
								NO PRESCRIPTION
							</c:if>
							<c:if test="${order.prescriptionID != 0}">
								PRESCRIPTION REQUIRED
							</c:if>
			            </td>
			            <td><c:out value="${order.seniorDiscount}" /></td>
			            <td>
				            <table class="table-wrapper table-striped table-bordered" width="100%">
							    <thead>
							        <tr>
							            <th>Product Name</th>
							            <th>Quantity</th>
							            <th>Cost Per Unit</th>
							            <th>Total Cost</th>
							        </tr>
							    </thead>
							    <tbody>
							    	<c:forEach items="${DispatcherOrderDetailsList}" var="orderdetails">
										<c:if test="${order.orderID == orderdetails.orderID}">
							            <tr>
							                <td>
							    				<c:forEach items="${ProductTranslation}" var="product">
							    					<c:if test="${orderdetails.productID == product.productID}">
							                			<c:out value="${product.productName}" />
							    					</c:if>
							                	</c:forEach>
							                </td>
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
						<td>
							<form action='DispatcherController' method='post'>
								<input type="hidden" name="OrderID" value="${order.orderID}"/>
								<input type="submit" name="action" value="confirmOrder" placeholder="Order Delivered">
							</form>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
	</div>
	<div id="container-fluid">
	<h2>RETURNING DELIVERIES</h2>
    <table id="returningTable" class="table-wrapper table-striped table-bordered" width="100%">
		<thead>
			<tr>
	            <th>Date Ordered</th>
	            <th>Type</th>
	            <th>Status</th>
	            <th>Prescription?</th>
	            <th>Senior Citizen?</th>
	            <th>Order Details</th>
	            <th>Total Cost</th>
	            <th>Pharmacy Address</th>
	            <th>Return to</th>
	            <th>Confirm Delivery</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${DispatcherOrderList}" var="order">
				<c:if test="${order.orderStatus == 'RETURNING'}">
					<tr>
			            <td><c:out value="${order.dateOrdered}" /></td>
			            <td><c:out value="${order.orderType}" /></td>
			            <td><c:out value="${order.orderStatus}" /></td>
			            <td>
							<c:if test="${order.prescriptionID == 0}">
								NO PRESCRIPTION
							</c:if>
							<c:if test="${order.prescriptionID != 0}">
								PRESCRIPTION REQUIRED
							</c:if>
			            </td>
			            <td><c:out value="${order.seniorDiscount}" /></td>
			            <td>
				            <table class="table-wrapper table-striped table-bordered" width="100%">
							    <thead>
							        <tr>
							            <th>Product Name</th>
							            <th>Quantity</th>
							            <th>Cost Per Unit</th>
							            <th>Total Cost</th>
							        </tr>
							    </thead>
							    <tbody>
							    	<c:forEach items="${DispatcherOrderDetailsList}" var="orderdetails">
										<c:if test="${order.orderID == orderdetails.orderID}">
							            <tr>
							                <td>
							    				<c:forEach items="${ProductTranslation}" var="product">
							    					<c:if test="${orderdetails.productID == product.productID}">
							                			<c:out value="${product.productName}" />
							    					</c:if>
							                	</c:forEach>
							                </td>
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
			            <td>
							<c:forEach items="${ListBranches}" var="branch">
				           		<c:if test="${branch.branchID == order.branchID}">
									<c:out value="${branch.branchStreet}" />, 
									<c:out value="${branch.branchBarangay}" />, 
									<c:out value="${branch.cityID}" />, 
									<c:out value="${branch.branchProvince}" />
								</c:if>
							</c:forEach>
			            </td>
			            <td><c:out value="${order.orderAddress}" /></td>
						<td>
							<form action='DispatcherController' method='post'>
								<input type="hidden" name="OrderID" value="${order.orderID}"/>
								<input type="submit" name="action" value="returnedOrder" placeholder="Return Order">
							</form>
						</td>
					</tr>
				</c:if>
			</c:forEach>
		</tbody>
	</table>
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
                    <p><br />Our mission is to create a measurable, sustainable and profitable link between pharmacies, couriers and customers.  Providing the best system in storing databases of available pharmacies and delivery couriers, as well as management
                        of theses deliveries. Our operation is also to bring convenience to customers by filtering their needs according to the type of payment they want and the type of delivery schedule that fits their respective timeframes.<br /><br
                        /><br /></p>
                </div>
            </div>
            <p class="copyright">Company Name © 2017</p>
        </div>
    </footer>
</div>
</body>

<style>

body {
	background-color: #f1f7fc;
}

</style>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="assets/bootstrap/js/jquery.dataTables.min.js"></script>
<script src="assets/bootstrap/js/dataTables.bootstrap.min.js"></script>

<!-- 	<script type="text/javascript">
		 $(document).ready(function() {
			$("#druglistTable").DataTable();
		}); 
	</script> -->
	
	<script type="text/javascript">
		 $(document).ready(function() {
			$("#pendingTable").DataTable({
				"sPaginationType": "full_numbers",
                "bJQueryUI": true, "sScrollX": "100%",
                "bScrollCollapse": true
			});
		}); 
	</script>
	
	<script type="text/javascript">
		 $(document).ready(function() {
			$("#approvedTable").DataTable({
				"sPaginationType": "full_numbers",
                "bJQueryUI": true, "sScrollX": "100%",
                "bScrollCollapse": true
			});
		}); 
	</script>
	
	<script type="text/javascript">
		 $(document).ready(function() {
			$("#returningTable").DataTable({
				"sPaginationType": "full_numbers",
                "bJQueryUI": true, "sScrollX": "100%",
                "bScrollCollapse": true
			});
		}); 
	</script>




</html>