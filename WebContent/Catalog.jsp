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
</head>

<body><img src="assets/img/MedeliveryLogo.png">
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid"><a class="navbar-brand" href="#"></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="Home.jsp">Home</a></li>
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
		<form action="SearchController" method="get">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <form class="search-form">
                        <div class="input-group" style="width:336px;">
                            <div class="input-group-prepend"><span class="input-group-text"><i class="fa fa-search"></i></span></div><input class="form-control" type="text" name="SearchFilter" placeholder="I am looking for.." autocomplete="on">
                            <div class="input-group-append"><button class="btn btn-light" type="button">Search </button></div>
                        </div>
                    </form>
                </div>
                <div class="col-md-4"></div>
            </div>
			</form>
        </div>
    </div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-12 col-lg-2"><select class="form-control-lg" name="Over The Counter "><option value="">Categories</option><option value="">Prescription</option><option value="">Over The Counter</option></select></div>
            </div>
            <div class="row">
                <div class="col-md-12"><select class="form-control-lg" name="Medicine"><option value="">Medicine Type</option><option value="">Branded</option><option value="">Generic</option></select></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-12"><select class="form-control-lg" name="Medicine" style="margin:1px;"><option value="">Filter</option><option value="">Name</option><option value="">Best Selling</option><option value="">Price: Low to High</option><option value="">Price: High to Low</option></select></div>
            </div>
            <div class="row">
                <div class="col-md-12"><select class="form-control-lg" name="Medicine" style="margin:1px;"><option value="">Branch</option><option value="">Mercury</option><option value="">Best Selling</option><option value="">Price: Low to High</option><option value="">Price: High to Low</option></select></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col">
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
                </div>
            </div>
        </div>
    </div>
    
  
    
    <div></div>
    <div></div>
    <div></div>
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
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Gallery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="assets/js/index.js"></script>
    <script src="assets/js/multi-item-carousel.js"></script>
    <script src="assets/js/Simple-Slider1.js"></script>
</body>

</html>