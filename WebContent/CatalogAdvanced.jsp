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
<!-- <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" /> -->
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
                        <span class="navbar-text" style="float: right"><a href="ProductController?Action=AddProduct" class="login">Add Product</a><br></span>
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
    <div id="container">
	<h1>CART:</h1>
	<c:if test="${CartList != null}">
					<div class="list-group">
						<a class="list-group-item">
							<h4 class="list-group-item list-group-item-info">Orders have a minimum of 300 pesos, please ensure that your total order reaches that.</h4>
						</a>
					</div>
    		<table id="cartlistTable" class="table table-striped table-bordered" width="100%">
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
		                	<td><div class="pop">
    						<img id="imageresource" src="images/<c:out value="${details.image}" />" alt="Medicine Image" width="100px" height="100px">
   						 	Click to Enlarge
							</div></td>
		                	<td><c:out value="${details.size}" /></td>
		                	<td><c:out value="${details.prescription}" /></td>
		                	<td><c:out value="${details.quantity}" /></td>
		                	<td>&#8369;<c:out value="${details.unitCost}" /></td>
		                	<td>&#8369;<c:out value="${details.totalCost}" /></td>
		            	</tr>
	            	</c:forEach>
	            </tbody>
    		</table>
			
			<div class="container">
		    <h1>Prescription</h1>
			<form method="post" action="ShopController" encType="multipart/form-data">
				<div class="form-group">
		        	<input type="file" name="file" value="Upload Prescription" class="form-control" required />
		        	<input type="hidden" name="PharmaID" value="<c:out value="${SelectedPharmacy.pharmacyID}"/>" class="form-control"/>
		        	<br>
		        	<center><button class="btn btn-success btn-md" type="submit" name="Action" value="CheckoutOrderPrescription">Checkout Order</button></center>
					<%-- <center><input type='submit' name='Action' value="CheckoutOrderPrescription" style='display: on-hover' /></center> --%>
		        </div>
			</form>
			</div>
	</c:if>
	<c:if test="${CartList == null}">
		<h2>NOTHING ORDERED YET</h2>
	</c:if>
	
	<h1>SHOP:</h1>
	<table id="druglistTable" class="table table-striped table-bordered" width="100%">
		<thead>
			<tr>
				<th>Product ID</th>
				<th>Product Name</th>
				<th>Generic Name</th>
				<th>Product Strength</th>
				<th>Image</th>
				<th>Product Form</th>
				<th>Product Packaging</th>
				<th>Product Description</th>
                <th>Unit Price</th>
				<th>Quantity</th>
				<th>Buy</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${productList}" var="item">
					<tr>
						<td><c:out value="${item.productID}" /></td>
						<td><c:out value="${item.productName}" /></td>
						<td><c:out value="${item.genericName}" /></td>
						<td><c:out value="${item.productStrength}" /></td>
						<td><div class="pop">
    						<img id="imageresource" src="images/<c:out value="${item.productImage}" />" alt="Medicine Image" width="100px" height="100px">
   						 	Click to Enlarge
						</div></td>
						<td><c:out value="${item.productForm}" /></td>
						<td><c:out value="${item.productPackaging}" /></td>
						<td><c:out value="${item.productDescription}" /></td>
						<td>&#8369;<c:out value="${item.priceSet}" /></td>
						<form action='ShopController' method='post'>
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
							<input type="hidden" name="ProductID" value="<c:out value="${item.productID}" />" readonly>
							<div class="text-center"><button class="btn btn-success btn-md" type="submit" name="Action" value="Addtocart">Add to Cart</button></div>
							<!-- <input type='submit' name='Action' value="Addtocart" style='display: on-hover' /> -->
						</td>
						</form>
					</tr>
			</c:forEach>
		</tbody>
	</table>
	</div>
	
<div class="modal fade" id="imagemodal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">              
      <div class="modal-body">
      	<button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <img src="" class="imagepreview" style="width: 100%;" >
      </div>
    </div>
  </div>
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

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="assets/bootstrap/js/jquery.dataTables.min.js"></script>
<script src="assets/bootstrap/js/dataTables.bootstrap.min.js"></script>


<script>

$(function() {
	$('.pop').on('click', function() {
		$('.imagepreview').attr('src', $(this).find('img').attr('src'));
		$('#imagemodal').modal('show');   
	});		
});

</script>

	<script type="text/javascript">
		 $(document).ready(function() {
			$("#druglistTable").DataTable({
				"sPaginationType": "full_numbers",
                "bJQueryUI": true, "sScrollX": "100%",
                "bScrollCollapse": true
			});
		}); 
	</script>
	
	<script type="text/javascript">
		 $(document).ready(function() {
			$("#cartlistTable").DataTable({
				"sPaginationType": "full_numbers",
                "bJQueryUI": true, "sScrollX": "100%",
                "bScrollCollapse": true
			});
		}); 
	</script>


</html>