<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/Login-Form-Clean.css" />
<link rel="stylesheet" href="assets/css/styles.css" />
</head>
<body>
<div class="login-clean">
<form action="RegistrationController" method="post" enctype="multipart/form-data">
	<h2 class="sr-only">Login Form</h2>
        <div class="form-group">
        	<input type="text" name="Fullname" required="" placeholder="FullName *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="Username" required="" placeholder="Username *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="CAddress" required="" placeholder="Address *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="email" name="CusEmail" required="" placeholder="Email *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="number" name="ContactNumber" required="" placeholder="Contact Number *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="password" name="Password" required="" placeholder="Create Password" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="password" name="Password-repeat" required="" placeholder="Re-enter Password" class="form-control"/>
        </div>
        <div class="form-group">
            <button class="btn btn-primary btn-block" type="submit">Sign Up</button>
        </div>
        <a class="already" href="login.jsp">Back</a>
<!--<input type="text" 		name="FullName" 		required="" placeholder="FullName *">
	<input type="text" 		name="Username" 		required="" placeholder="Username *">
	<input type="text" 		name="CAddress" 		required="" placeholder="Address *">
	<input type="email" 	name="CusEmail" 		required="" placeholder="Email *">
	<input type="number" 	name="ContactNumber" 	required="" placeholder="Contact Number *">
	<input type="password" 	name="Password" 		required="" placeholder="Create Password">
	<input type="password" 	name="Password-repeat" 	required="" placeholder="Re-enter Password" style="margin:0px;">
	<button type="submit" style="background-color:#56c5ff;">Sign Up</button>
	<a href="login.jsp" class="already" style="color:#282d32;font-size:20px;">back</a> -->
</form>
</div>
</body>
</html>