<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" />
<link rel="stylesheet" href="assets/css/Header-Blue.css" />
<link rel="stylesheet" href="assets/css/Footer-Dark.css" />
</head>
<body>
	 <div>
        <div class="header-blue">
            <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                <div class="container"><a href="index.jsp" class="navbar-brand">Medelivery</a>
                    <div class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav"></ul>
                        <form target="_self" class="form-inline mr-auto">
                            <div class="form-group"><label for="search-field"></label></div>
                        </form>
                        <c:if test="${userAccess == null}">
                        <span class="navbar-text" style="float: right"><a href="login.jsp" class="login">Log In</a></span>
                        <span class="navbar-text" style="float: right"><a href="register.jsp" class="login">Register</a></span>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
     
    <div class="login-clean">
	<form action="RegistrationController" method="post" enctype="multipart/form-data">
		<div class="form-group">
        	<input type="text" name="Username" required="" placeholder="User Name *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="password" name="Password" required="" placeholder="Create Password" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="FistName" required="" placeholder="First Name *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="LastName" required="" placeholder="Last Name *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="number" name="PhoneNum" required="" placeholder="Phone Number *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="UAddress" required="" placeholder="Dispatch Address *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="date" name="BrthDate" required="" placeholder="Birthday *" class="form-control"/>
        </div>
        <div class="form-group">
        	<select name="BrthDate" class="form-control">
        		<c:forEach items="${CourierService}" var="courier">
					<option value=<c:out value="${courier.courierServiceID}"/>>
						<c:out value="${courier.companyName}" />
					</option>
				</c:forEach>
			</select>
        </div>
        <div class="form-group">
        	<input type="hidden" name="SecretCode" value="5WLjE4Hik2TC85l" class="form-control"/>
        </div>
        <div class="form-group">
            <button class="btn btn-primary btn-block" type="submit">Sign Up</button>
        </div>
        <a class="already" href="login.jsp">Back</a> 
		<%-- <h6></h6>
		<input type="text" 		name="Username" 	required="" 	placeholder="User Name *"><br>
		<input type="password" 	name="Password" 	required="" 	placeholder="Create Password"><br>
		<hr>
		<input type="text" 		name="FistName" 	required="" 	placeholder="First Name *"><br>
		<input type="text" 		name="LastName" 	required="" 	placeholder="Last Name *"><br>
		<input type="number" 	name="PhoneNum" 	required="" 	placeholder="Phone Number *"><br>
		<input type="text" 		name="UAddress" 	required="" 	placeholder="Dispatch Adress *"><br>
		<input type="date" 		name="BrthDate" 	required="" 	placeholder="Birthday *"><br>
		<select name="CourSele">
			<c:forEach items="${CourierService}" var="courier">
				<option value=<c:out value="${courier.courierServiceID}"/>>
					<c:out value="${courier.companyName}" />
				</option>
			</c:forEach>
		</select>
		<hr>
		<input type="hidden"	name="SecretCode" 	value="5WLjE4Hik2TC85l">
		<button type="submit" 	style="background-color:#56c5ff;">Sign Up</button>
		<a href="/login.jsp" class="already" style="color:#282d32;font-size:20px;">back</a> --%>
	</form>
	</div>
	
<div class="footer-dark">
    <footer>
        <div class="container">
            <div class="row">
                <div class="col-sm-6 col-md-3 item">
                    <h3>Services</h3>
                    <ul>
                        <li><a href="#">Delivery</a></li>
                        <li><a href="#">Prescription Orders</a></li>
                        <li><a href="#">Partnership</a></li>
                    </ul>
                </div>
                <div class="col-sm-6 col-md-3 item">
                    <h3>About</h3>
                    <ul>
                        <li><a href="#">Company</a></li>
                        <li><a href="#">Team</a></li>
                        <li><a href="#">Careers</a></li>
                    </ul>
                </div>
                <div class="col-md-6 item text">
                    <h3>Medelivery</h3>
                    <p><br />Our mission is to create a measurable, sustainable and profitable link between pharmacies, couriers and customers.  Providing the best system in storing databases of available pharmacies and delivery couriers, as well as management
                        of theses deliveries. Our operation is also to bring convenience to customers by filtering their needs according to the type of payment they want and the type of delivery schedule that fits their respective timeframes.<br /><br
                        /><br /></p>
                </div>
            </div>
            <p class="copyright">Company Name © 2017</p>
        </div>
    </footer>
</div>
</body>
</html>