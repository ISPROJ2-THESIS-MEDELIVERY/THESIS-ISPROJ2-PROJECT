<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="InformationController" method="post" enctype="multipart/form-data">
		<h6></h6>
		<input type="text" 		name="Username" 	required="" 	placeholder="User Name *"><br>
		<input type="password" 	name="Password" 	required="" 	placeholder="Create Password"><br>
		<hr>
		<input type="text" 		name="FistName" 	required="" 	placeholder="First Name *"><br>
		<input type="text" 		name="LastName" 	required="" 	placeholder="Last Name *"><br>
		<input type="number" 	name="PhoneNum" 	required="" 	placeholder="Phone Number *"><br>
		<input type="text" 		name="UAddress" 	required="" 	placeholder="Dispatch Adress *"><br>
		<input type="date" 		name="BrthDate" 	required="" 	placeholder="Birthday *"><br>
		<select name="PharSele">
			<c:forEach items="${PharmacyList}" var="pharmacy">
				<option value ="<c:out value="${pharmacy.pharmacyID}" />"><c:out value="${pharmacy.pharmacyName}" /></option>
			</c:forEach>
		</select>
		<hr>
		<input type="hidden"	name="SecretCode" 	value="RjRILW7K7Xz96hD">
		<button type="submit" 	style="background-color:#56c5ff;">Sign Up</button></div>
		<a href="/login.jsp" class="already" style="color:#282d32;font-size:20px;">back</a>
	</form>
</body>
</html>