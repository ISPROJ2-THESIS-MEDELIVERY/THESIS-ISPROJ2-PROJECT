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
<link rel="stylesheet" href="assets/bootstrap/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/styles.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" />
<link rel="stylesheet" href="assets/css/Header-Blue.css" />
<link rel="stylesheet" href="assets/bootstrap/js/jquery.min.js" />
<link rel="stylesheet" href="assets/bootstrap/js/bootstrap.min.js" />		
<link rel="stylesheet" href="assets/bootstrap/js/jquery.dataTables.min.js" />
<link rel="stylesheet" href="assets/bootstrap/js/dataTables.bootstrap.min.js" />
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
	<h1>CART:</h1>
	<c:if test="${CartList != null}">
		<div class="table-responsive">
    		<table id="druglistTable" class="table">
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
					<c:forEach items="${CartList}" var="details">
		            	<tr>
		                	<td><c:out value="${details.name}" /></td>
		                	<td><c:out value="${details.description}" /></td>
		                	<td><c:out value="${details.size}" /></td>
		                	<td><c:out value="${details.prescription}" /></td>
		                	<td><c:out value="${details.quantity}" /></td>
		                	<td><c:out value="${details.unitCost}" /></td>
		                	<td><c:out value="${details.totalCost}" /></td>
		            	</tr>
	            	</c:forEach>
	            </tbody>
    		</table>
		</div>
		<%-- <table border=1>
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
				<c:forEach items="${CartList}" var="details">
		            <tr>
		                <td><c:out value="${details.name}" /></td>
		                <td><c:out value="${details.description}" /></td>
		                <td><c:out value="${details.size}" /></td>
		                <td><c:out value="${details.prescription}" /></td>
		                <td><c:out value="${details.quantity}" /></td>
		                <td><c:out value="${details.unitCost}" /></td>
		                <td><c:out value="${details.totalCost}" /></td>
		            </tr>
	            </c:forEach>
			</tbody>
		</table> --%>
	</c:if>
	<c:if test="${CartList == null}">
		<h2>NOTHING ORDERED YET</h2>
	</c:if>
	
	<h1>SHOP:</h1>
	<div class="table-responsive">
	<table class="table">
		<thead>
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Generic Name</th>
				<th>Product Strength</th>
				<th>Product Form</th>
				<th>Product Packaging</th>
				<th>Product Description</th>
				<th>Quantity</th>
				<th>Buy</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productList}" var="item">
				<form action='ShopController' method='post'>
					<tr>
						<td><input type="number" name="ProductID" value="<c:out value="${item.productID}" />" readonly></td>
						<td><c:out value="${item.productName}" /></td>
						<td><c:out value="${item.genericName}" /></td>
						<td><c:out value="${item.productStrength}" /></td>
						<td><c:out value="${item.productForm}" /></td>
						<td><c:out value="${item.productPackaging}" /></td>
						<td><c:out value="${item.productDescription}" /></td>
						
						<c:if test="${item.isRXProduct == false}">
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
						</c:if>
						
						<c:if test="${item.isRXProduct == true}">
						<td>UNAVAILABLE</td>
						<td>PRESCRIPTION ONLY</td>
						</c:if>
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

	<script>
		 $(document).ready(function() {
			$("#drugListTable").DataTable({
				"lengthMenu": [ [5,10,15,20,-1],[5,10,15,20,"All"] ],
				"ordering": false,
				stateSave: true
			});
		}); 
	</script>

</html>