<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<title>Home Page</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" />
<link rel="stylesheet" href="assets/css/Header-Blue.css" />
<link rel="stylesheet" href="assets/css/styles.css" />
</head>
	<body>
			<hr>
			<form action="RegistrationController" method="post" enctype="multipart/form-data">
		        Name: 		<input type="text" name="UpdateName" required="" placeholder="<c:out value="${CustomerInfo.customerName}" />" class="form-control"/><br>
				Street:		<input type="text" name="UpdateStrt" required="" placeholder="<c:out value="${CustomerInfo.customerName}" />" class="form-control"/><br>
				Barangay:	<input type="text" name="UpdateBrgy" required="" placeholder="<c:out value="${CustomerInfo.customerName}" />" class="form-control"/><br>
				City:		<input type="text" name="UpdateCity" required="" placeholder="<c:out value="${CustomerInfo.customerName}" />" class="form-control"/><br>
				Province:	<input type="text" name="UpdateProv" required="" placeholder="<c:out value="${CustomerInfo.customerName}" />" class="form-control"/><br>
				Cellular:	<input type="text" name="UpdateCell" required="" placeholder="<c:out value="${CustomerInfo.customerName}" />" class="form-control"/><br>
				LandLne:	<input type="text" name="UpdateLand" required="" placeholder="<c:out value="${CustomerInfo.customerName}" />" class="form-control"/><br>
				Email:		<input type="text" name="UpdateEmil" required="" placeholder="<c:out value="${CustomerInfo.customerName}" />" class="form-control"/><br>
				<input type="submit" />
			</form>
		</div>
	</body>
</html>