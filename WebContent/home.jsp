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
			<c:out value="${Thcode}" /><br>
			<c:out value="${Encode}" /><br>
			<c:out value="${Decode}" /><br>
		</c:if>
		
		<c:if test="${userAccess == 1}">
			<hr>
			Customer<br>
			<c:out value="${userID}" /><br>
			<c:out value="${username}" /><br>
			<c:out value="${userAccess}" /><br>
			<a href="LoginController">Logout</a><br>
			<br>Pharmacies:<br>
			<c:forEach items="${PharmcyList}" var="pharmacy">
				<a href="CustomerController?PharmaID=<c:out value="${pharmacy.pharmacyID}" />"><c:out value="${pharmacy.pharmacyName}" /></a><br>
			</c:forEach>
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
			Pharmacist<br>
			<c:out value="${userID}" /><br>
			<c:out value="${username}" /><br>
			<c:out value="${userAccess}" /><br>
			<a href="LoginController">Logout</a><br>
			<hr>
		</c:if>
		<c:if test="${userAccess == 4}">
			<hr>
			Admin<br>
			<c:out value="${userID}" /><br>
			<c:out value="${username}" /><br>
			<c:out value="${userAccess}" /><br>
			<hr>Add a new User:<br>
			<a href="RegistrationController?Action=AddDispatcher">Register a new Dispatcher</a><br>
			<a href="RegistrationController?Action=AddPharmacist">Register a new Pharmacist</a><br>
			<a href="RegistrationController?Action=AddAdmin">Register a new Admin</a><br>
			<hr>Add a new User:<br>
			<a href="RegistrationController?Action=AddPharmacy">Add a new Pharmacy</a><br>
			<a href="RegistrationController?Action=AddBranch">Add a new Branch</a><br>
			<hr>Log out:<br>
			<a href="LoginController">Logout</a><br>
			<hr>
		</c:if>
	</body>
</html>