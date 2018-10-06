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
		<input type="text"		name="CompName" required="" placeholder="Courier Name">
		<input type="text"		name="CompStre" required="" placeholder="Courier Street">
		<input type="text"		name="CompBara" required="" placeholder="Courier Barangay">
		<input type="text"		name="CompCity" required="" placeholder="Courier City">
		<input type="text"		name="CompProv" required="" placeholder="Courier Province">
		<input type="number"	name="CompLand" required="" placeholder="Courier Landline">
		<input type="number"	name="CompCell" required="" placeholder="Courier Cellphone">
		<input type="text"		name="CompCont" required="" placeholder="Courier Contact">
		<input type="hidden"	name="Actionthing" value="addCourier">
		<button type="submit" 	style="background-color:#56c5ff;">Sign Up</button></div>
		<a href="/login.jsp" class="already" style="color:#282d32;font-size:20px;">back</a>
	</form>
</body>
</html>