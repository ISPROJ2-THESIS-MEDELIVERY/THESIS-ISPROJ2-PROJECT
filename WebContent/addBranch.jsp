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
	<form action="InformationController" method="post">
		<input type="text"		name="BrchStrt" required="" placeholder="Branch Street">
		<input type="text"		name="BrchBngy" required="" placeholder="Branch Barangay">
		<select name="BrchCity">
			<c:forEach items="${CityList}" var="city">
				<option value =<c:out value="${city.cityID}"/>><c:out value="${city.cityName}" /></option>
			</c:forEach>
		</select>
		<input type="text"		name="BrchProv" required="" placeholder="Branch Province">
		<input type="number"	name="BrchLand" required="" placeholder="Branch Landline">
		<input type="number"	name="BrchCell" required="" placeholder="Branch Cellphone">
		<input type="text"		name="BrchOwnr" required="" placeholder="Branch Owner">
		<select name="BrchPHID">
			<c:forEach items="${PharmacyList}" var="pharmacy">
				<option value =<c:out value="${pharmacy.pharmacyID}"/>><c:out value="${pharmacy.pharmacyName}" /></option>
			</c:forEach>
		</select>
		<input type="hidden"	name="Actionthing" value="addBranch">
		<button type="submit" 	style="background-color:#56c5ff;">Sign Up</button></div>
		<a href="/login.jsp" class="already" style="color:#282d32;font-size:20px;">back</a>
	</form>
</body>
</html>