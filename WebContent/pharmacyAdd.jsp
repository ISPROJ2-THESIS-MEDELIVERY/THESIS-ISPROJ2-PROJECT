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
                        <span class="navbar-text"><a href="login.jsp" class="login">Log In</a></span>
                        <span class="navbar-text"><a href="register.jsp" class="login">Register</a></span>
                        </c:if>
                        <c:if test="${userAccess == 1}">
                        <span class="navbar-text"><a href="LoginController" class="login">Log Out</a></span>
                        </c:if>
                        <c:if test="${userAccess == 2}">
                        <span class="navbar-text"><a href="DispatcherController?Action=DispatchOrder">Order Dispatch - Regular</a><br></span>
						<span class="navbar-text"><a href="LoginController">Logout</a></span>
                        </c:if>
                        <c:if test="${userAccess == 3}">
                        <span class="navbar-text"><a href="ProductController?Action=AddProduct">Add Product</a><br></span>
                        <span class="navbar-text"><a href="PharmacistController?Action=Prescription">Approve/Disapprove prescription orders</a></span>
						<span class="navbar-text"><a href="LoginController">Logout</a><br></span>
                        </c:if>
                        <c:if test="${userAccess == 4}">
                        <span class="navbar-text"><a href="LoginController" class="login">Log Out</a></span>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <div class="login-clean">
	<form action="/ProductController">
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
<footer class="footer text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-5 mb-lg-0">
                <h4 class="text-uppercase mb-4">Location</h4>
                <p></p>
            </div>
            <div class="col-md-4 mb-5 mb-lg-0">
                <h4 class="text-uppercase">Around the Web</h4>
                <ul class="list-inline">
                    <li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="#"><i class="fa fa-facebook fa-fw"></i></a></li>
                    <li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="#"><i class="fa fa-google-plus fa-fw"></i></a></li>
                    <li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="#"><i class="fa fa-twitter fa-fw"></i></a></li>
                    <li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="#"><i class="fa fa-dribbble fa-fw"></i></a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h4 class="text-uppercase mb-4">About medelivery</h4>
                <p class="lead mb-0"><span></span></p>
            </div>
        </div>
    </div>
</footer>
</body>
</html>