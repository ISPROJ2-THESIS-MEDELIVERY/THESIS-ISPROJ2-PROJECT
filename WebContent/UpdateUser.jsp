<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib uri = "http://java.sun.com/jsp/jstl/fmt" prefix = "fmt" %>
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
                        <c:if test="${userAccess == 1}">
                        <span class="navbar-text" style="float: right"><a href="CustomerController?action=UpdateCustomer" class="login">Update Your Profile</a></span>
                        <span class="navbar-text" style="float: right"><a href="CustomerSeniorCitizen.jsp" class="login">Senior Citizen/PWD? Click here</a></span>	                       
                        <span class="navbar-text" style="float: right"><a href="LoginController" class="login">Log Out</a></span>                                      				
                        </c:if>
                        <c:if test="${userAccess == 2}">
                        <span class="navbar-text" style="float: right"><a href="DispatcherController?Action=DispatchOrder" class="login">Order Dispatch - Regular</a><br></span>
						<span class="navbar-text" style="float: right"><a href="LoginController" class="login">Logout</a></span>
                        </c:if>
                        <c:if test="${userAccess == 3}">
                        <span class="navbar-text" style="float: right"><a href="ProductController?Action=AddnewProduct" class="login">Add New Product</a><br></span>
                        <span class="navbar-text" style="float: right"><a href="PharmacistController?Action=Prescription" class="login">Approve/Disapprove prescription orders</a></span>
						<span class="navbar-text" style="float: right"><a href="LoginController" class="login">Logout</a><br></span>
                        </c:if>
                        <c:if test="${userAccess == 4}">
                        <span class="navbar-text" style="float: right"><a href="LoginController" class="login">Log Out</a></span>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>

    
    <div class="login-clean">
	<form onSubmit="return formValidation();" action="InformationController" method="post" enctype="multipart/form-data">
		<input type="hidden" name="Actionthing" value="update" class="form-control"/>
        <h3>UPDATE YOUR INFORMATION HERE</h3>
        <br>
        <h3>LOGIN CREDENTIALS</h3>
        <div class="input-group">
        	<span class="input-group-text">New Username:</span>
        	<input type="text" name="Username" pattern="[a-zA-Z0-9_-]{6,12}" autofocus  title="must be alphanumeric in 6-12 chars" placeholder="<c:out value="${LoginInfo.username}"/>" class="form-control"/>
        </div>
        <br>
		<div class="input-group">
			<span class="input-group-text">New Password:</span>
        	<input type="password" name="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
			title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 
			 placeholder="<c:out value="${LoginInfo.password}"/>" id="Password" class="form-control"/>
        </div>
		<br>
        <c:if test="${userAccess == 1}">
        	<h3>PROFILE INFORMATION</h3>
        	<h5>Customer ID: <c:out value="${CustomerInfo.customerID}"/></h5>
	        <div class="input-group"><span class="input-group-text">New Name:</span><input type="text" name="FullName" placeholder="<c:out value="${CustomerInfo.customerName}"/>" class="form-control"/></div><br>
	        <div class="input-group"><span class="input-group-text">New Street:</span><input type="text" name="CuStreet" placeholder="<c:out value="${CustomerInfo.customerStreet}"/>" class="form-control"/></div><br>
	        <div class="input-group"><span class="input-group-text">New Barangay:</span><input type="text" name="CuBarngy" placeholder="<c:out value="${CustomerInfo.customerBarangay}"/>" class="form-control"/></div><br>
	        <div class="input-group"><span class="input-group-text">New City:</span>
	        	<select name="CCityID" class="form-control">
				<c:forEach items="${CityList}" var="city">
					<c:if test="${CustomerInfo.cityID == city.cityID}">
						<option value =<c:out value="${city.cityID}"/> selected><c:out value="${city.cityName}" /></option>
					</c:if>
					<c:if test="${CustomerInfo.cityID != city.cityID}">
						<option value =<c:out value="${city.cityID}"/>><c:out value="${city.cityName}" /></option>
					</c:if>
					/c:if>
				</c:forEach>
			  </select>
	        </div><br>
	        <div class="input-group"><span class="input-group-text">New Landline:</span><input id="phonenum" type="tel" pattern="^\d{7}$" title="must contain 7 digits" name="CuLandLi" placeholder="<c:out value="${CustomerInfo.customerLandline}"/>" class="form-control"/></div><br>
	        <div class="input-group"><span class="input-group-text">New Cellphone Number:</span><input id="phonenum" type="tel" pattern="^(09|\+639)\d{9}$" title="must start with 09 or +63 and contain 11 digits" name="CuCellul" placeholder="<c:out value="${CustomerInfo.customerCellular}"/>" class="form-control"/></div><br>
	        <div class="input-group"><span class="input-group-text">New Email:</span><input type="email" name="CusEmail" placeholder="<c:out value="${CustomerInfo.email}"/>" class="form-control"/></div><br>
	        <div class="form-group"><button class="btn btn-primary btn-block" type="submit">Update</button></div>
        </c:if>
        <c:if test="${userAccess == 2}">
        </c:if>
        <c:if test="${userAccess == 3}">
        </c:if>
        <c:if test="${userAccess == 4}">
        </c:if>
    <a class="already" href="index.jsp">Back</a> 
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
                    <p><br />Our mission is to create a measurable, sustainable and profitable link between pharmacies, couriers and customers. �Providing the best system in storing databases of available pharmacies and delivery couriers, as well as management
                        of theses deliveries. Our operation is also to bring convenience to customers by filtering their needs according to the type of payment they want and the type of delivery schedule that fits their respective timeframes.<br /><br
                        /><br /></p>
                </div>
            </div>
            <p class="copyright">Company Name � 2017</p>
        </div>
    </footer>
