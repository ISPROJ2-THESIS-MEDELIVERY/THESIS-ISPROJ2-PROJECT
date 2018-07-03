<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html >
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>MedeliveryGUI_v4</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/fonts/font-awesome.min.css">
<link rel="stylesheet" href="assets/fonts/ionicons.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Cookie">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Lora">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:400,300,700,400italic,300italic,700italic">
<link rel="stylesheet" href="assets/css/Article-Clean.css">
<link rel="stylesheet" href="assets/css/Article-List.css">
<link rel="stylesheet" href="assets/css/Brands.css">
<link rel="stylesheet" href="assets/css/Contact-Form-Clean.css">
<link rel="stylesheet"
	href="assets/css/Data-Summary-Panel---3-Column-Overview--Mobile-Responsive.css">
<link rel="stylesheet" href="assets/css/Features-Blue.css">
<link rel="stylesheet" href="assets/css/Features-Boxed.css">
<link rel="stylesheet" href="assets/css/Footer-Basic.css">
<link rel="stylesheet" href="assets/css/Footer-Dark.css">
<link rel="stylesheet" href="assets/css/Good-login-dropdown-menu.css">
<link rel="stylesheet" href="assets/css/Good-login-dropdown-menu1.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
<link rel="stylesheet" href="assets/css/Gallery.css">
<link rel="stylesheet" href="assets/css/Gallery1.css">
<link rel="stylesheet" href="assets/css/Login-Form-Clean.css">
<link rel="stylesheet" href="assets/css/Pretty-Search-Form.css">
<link rel="stylesheet" href="assets/css/Map-Clean.css">
<link rel="stylesheet" href="assets/css/multi-item-carousel.css">
<link rel="stylesheet" href="assets/css/Navbar-Centered.css">
<link rel="stylesheet" href="assets/css/Navigation-with-Search.css">
<link rel="stylesheet" href="assets/css/Pretty-Table.css">
<link rel="stylesheet" href="assets/css/Pretty-Table1.css">
<link rel="stylesheet"
	href="assets/css/Registration-Form-with-Photo.css">
<link rel="stylesheet" href="assets/css/Simple-Slider.css">
<link rel="stylesheet" href="assets/css/style.css">
<link rel="stylesheet" href="assets/css/styles.css">
<link rel="stylesheet" href="assets/css/Team-Boxed.css">
<link rel="stylesheet" href="assets/css/TR-Form.css">
<link rel="stylesheet" type="text/css"
	href="js/data_table/reset-min.css">
<link rel="stylesheet" type="text/css" href="js/data_table/complete.css">
</head>

