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
		<input type="text" 		name="FistName" 		required="" 	placeholder="Full Name *">
		<input type="text" 		name="LastName" 		required="" 	placeholder="Last Name *">
		<input type="text" 		name="Username" 		required="" 	placeholder="User Name *">
		<input type="password" 	name="Password" 		required="" 	placeholder="Create Password">
		<input type="password" 	name="Password-repeat" 	required="" 	placeholder="Re-enter Password" style="margin:0px;">
		<input type="hidden"	name="SecretCode"		value="i3Up8XmH04Jz151">
		<button type="submit" style="background-color:#56c5ff;">Sign Up</button></div>
		<a href="/login.jsp" class="already" style="color:#282d32;font-size:20px;">back</a>
	</form>
</body>
</html>