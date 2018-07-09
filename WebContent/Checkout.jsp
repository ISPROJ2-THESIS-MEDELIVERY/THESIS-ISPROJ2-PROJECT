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
    <div class="card">
        <div class="card-header">
            <div class="row">
                <div class="col-12 col-sm-6 col-lg-7">
                    <h3><span class="fa-stack"><i class="fa fa-circle fa-stack-2x text-muted"></i><i class="icon ion-information-circled fa-stack-1x fa-inverse"></i></span> Checkout</h3>
                	<p>Orders that have not been evaluated within 24 hours are automatically disapproved by the chosen branch</p>
                </div>
            </div>
        </div>
        <div class="card-body">
        <h1>Purchase Summary</h1>
        <br>
        <div class="container">                           
                    <div>
                        <table id="Receipt" class="pretty">
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
									<!--  <form action='PurchaseController' method='post'>-->
										<tr>
											<%-- <td><input type="number" name="ProductID" value="<c:out value="${item.productID}" />" readonly></td> --%>
											<td><c:out value="${cartdetails.name}" /></td>
											<td><c:out value="${cartdetails.description}" /></td>
											<td>IMAGE HERE</td>
											<%-- <td><c:out value="${item.Image}" /></td> --%>
											<td><c:out value="${cartdetails.size}" /></td>
											<td><c:out value="${cartdetails.prescription}" /></td>
											<td><c:out value="${cartdetails.quantity}" /></td>
											<td><c:out value="${cartdetails.unitCost}" /></td>
											<td><c:out value="${cartdetails.totalCost}" /></td>											
										</tr>
									<!--  </form>-->
								</c:forEach>
                            </tbody>
                        </table>
                    </div>
                    Order ID: <c:out value="${orderReciept.orderID}" /><br />
                    Customer ID: <c:out value="${orderReciept.customerID}" /><br />
					Order Address: <c:out value="${orderReciept.orderAddress}" /><br />
					Senior Discount: <c:out value="${orderReciept.seniorDiscount}" /><br />
                </div>
	    </div>
        <div class="card-body">
            <div class="row">
                <div class="col">
                    <h1>Payment Details</h1>
                    <c:choose>
	                	<c:when test = "${ApproveChecker == true}">
	                		<form action="PurchaseController" method="post">
								<input type="hidden" name="Action" value="OrderPay"/>>
								<input type="hidden" name="OrdertoUpdate" value="<c:out value="${orderReciept.orderID}" />"/>
					            <button class="btn btn-primary float-center" type="submit" style="background-color:#465765;" name="Payment" value="Card">Card</button>
					            <button class="btn btn-primary float-center" type="submit" style="background-color:#465765;" name="Payment" value="Cash">Cash</button>
							</form>
	                	</c:when>
	                	<c:otherwise>
			                <h2>IF YOU ARE SEEING THIS, THEN YOUR ORDER IS CURRENTLY BEING EVALUATED, REJECTED OR HAS BEEN PAID FOR</h2>
			            </c:otherwise>
					</c:choose>
                </div>
            </div>
        </div>
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
            $("#Receipt").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true, bFilter: false, bInfo: false, bPaginate: false
            });
        });
        </script>
</body>

</html>