</div>
</body>
<style>

.list-group-item:last-child {
    margin-bottom: 0;
    border-bottom-right-radius: .25rem;
    border-bottom-left-radius: .25rem;
    width: 98%;
}

</style>

<script src="sample-registration-form-validation.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>


<script>

var myInput = document.getElementById("Password");
var letter = document.getElementById("letter");
var capital = document.getElementById("capital");
var number = document.getElementById("number");
var length = document.getElementById("length");

// When the user clicks on the password field, show the message box
myInput.onfocus = function() {
    document.getElementById("message").style.display = "block";
}

// When the user clicks outside of the password field, hide the message box
myInput.onblur = function() {
    document.getElementById("message").style.display = "none";
}

// When the user starts to type something inside the password field
myInput.onkeyup = function() {
  // Validate lowercase letters
  var lowerCaseLetters = /[a-z]/g;
  if(myInput.value.match(lowerCaseLetters)) {  
    letter.classList.remove("invalid");
    letter.classList.add("valid");
  } else {
    letter.classList.remove("valid");
    letter.classList.add("invalid");
  }
  
  // Validate capital letters
  var upperCaseLetters = /[A-Z]/g;
  if(myInput.value.match(upperCaseLetters)) {  
    capital.classList.remove("invalid");
    capital.classList.add("valid");
  } else {
    capital.classList.remove("valid");
    capital.classList.add("invalid");
  }

  // Validate numbers
  var numbers = /[0-9]/g;
  if(myInput.value.match(numbers)) {  
    number.classList.remove("invalid");
    number.classList.add("valid");
  } else {
    number.classList.remove("valid");
    number.classList.add("invalid");
  }
  
  // Validate length
  if(myInput.value.length >= 😎 {
    length.classList.remove("invalid");
    length.classList.add("valid");
  } else {
    length.classList.remove("valid");
    length.classList.add("invalid");
  }
}

</script>

<script>

$('input[type="checkbox"]').on('change', function() {
	   $('input[type="checkbox"]').not(this).prop('checked', false);
	});

</script>

</html>