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
                        <c:if test="${userAccess == 4}">
                        <span class="navbar-text" style="float: right"><a href="LoginController" class="login">Log Out</a></span>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    
    <div class="login-clean"> 
	<form action="RegistrationController" method="post" enctype="multipart/form-data">
	<h2>Register a New Admin</h2>
	    <div class="form-group">
        	<input type="text" name="FistName" required="" placeholder="First Name *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="LastName" required="" placeholder="Last Name *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="Username" required="" placeholder="User Name *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="password" name="Password" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" 
			title="Must contain at least one number and one uppercase and lowercase letter, and at least 8 or more characters" 
			required="" placeholder="Create Password" id="Password" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="password" name="Password-repeat" required="" placeholder="Re-enter Password" id="Passwordrepeat" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="hidden" name="SecretCode" value="i3Up8XmH04Jz151" class="form-control"/>
        </div>
        <div class="form-group">
            <button class="btn btn-primary btn-block" type="submit">Sign Up</button>
        </div>
        <a class="already" href="index.jsp">Back</a> 
        
       <div id="message">
  			<h3>Password must contain the following:</h3>
  			<p id="letter" class="invalid">A <b>lowercase</b> letter</p>
  			<p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
  			<p id="number" class="invalid">A <b>number</b></p>
  			<p id="length" class="invalid">Minimum <b>8 characters</b></p>
		</div>
        
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

<script>
var Password = document.getElementById("Password")
  , Passwordrepeat = document.getElementById("Passwordrepeat");

function validatePassword(){
  if(Password.value != Passwordrepeat.value) {
    Passwordrepeat.setCustomValidity("Passwords Don't Match");
  } else {
    Passwordrepeat.setCustomValidity('');
  }
}

Password.onchange = validatePassword;
Passwordrepeat.onkeyup = validatePassword;

</script>

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




var Password = document.getElementById("Password")
  , Passwordrepeat = document.getElementById("Passwordrepeat");

function validatePassword(){
  if(Password.value != Passwordrepeat.value) {
    Passwordrepeat.setCustomValidity("Passwords Don't Match");
  } else {
    Passwordrepeat.setCustomValidity('');
  }
}

Password.onchange = validatePassword;
Passwordrepeat.onkeyup = validatePassword;

</script>

<style>

/* The message box is shown when the user clicks on the password field */
#message {
    display:none;
    background: #f1f1f1;
    color: #000;
    position: relative;
    padding: 20px;
    margin-top: 10px;
}

#message p {
    padding: 10px 35px;
    font-size: 18px;
}

/* Add a green text color and a checkmark when the requirements are right */
.valid {
    color: green;
}

.valid:before {
    position: relative;
    left: -35px;
    content: "✔";
}

/* Add a red text color and an "x" when the requirements are wrong */
.invalid {
    color: red;
}

.invalid:before {
    position: relative;
    left: -35px;
    content: "✖";
}
</style>

</html>