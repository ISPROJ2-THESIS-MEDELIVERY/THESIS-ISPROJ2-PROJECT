<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<form action="InformationController" method="post">
		<input type="text"		name="PharmaName" required="" placeholder="Pharmacy Name">
		<!-- <input type="file"		name="PharmaFile" required="" placeholder="Pharmacy Logo"> enctype="multipart/form-data"-->
		<input type="hidden"	name="Actionthing" value="addPharmacy">
		<button type="submit" 	style="background-color:#56c5ff;">Sign Up</button></div>
		<a href="/login.jsp" class="already" style="color:#282d32;font-size:20px;">back</a>
	</form>
</body>
</html>