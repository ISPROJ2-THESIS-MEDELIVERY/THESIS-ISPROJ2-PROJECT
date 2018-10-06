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
    <link rel="stylesheet" type="text/css" href="js/data_table/reset-min.css">
	<link rel="stylesheet" type="text/css" href="js/data_table/complete.css">
</head>

<body><img src="assets/img/MedeliveryLogo.png">
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid"><a class="navbar-brand" href="#"></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="index.jsp">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="About.jsp">About</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ContactUs.jsp">Contact Us</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="Members.jsp">Membership Registration</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="Catalog.jsp">View Products</a></li>
                </ul>
                <c:choose>
	                	<c:when test = "${userID > 0}">
	                		<ul class="nav navbar-nav ml-auto">
			                    <li class="nav-item" role="presentation"><a class="nav-link" href="Cart.jsp">My Cart</a></li>
			                    <li class="nav-item" role="presentation"><a class="nav-link" href="Logout.jsp">Log out</a></li>
			                </ul>
	                	</c:when>
	                	<c:otherwise>
			                <ul class="nav navbar-nav ml-auto">
			                    <li class="nav-item" role="presentation"><a class="nav-link" href="Login.jsp">Login</a></li>
			                    <li class="nav-item" role="presentation"><a class="nav-link" href="RegistrationCustomer.jsp">Register</a></li>
			                </ul>
			            </c:otherwise>
					</c:choose>
            </div>
        </div>
    </nav>
    <div class="features-boxed">
        <div class="container">
            <div class="intro">
                <h2 class="text-center">Delivery Status Update</h2>
                <p class="text-center"></p>
            </div>
        </div>
    </div>
    
    <!-- First Table -->
    <h1>Pending Deliveries</h1>
    <div>
        <div class="container">                           
                    <div>
                        <table id="OTC" class="pretty"">
                            <thead>
      <tr>
      	  <th>Order ID</th>
      	  <th>Customer ID</th>
      	  <th>Delivery ID</th>
      	  <th>Pharmacist ID</th>
      	  <th>City ID</th>
      	  <th>Branch ID</th>
	      <th>Order Address</th>
	      <th>Date Ordered</th>
	      <th>Date Processed</th>
	      <th>Date Delivered</th>
	      <th>Order Type</th>
	      <th>Order Status</th>
	      <th>Senior Discount</th>
	      <th>Payment Method</th>
	      <th>Actual Cost</th>
	      <th>Delivery Status</th>
      </tr>
		</thead>
    
    
    
    <tbody>
    	<c:forEach items="${OrderList}" var="item">
	    <tr>
	      <td><c:out value="${item.orderID}" /></td>
	      <td><c:out value="${item.customerID}" /></td>
	      <td><c:out value="${item.deliveryID}" /></td>
	      <td><c:out value="${item.pharmacistID}" /></td>
	      <td><c:out value="${item.cityID}" /></td>
	      <td><c:out value="${item.branchID}" /></td>
	      <td><c:out value="${item.orderAddress}" /></td>
	      <td><c:out value="${item.dateOrdered}" /></td>
	      <td><c:out value="${item.dateProcessed}" /></td>
	      <td><c:out value="${item.dateDelivered}" /></td>
	      <td><c:out value="${item.orderType}" /></td>
	      <td><c:out value="${item.orderStatus}" /></td>
	      <td><c:out value="${item.seniorDiscount}" /></td>
	      <td><c:out value="${item.paymentMethod}" /></td>
	      <td><c:out value="${item.actualCost}" /></td>
		  <td>
		  <form action="DispatcherController" method="post">
		  		<input type="hidden" name="OrderID" value="<c:out value="${item.orderID}" />"/>
				
					<!-- Commented just to disable the dropdown -->				
				<!-- <select name="Filters">
					<optgroup>
						<option value=pending>PENDING</option>
						<option value="approved">APPROVED</option>
						<option value="cancelled">CANCELLED</option>
					</optgroup>
				</select> -->
				
	        	<button class="btn btn-primary" type="submit" style="font-size:15px;" name="DeliveryStatus" value="TRANSIT">Transit</button>
        	</form>
           </td>
      	</tr>
      	</c:forEach>
	</tbody>
              </table>
                        <br>
                    </div>
      </div>
      </div>
      
      <br>
      <h1>Active Delivery</h1>
      
      <!-- Second Table -->
      <div>
        <div class="container">                           
                    <div>
                        <table id="Table2" class="pretty"">
                            <thead>
      <tr>
      	  <th>Order ID</th>
      	  <th>Customer ID</th>
      	  <th>Delivery ID</th>
      	  <th>Pharmacist ID</th>
      	  <th>City ID</th>
      	  <th>Branch ID</th>
	      <th>Order Address</th>
	      <th>Date Ordered</th>
	      <th>Date Processed</th>
	      <th>Date Delivered</th>
	      <th>Order Type</th>
	      <th>Order Status</th>
	      <th>Senior Discount</th>
	      <th>Payment Method</th>
	      <th>Actual Cost</th>
	      <th>Delivery Status</th>
      </tr>
		</thead>
    
    
    
    <tbody>
    	<c:forEach items="${TransitList}" var="item">
	    <tr>
	      <td><c:out value="${item.orderID}" /></td>
	      <td><c:out value="${item.customerID}" /></td>
	      <td><c:out value="${item.deliveryID}" /></td>
	      <td><c:out value="${item.pharmacistID}" /></td>
	      <td><c:out value="${item.cityID}" /></td>
	      <td><c:out value="${item.branchID}" /></td>
	      <td><c:out value="${item.orderAddress}" /></td>
	      <td><c:out value="${item.dateOrdered}" /></td>
	      <td><c:out value="${item.dateProcessed}" /></td>
	      <td><c:out value="${item.dateDelivered}" /></td>
	      <td><c:out value="${item.orderType}" /></td>
	      <td><c:out value="${item.orderStatus}" /></td>
	      <td><c:out value="${item.seniorDiscount}" /></td>
	      <td><c:out value="${item.paymentMethod}" /></td>
	      <td><c:out value="${item.actualCost}" /></td>
		  <td>
        	<form action="DispatcherController" method="post">
		  		<input type="hidden" name="OrderID" value="<c:out value="${item.orderID}" />"/>
				<select class="form-control" name="DeliveryStatus">
	                <option value="FINISHED">FINISHED</option>
	                <option value="DELAYED">DELAYED</option>
                </select>				
	        	<button class="btn btn-primary" type="submit" style="font-size:15px;">Update</button>
        	</form>
           </td>
      	</tr>
      	</c:forEach>
	</tbody>
              </table>
                        <br>
                    </div>
      </div>
      </div>
        <div>
        
        <!-- Buttons -->