<body>
	<img src="assets/img/adminlogo.png">
	<nav class="navbar navbar-light navbar-expand-md">
		<div class="container-fluid">
			<a class="navbar-brand" href="#"></a>
			<button class="navbar-toggler" data-toggle="collapse"
				data-target="#navcol-1">
				<span class="sr-only">Toggle navigation</span><span
					class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navcol-1">
				<ul class="nav navbar-nav">
					<li class="nav-item" role="presentation"><a
						class="nav-link active" href="AdminHome.jsp">Home</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link"
						href="ManageCustomerAccount.jsp">Manage Customer Accounts</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link"
						href="ManagePharmacyAccount.jsp">Manage Pharmeceutical
							Parters&nbsp;<br>
					</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link"
						href="ManageDeliveryCourierAccount.jsp">Manage Delivery
							Service Accounts<br>
					</a></li>
					<li class="nav-item" role="presentation"><a class="nav-link"
						href="ManageInventory.jsp">Inventory</a></li>
				</ul>
				<ul class="nav navbar-nav ml-auto">
					<li class="nav-item" role="presentation"><a class="nav-link"
						href="Login.jsp">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="features-boxed"></div>
	<div></div>
	<div class="simple-slider">
		<div class="swiper-container">
			<div class="swiper-wrapper"></div>
			<div class="swiper-pagination"></div>
			<div class="swiper-button-prev"></div>
			<div class="swiper-button-next"></div>
		</div>
	</div>
	<div class="carousel slide" data-ride="carousel" id="carousel-1">
		<div class="carousel-inner" role="listbox"></div>
		<div>
			<a class="carousel-control-prev" href="#carousel-1" role="button"
				data-slide="prev"><span class="sr-only">Previous</span></a><a
				class="carousel-control-next" href="#carousel-1" role="button"
				data-slide="next"><span class="sr-only">Next</span></a>
		</div>
		<ol class="carousel-indicators"></ol>
	</div>
	<div class="container">
		<!-- First Table -->
		<h1>Pharmacy Sales</h1>
		<div>
			<table id="PharmacySales" class="pretty">
				<thead>
					<tr>
						<th>Pharmacy Name</th>
						<th>Product Name</th>
						<th>Registration No.</th>
						<th>Quantity</th>
						<th>Cost Per Unit</th>
						<th>Total Cost</th>

					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productList}" var="item">
						<!--  <form action='PurchaseController' method='post'>-->
						<tr>
							<td><input type="number" name="ProductID"
								value="<c:out value="${item.productID}" />" readonly></td>
							<td><c:out value="${item.PharmacyName}" /></td>
							<td><c:out value="${item.ProductName}" /></td>
							<td><c:out value="${item.RegistrationNo}" /></td>
							<td><c:out value="${item.Quantity}" /></td>
							<td><c:out value="${item.CostPerUnit}" /></td>
							<td><c:out value="${item.TotalCost}" /></td>
							<td><select name='Quantity'>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
							</select></td>
						</tr>
						<!--  </form>-->
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- Second Table -->
		<br>
		<h1>Product Sales</h1>
		<div>
			<table id="ProductSales" class="pretty">
				<thead>
					<tr>
						<th>Product Name</th>
						<th>Registration Number</th>
						<th>Quantity</th>
						<th>Cost Per Unit</th>
						<th>Total Cost</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productList}" var="item">
						<!--  <form action='PurchaseController' method='post'>-->
						<tr>
							<td><input type="number" name="ProductID"
								value="<c:out value="${item.productID}" />" readonly></td>
							<td><c:out value="${item.ProductName}" /></td>
							<td><c:out value="${item.RegistrationNo}" /></td>
							<td><c:out value="${item.Quantity}" /></td>
							<td><c:out value="${item.CostPerUnit}" /></td>
							<td><c:out value="${item.TotalCost}" /></td>
							<td><select name='Quantity'>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
							</select></td>
						</tr>
						<!--  </form>-->
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- Third Table -->
		<br>
		<h1>Purchase per user</h1>
		<div>
			<table id="Purchases" class="pretty">
				<thead>
					<tr>
						<th>Customer ID</th>
						<th>Customer Name</th>
						<th>Date Ordered</th>
						<th>Date Processed</th>
						<th>Date Delivered</th>
						<th>Product Name</th>
						<th>Registration Number</th>
						<th>Quantity</th>
						<th>Cost Per Unit</th>
						<th>Total Cost</th>
						<th>Actual Cost</th>
						<th>Quantity</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productList}" var="item">
						<!--  <form action='PurchaseController' method='post'>-->
						<tr>
							<td><input type="number" name="ProductID"
								value="<c:out value="${item.productID}" />" readonly></td>
							<td><c:out value="${item.CustomerID}" /></td>
							<td><c:out value="${item.CustomerName}" /></td>
							<td><c:out value="${item.DateOrdered}" /></td>
							<td><c:out value="${item.DateProcessed}" /></td>
							<td><c:out value="${item.DateDelivered}" /></td>
							<td><c:out value="${item.ProductName}" /></td>
							<td><c:out value="${item.RegistrationNumber}" /></td>
							<td><c:out value="${item.Quantity}" /></td>
							<td><c:out value="${item.CostPerUnit}" /></td>
							<td><c:out value="${item.TotalCost}" /></td>
							<td><c:out value="${item.ActualCost}" /></td>
							<td><select name='Quantity'>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
							</select></td>
						</tr>
						<!--  </form>-->
					</c:forEach>
				</tbody>
			</table>
		</div>
		<!-- Fourth Table -->
		<br>
		<h1>Total Sales</h1>
		<div>
			<table id="TotalSales" class="pretty">
				<thead>
					<tr>
						<th>Product Name</th>
						<th>Registration Number</th>
						<th>Quantity</th>
						<th>Cost Per Unit</th>
						<th>Total Cost</th>
						<th>Actual Cost</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${productList}" var="item">
						<!--  <form action='PurchaseController' method='post'>-->
						<tr>
							<td><input type="number" name="ProductID"
								value="<c:out value="${item.productID}" />" readonly></td>
							<td><c:out value="${item.ProductName}" /></td>
							<td><c:out value="${item.RegistrationNo}" /></td>
							<td><c:out value="${item.Quantity}" /></td>
							<td><c:out value="${item.CostPerUnit}" /></td>
							<td><c:out value="${item.TotalCost}" /></td>
							<td><c:out value="${item.ActualCost}" /></td>
							<td><select name='Quantity'>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
							</select></td>
						</tr>
						<!--  </form>-->
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>



	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/bootstrap/js/bootstrap.min.js"></script>
	<script src="assets/js/Gallery.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
	<script src="assets/js/index.js"></script>
	<script src="assets/js/multi-item-carousel.js"></script>
	<script src="assets/js/Simple-Slider1.js"></script>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
	<script type="text/javascript"
		src="js/data_table/jquery.dataTables.min.js"></script>
	<script type="text/javascript"
		src="js/data_table/jquery.dataTables.plugins.js"></script>
	<!-- First Table -->
	<script type="text/javascript">
        $(document).ready(function () {
            $("#PharmacySales").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true
            });
        });
        </script>
	<!-- Second Table -->
	<script type="text/javascript">
        $(document).ready(function () {
            $("#ProductSales").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true
            });
        });
        </script>
	<!-- Third Table -->
	<script type="text/javascript">
        $(document).ready(function () {
            $("#Purchases").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true
            });
        });
        </script>
	<!-- Fourth Table -->
	<script type="text/javascript">
        $(document).ready(function () {
            $("#TotalSales").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true
            });
        });
        </script>
</body>

</html>