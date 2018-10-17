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
	<h1>CART:</h1>
	<div class="table-responsive">
	<table class="table">
		<thead>
			<tr>
	            <th>Item</th>
	            <th>Item Description</th>
	            <th>Image</th>
	            <th>Size</th>
	            <th>Prescription Required</th>
	            <th>Quantity</th>
	            <th>Unit Price</th>
	            <th>Total Cost</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${CartlistReciept}" var="cartdetails">
	            <tr>
	                <td><c:out value="${cartdetails.name}" /></td>
	                <td><c:out value="${cartdetails.description}" /></td>
	                <td>IMAGE HERE</td>
	                <!-- <td><img src="data:image/jpeg;base64,${cartdetails.image}" /></td>  -->
	                <td><c:out value="${cartdetails.size}" /></td>
	                <td><c:out value="${cartdetails.prescription}" /></td>
	                <td><c:out value="${cartdetails.quantity}" /></td>
	                <td><c:out value="${cartdetails.unitCost}" /></td>
	                <td><c:out value="${cartdetails.totalCost}" /></td>
	            </tr>
            </c:forEach>
		</tbody>
	</table>
	</div>
	<h1>SHOP:</h1>
	<div class="table-responsive">
	<table class="table">
		<thead>
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Generic Name</th>
				<th>Registration No</th>
				<th>Product Strength</th>
				<th>Product Form</th>
				<th>Product Packaging</th>
				<th>Product Manufacturer</th>
				<th>Product Origin</th>
				<th>Product Description</th>
				<th>Quantity</th>
				<th>Buy</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productList}" var="item">
				<form action='PurchaseController' method='post'>
					<tr>
						<td><input type="number" name="ProductID" value="<c:out value="${item.productID}" />" readonly></td>
						<td><c:out value="${item.productName}" /></td>
						<td><c:out value="${item.genericName}" /></td>
						<td><c:out value="${item.registrationNo}" /></td>
						<td><c:out value="${item.productStrength}" /></td>
						<td><c:out value="${item.productForm}" /></td>
						<td><c:out value="${item.productPackaging}" /></td>
						<td><c:out value="${item.productManufacturer}" /></td>
						<td><c:out value="${item.productOrigin}" /></td>
						<td><c:out value="${item.productDescription}" /></td>
						<td>
							<select name='Quantity'>
								<option value="1">1</option>
								<option value="2">2</option>
								<option value="3">3</option>
								<option value="4">4</option>
								<option value="5">5</option>
								<option value="6">6</option>
								<option value="7">7</option>
								<option value="8">8</option>
								<option value="9">9</option>
							</select>
						</td>
						<td>
							<input type='submit' name='Action' value="Addtocart" style='display: on-hover' />
						</td>
					</tr>
				</form>
			</c:forEach>
		</tbody>
	</table>
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