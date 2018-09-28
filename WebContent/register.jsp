<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="RegistrationController" method="post" enctype="multipart/form-data">
	<input type="text" 		name="FullName" 		required="" placeholder="FullName *">
	<input type="text" 		name="Username" 		required="" placeholder="Username *">
	<input type="text" 		name="CAddress" 		required="" placeholder="Address *">
	<input type="email" 	name="CusEmail" 		required="" placeholder="Email *">
	<input type="number" 	name="ContactNumber" 	required="" placeholder="Contact Number *">
	<input type="password" 	name="Password" 		required="" placeholder="Create Password">
	<input type="password" 	name="Password-repeat" 	required="" placeholder="Re-enter Password" style="margin:0px;">
	<button type="submit" style="background-color:#56c5ff;">Sign Up</button></div>
	<a href="login.jsp" class="already" style="color:#282d32;font-size:20px;">back</a>
</form>
</body>
</html>