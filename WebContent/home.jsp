<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Home Page</title>
</head>
	<body>
	<!-- This will be used as a jumping point to test the controllers -->
		<c:if test="${userAccess == null}">
			<a href="login.jsp">Login</a><br>
			<a href="register.jsp">Registration</a><br>
		</c:if>
		
		<c:if test="${userAccess == 1}">
			<hr>
			Customer Details<br>
			<c:out value="${userID}" /><br>
			<c:out value="${username}" /><br>
			<c:out value="${userAccess}" /><br>
			<a href="LoginController">Logout</a><br>
			<br>Pharmacies:<br>
			<c:forEach items="${PharmcyList}" var="pharmacy">
				<a href="CustomerController?action=GoToCatalog&PharmaID=<c:out value="${pharmacy.pharmacyID}" />"><c:out value="${pharmacy.pharmacyName}" /></a><br>
			</c:forEach>
			Order History:
				<a href="CustomerController?action=GoToOrders" />To to Order History</a><br>
			<hr>
		</c:if>
		<c:if test="${userAccess == 2}">
			<hr>
			Dispatcher<br>
			<c:out value="${userID}" /><br>
			<c:out value="${username}" /><br>
			<c:out value="${userAccess}" /><br>
			<a href="LoginController">Logout</a><br>
			<hr>
		</c:if>
		<c:if test="${userAccess == 3}">
			<hr>
			Pharmacist Details<br>
			<c:out value="${userID}" /><br>
			<c:out value="${username}" /><br>
			<c:out value="${userAccess}" /><br>
			<a href="LoginController">Logout</a><br>
			<a href="ProductController?Action=AddProduct">Add Product</a><br>
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
	</body>
</html>