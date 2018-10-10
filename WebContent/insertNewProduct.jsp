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
</head>
<body>
	 <div>
        <div class="header-blue">
            <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                <div class="container"><a href="home.jsp" class="navbar-brand">Medelivery</a>
                    <div class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav"></ul>
                        <form target="_self" class="form-inline mr-auto">
                            <div class="form-group"><label for="search-field"></label></div>
                        </form>
                    </div>
                </div>
            </nav>
        </div>
    </div> 
	<a href="login.jsp" class="already" style="color:#282d32;font-size:20px;">Insert Product</a>
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
		<input type="submit" value="Submit" /> -->
		
	</form>
	</div>
</body>
</html>