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
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,300,700,400italic,300italic,700italic">
    <link rel="stylesheet" href="assets/css/Article-Clean.css">
    <link rel="stylesheet" href="assets/css/Article-List.css">
    <link rel="stylesheet" href="assets/css/Brands.css">
    <link rel="stylesheet" href="assets/css/Contact-Form-Clean.css">
    <link rel="stylesheet" href="assets/css/Data-Summary-Panel---3-Column-Overview--Mobile-Responsive.css">
    <link rel="stylesheet" href="assets/css/Features-Blue.css">
    <link rel="stylesheet" href="assets/css/Features-Boxed.css">
    <link rel="stylesheet" href="assets/css/Footer-Basic.css">
    <link rel="stylesheet" href="assets/css/Footer-Dark.css">
    <link rel="stylesheet" href="assets/css/Good-login-dropdown-menu.css">
    <link rel="stylesheet" href="assets/css/Good-login-dropdown-menu1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
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
    <link rel="stylesheet" href="assets/css/Registration-Form-with-Photo.css">
    <link rel="stylesheet" href="assets/css/Simple-Slider.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/styles.css">
    <link rel="stylesheet" href="assets/css/Team-Boxed.css">
    <link rel="stylesheet" href="assets/css/TR-Form.css">
    <link rel="stylesheet" href="assets/css/Custom.css">
    <link rel="stylesheet" type="text/css" href="js/data_table/reset-min.css">
	<link rel="stylesheet" type="text/css" href="js/data_table/complete.css">
	
</head>

<body><img src="assets/img/MedeliveryLogo.png">
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid"><a class="navbar-brand" href="#"></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="About.jsp">About</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ContactUs.jsp">Contact Us</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="Members.jsp">Membership Registration</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="Catalog.jsp">View Products</a></li>
                </ul>
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="Login.jsp">Login</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="Home.jsp">Log Out</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="row">
                        <div class="col">
                            <h1 class="text-center" style="font-family:Lora, serif;font-size:28px;">For Pharmacists Approval<br></h1>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container">                           
                    <div>
                    <!-- First Table -->
                    <h1 class="text-center" style="font-family:Lora, serif;font-size:28px;">Over the counter<br></h1>
                        <table id="OTC" class="pretty"">
                            <thead>
      <tr>
      	  <th>Approval Status</th>
      	  <th>Customer ID</th>
      	  <th>Customer Name</th>
      	  <th>Order ID</th>
      	  <th>Address</th>
      	  <th>Senior Discount</th>
	      <th>Order Items</th>
	      <th>Remarks</th>
      </tr>
		</thead>
    
    
    
    <tbody>
	    <tr>
	      <td>Approved</td>
	      <td>001</td>
	      <td>Kyrie Fajardo</td>
	      <td>1001</td>
	      <td>Mandaluyong, Pioneer Woodlands</td>
	      <td>N/A</td>
        <td>
          <table>
              <thead>
                <tr>
                  <th>Medicine Name</th>
                  <th>Medicine Description</th>
                  <th>Order Quantity</th>
                  <th>Order Cost</th>
                  <th>Product Image</th>
                  <th>Packaging</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Paracetamol</td>
                  <td>For cough</td>
                  <td>10</td>
                  <td>P90</td>
                  <td><image src="img/paracetamol.jpg"></td>
                  <td>Capsule</td>
                </tr>
                <tr>
                  <td>Advil</td>
                  <td>For headache</td>
                  <td>5</td>
                  <td>P50</td>
                  <td><image src="img/advil.jpg"></td>
                  <td>Capsule</td>
                </tr>
                <tr>
                  <td>Viagra</td>
                  <td>For personal use</td>
                  <td>50</td>
                  <td>P20,000</td>
                  <td><image src="img/viagra.jpg"></td>
                  <td>tablet</td>
                </tr>
              </tbody>
          </table>
        </td>
      <td><textarea>
</textarea></td>
      </tr>
	</tbody>
                        </table>
                        <br>
                 <!-- Second Table -->
                 <h1 class="text-center" style="font-family:Lora, serif;font-size:28px;">Prescription requests<br></h1>
                        <table id="Prescription" class="pretty">
                            <thead>
                                <tr>
						            <th>ProductName</th>
						            <th>GenericName</th>
						            <th>ProductStrength</th>
						            <th>ProductForm</th>
						            <th>ProductPackaging</th>
						            <th>ProductDescription</th>
						            <th>ProductImage</th>
						            <th>Quantity</th>
						            <th>PriceSet</th>
						            <th>Quantity & Buy</th>
                                </tr>
                            </thead>
                            <tbody>
                              	<c:forEach items="${productList}" var="item">
										<tr>
											<td><c:out value="${item.productName}" /></td>
											<td><c:out value="${item.genericName}" /></td>
											<td><c:out value="${item.productStrength}" /></td>
											<td><c:out value="${item.productForm}" /></td>
											<td><c:out value="${item.productPackaging}" /></td>
											<td><c:out value="${item.productDescription}" /></td>
											<td><c:out value="${item.productImage}" /></td>
											<td><c:out value="${item.quantity}" /></td>
											<td><c:out value="${item.priceSet}" /></td>											
											<td>
												<form action='PurchaseController' method='post'>
												<input type="hidden" name="ProductID" value="<c:out value="${item.productID}" />"/>
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
												<input type='submit' name='Action' value="Addtocart" style='display: on-hover' />
												</form>
											</td>
										</tr>
								</c:forEach>
                            </tbody>
                        </table>
                    </div>
      </div>
      </div>
      <br>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-4"><button class="btn btn-primary" type="button" style="color:rgb(255,255,255);background-color:#56c5ff;width:212px;">Update Changes<br></button></div>
            </div>
        </div>
    </div>
    <div>
    </div>
	
	
	
    <div class="footer-basic">
        <footer>
            <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>
            <ul class="list-inline">
                <li class="list-inline-item"><a href="#">Home</a></li>
                <li class="list-inline-item"><a href="#">Services</a></li>
                <li class="list-inline-item"><a href="#">About</a></li>
                <li class="list-inline-item"><a href="#">Terms</a></li>
                <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
            </ul>
            <p class="copyright">Company Name © 2017</p>
        </footer>
    </div>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Gallery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="assets/js/index.js"></script>
    <script src="assets/js/multi-item-carousel.js"></script>
    <script src="assets/js/Simple-Slider1.js"></script>
        <script type="text/javascript"  src="js/jquery-1.8.3.js"></script>
<script type="text/javascript"  src="js/data_table/jquery.dataTables.min.js"></script>
<script type="text/javascript"  src="js/data_table/jquery.dataTables.plugins.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#OTC").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true, "sScrollX": "100%",
                "bScrollCollapse": true
            });
        });
        </script>
        <script type="text/javascript">
        $(document).ready(function () {
            $("#Prescription").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": false
            });
        });
        </script>
</body>

</html>