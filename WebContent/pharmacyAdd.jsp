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
                        <c:if test="${userAccess == 1}">
                        <span class="navbar-text" style="float: right"><a href="LoginController" class="login">Log Out</a></span>
                        </c:if>
                        <c:if test="${userAccess == 2}">
                        <span class="navbar-text" style="float: right"><a href="DispatcherController?Action=DispatchOrder" class="login">Order Dispatch - Regular</a><br></span>
						<span class="navbar-text" style="float: right"><a href="LoginController" class="login">Logout</a></span>
                        </c:if>
                        <c:if test="${userAccess == 3}">
                        <span class="navbar-text" style="float: right"><a href="ProductController?Action=AddProduct" class="login">Add New Product</a><br></span>
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
    <div id="container">
	<center><img alt="" src="assets/img/medlogopill.png"></center>    
	</div> 
	<br>
    <div class="list-group">
    	<a class="list-group-item list-group-item-info">
      		<h4 class="list-group-item-heading"><center>Add Product</center></h4>     						
    	</a>
    </div><br>
	<form action="/ProductController">
	<div class="container">
	 <div class="row">
	  <div class="col-md-6">
		<div class="form-group">
        	<input type="hidden"/>
        </div>
        <h2 class="sr-only">Product to add: </h2>
        <div class="form-group">
        	<input type="text" name="" placeholder="Product Name" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="" placeholder="Generic Name" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="" placeholder="Registration Number" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="" placeholder="Product Strength" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="" placeholder="Product Form" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="" placeholder="Product Packaging" class="form-control"/>
        </div>
      </div>
      <div class="col-md-6">
        <div class="form-group">
        	<input type="text" name="" placeholder="Product Manufacturing" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="" placeholder="Product Origin" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="" placeholder="Product Description" class="form-control"/>
        </div>
        <div class="form-group">
        	Product is an Rx Product?<input type="checkbox" name="" class="form-control"/>
        </div>
        <div class="form-group">
        	Is it featured?<input type="checkbox" name="" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="number" name="Price" placeholder="Price" class="form-control"/>
        </div>
        <div class="form-group">
            <button class="btn btn-primary btn-block" type="submit" name="action" value="addnewProduct">Add New Product</button>
        </div>
        </div>
      </div>
      </div>
      </div>
		<!-- <input type="hidden" />
		<h2>Product to add: </h2><br><br>
		Product Name:<br>
		<input type="text" name=""/><br><br>
		Generic Name:<br>
		<input type="text" name=""/><br><br>
		Registration Number:<br>
		<input type="text" name=""/><br><br>
		Product Strength:<br>
		<input type="text" name=""/><br><br>
		Product Form:<br>
		<input type="text" name=""/><br><br>
		Product Packaging:<br>
		<input type="text" name=""/><br><br>
		Product Manufacturing:<br>
		<input type="text" name=""/><br><br>
		Product Origin:<br>
		<input type="text" name=""/><br><br>
		Product Description:<br>
		<input type="text" name=""/><br><br>
		Product is an Rx Product?:<br>
		<input type="checkbox" name=""/><br><br>
		Is it Featured?: <br>
		<input type="checkbox" name="feature"/><br><br>
		Price: <br>
		<input type="number" name="Price"/><br>
		<input type="submit" name="action" value="addnewProduct"/>  -->
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
<style>

.list-group-item:last-child {
    margin-bottom: 0;
    border-bottom-right-radius: .25rem;
    border-bottom-left-radius: .25rem;
    width: 98%;
}

</style>
</html>