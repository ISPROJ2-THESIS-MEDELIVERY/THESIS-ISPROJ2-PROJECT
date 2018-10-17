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
                        <c:if test="${userAccess == 1}">
                        <span class="navbar-text"><a href="LoginController" class="login">Log Out</a></span>
                        </c:if>
                        <c:if test="${userAccess == 2}">
                        <span class="navbar-text"><a href="DispatcherController?Action=DispatchOrder">Add Product</a></span>
						<span class="navbar-text"><a href="LoginController">Logout</a></span>
                        </c:if>
                        <c:if test="${userAccess == 3}">
                        <span class="navbar-text"><a href="ProductController?Action=AddProduct">Add Product</a></span>
                        <span class="navbar-text"><a href="PharmacistController?Action=Prescription">Approve/Disapprove prescription orders</a></span>
						<span class="navbar-text"><a href="LoginController">Logout</a><br></span>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div> 
    <a class="already" href="login.jsp">Insert Product</a>
    
  <div class="table-responsive">
    <table class="table">
    	<thead>
    	   <tr>
    	       <th>Registration Number</th>
    	       <th>Product Name</th>
    	       <th>Generic Name</th>
     	       <th>Product Strength</th>
     	       <th>Product Form</th>
     	       <th>Product Packaging</th>
     	       <th>Product Manufacturer</th>
     	       <th>Product Origin</th>
     	   </tr>
    	</thead>
    	<tbody>
    	    <c:forEach items="${ProductList}" var="product">
			        <tr>
					<td><c:out value="${product.registrationNo}"/></td>
					<td><c:out value="${product.productName}"/></td>
					<td><c:out value="${product.genericName}"/></td>
					<td><c:out value="${product.productStrength}"/></td>
					<td><c:out value="${product.productForm}"/></td>
					<td><c:out value="${product.productPackaging}"/></td>
					<td><c:out value="${product.productManufacturer}"/></td>
					<td><c:out value="${product.productOrigin}"/></td>
		        </tr>
			</c:forEach>
    	</tbody>
	</table>
	<!-- <a href="login.jsp" class="already" style="color:#282d32;font-size:20px;">Insert Product</a>
	<table border=1>
		<thead>
			<tr>
		    	<th>Registration Number</th>
		        <th>Product Name</th>
		        <th>Generic Name</th>
		        <th>Product Strength</th>
		        <th>Product Form</th>
		        <th>Product Packaging</th>
		        <th>Product Manufacturer</th>
		        <th>Product Origin</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${ProductList}" var="product">
		        <tr>
					<td><c:out value="${product.registrationNo}"/></td>
					<td><c:out value="${product.productName}"/></td>
					<td><c:out value="${product.genericName}"/></td>
					<td><c:out value="${product.productStrength}"/></td>
					<td><c:out value="${product.productForm}"/></td>
					<td><c:out value="${product.productPackaging}"/></td>
					<td><c:out value="${product.productManufacturer}"/></td>
					<td><c:out value="${product.productOrigin}"/></td>
		        </tr>
			</c:forEach>
		</tbody>
	</table> -->
  </div>
  <div class="login-clean">
	<form action="InformationController" method="post">
	 Registration Number:<br>
	 <div class="form-group">
        <input type="text" name="RegistrationNo" class="form-control"/>
     </div>
     Quantity:<br>
     <div class="form-group">
        <input type="number" name="Quantity" class="form-control"/>
     </div>
     <div class="form-group">
        <input type="hidden" name="Action" class="form-control"/>
     </div>
     <div class="form-group">
            <button class="btn btn-primary btn-block" type="submit">Submit</button>
     </div>
	
	<!-- Registration Number:<br>
		<input type="text" name="RegistrationNo"/><br>
		Quantity:<br>
		<input type="number" name="Quantity"/><br>
		<input type="hidden" name="Action" />
		<input type="submit" value="Submit" />-->
		
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