<!-- 		<form action="DeliveryPersonelController" method="post">
            <div class="container">
                <div class="row">
                    <div class="col-md-12"><button class="btn btn-primary" type="submit" style="font-size:25px;margin:10px;">Update</button><button class="btn btn-primary" type="submit" style="font-size:25px;margin:10px;">Delivery History</button></div>
                </div>
            </div>
			</form> -->
			
			
        </div>
        <div class="footer-basic">
            <footer>
                <div class="social"><a href="#"><i class="icon ion-social-instagram"></i></a><a href="#"><i class="icon ion-social-snapchat"></i></a><a href="#"><i class="icon ion-social-twitter"></i></a><a href="#"><i class="icon ion-social-facebook"></i></a></div>
                <ul class="list-inline">
                    <li class="list-inline-item"><a href="Home.jsp">Home</a></li>
                    <li class="list-inline-item"></li>
                    <li class="list-inline-item"><a href="About.jsp">About</a></li>
                    <li class="list-inline-item"><a href="#">Terms</a></li>
                    <li class="list-inline-item"><a href="#">Privacy Policy</a></li>
                </ul>
                <p class="copyright">Medelivery © 2018</p>
            </footer>
        </div>
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
            <div><a class="carousel-control-prev" href="#carousel-1" role="button" data-slide="prev"><span class="sr-only">Previous</span></a><a class="carousel-control-next" href="#carousel-1" role="button" data-slide="next"><span class="sr-only">Next</span></a></div>
            <ol
                class="carousel-indicators"></ol>
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
            $("#Table2").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true, "sScrollX": "100%",
                "bScrollCollapse": true
            });
        });
        </script>
</body>

</html>