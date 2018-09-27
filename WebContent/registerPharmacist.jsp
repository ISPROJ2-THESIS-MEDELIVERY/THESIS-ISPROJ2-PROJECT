<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="RegistrationController" method="post" enctype="multipart/form-data">
		<input type="text" 		name="Username" 	required="" 	placeholder="User Name *"><br>
		<input type="password" 	name="Password" 	required="" 	placeholder="Create Password"><br>
		<hr>
		<input type="text" 		name="FistName" 	required="" 	placeholder="First Name *"><br>
		<input type="text" 		name="LastName" 	required="" 	placeholder="Last Name *"><br>
		<input type="text" 		name="PharNumb" 	required="" 	placeholder="PRC Number *"><br>
		<input type="text" 		name="PharPosi`" 	required="" 	placeholder="Position *"><br>
		<input type="text" 		name="PharText" 	required="" 	value="<c:out value="${PharmacySelect.pharmacyName}" />" disabled><br>
		<input type="hidden"	name="PharEyeD" 	required=""		value="<c:out value="${PharmacySelect.pharmacyID}" />">
		<select name="PharSele">
			<c:forEach items="${PharmacyBranch}" var="branch">
				<option value ="<c:out value="${branch.branchID}" />">
								<c:out value="${branch.branchStreet}" /> - 
								<c:out value="${branch.branchBarangay}" /> - 
								<c:out value="${branch.branchProvince}" /> - 
								<c:out value="${branch.branchOwner}" />
				</option>
			</c:forEach>
		</select>
		<hr>i
		<input type="hidden"	name="SecretCode" 	value="RjRILW7K7Xz96hD">
		<button type="submit" 	style="background-color:#56c5ff;">Sign Up</button></div>
		<a href="index.jsp" class="already" style="color:#282d32;font-size:20px;">back</a>
	</form>
</body>
</html>