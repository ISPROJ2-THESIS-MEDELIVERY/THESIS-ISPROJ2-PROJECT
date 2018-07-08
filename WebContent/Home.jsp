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
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css" integrity="sha384-lKuwvrZot6UHsBSfcMvOkWwlCMgc0TaWr+30HWe3a4ltaBwTZhyTEggF5tJv8tbt" crossorigin="anonymous">
</head>

<body><img src="assets/img/MedeliveryLogo.png">
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid"><a class="navbar-brand" href="#"></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse" id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="index.jsp">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="About.jsp">About</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ContactUs.jsp">Contact Us</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="Members.jsp">Membership Registration</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="Catalog.jsp">View Products</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="#">Link</a></li>
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
    <h2 class="text-center">Featured Products</h2>
    
    
    <!-- Carousel loop start
	    <div class="carousel slide" data-ride="carousel" id="carousel-2">
	        <div class="carousel-inner" role="listbox">
				<c:forEach items="${FeaturedStock}" var="FStock">
	            	<div class="carousel-item"><c:out value="${FStock.product}" /></div>
				</c:forEach>
	        </div>
	        <ol class="carousel-indicators">
	            <li data-target="#carousel-2" data-slide-to="0"></li>
	            <li data-target="#carousel-2" data-slide-to="1"></li>
	            <li data-target="#carousel-2" data-slide-to="2" class="active"></li>
	        </ol>
	        <div>
	        	<a class="carousel-control-prev" href="#carousel-2" role="button" data-slide="prev">
		        	<span class="carousel-control-prev-icon"></span>
		        	<span class="sr-only">Previous</span>
	        	</a>
	        	<a class="carousel-control-next" href="#carousel-2" role="button" data-slide="next">
	        		<span class="carousel-control-next-icon"></span>
	        		<span class="sr-only">Next</span>
	        	</a>
	        </div>
	    </div>
    
    Carousel loop end -->
    <c:choose>
	    <c:when test = "${userID > 0}">
		    <h1 align="center" style="font-family:Lora, serif;font-size:55px;">Select your pharmacy</h1>
			<div>
			    <div class="container">
			        <div class="row">
				    <c:forEach items="${Pharmacy}" var="pharma">
						<div class="col-md-3"><a href="PurchaseController?PharmaID=<c:out value="${pharma.branchID}" />"><c:out value="${pharma.pharmacyName}" /> - <c:out value="${pharma.branchStreet}" />, <c:out value="${pharma.branchBarangay}" /></a></div>
					</c:forEach>
			        </div>
			    </div>
			</div>
		</c:when>
	    <c:otherwise>
	    <div id="cid_14" class="col-md-3 form-input-wide alert alert-info"  role="alert">
          <div id="text_14" class="form-html" data-component="text">
            <i class="fas fa-exclamation-circle"></i><p>To view our list of available pharmacies, please register and login</p>
          <br>
          </div>
        </div>
		</c:otherwise>
	</c:choose>
    <c:forEach items="${Pharmacy}" var="pharma">
		<div class="col-md-3"><a href="PurchaseController?PharmaID=<c:out value="${pharma.branchID}" />"><c:out value="${pharma.pharmacyName}" /> - <c:out value="${pharma.branchStreet}" />, <c:out value="${pharma.branchBarangay}" /></a></div>
	</c:forEach>
    
    
    <div class="features-boxed">
        <div class="container">
            <div class="intro">
                <h2 class="text-center">What can we offer you?</h2>
                <p class="text-center"></p>
            </div>
            <div class="row justify-content-center features">
                <div class="col-sm-6 col-md-5 col-lg-4 item">
                    <div class="box"><i class="fa fa-map-marker icon" style="color:#2779a3;"></i>
                        <h3 class="name">Anywhere within Metro Manila</h3>
                        <p class="description">We are happy to serve our customers anywhere all over Metro Manila<br></p>
                    </div>
                </div>
                <div class="col-sm-6 col-md-5 col-lg-4 item">
                    <div class="box"><i class="fa fa-clock-o icon" style="color:#2779a3;"></i>
                        <h3 class="name">Always available</h3>
                        <p class="description"><br>We assume that our customers will need their medication anytime within the day<br><br><br></p>
                    </div>
                </div>
                <div class="col-sm-6 col-md-5 col-lg-4 item">
                    <div class="box"><i class="fa fa-motorcycle icon" style="color:#2779a3;"></i>
                        <h3 class="name">On time</h3>
                        <p class="description"><br>Delivery is first come first serve and will arrive within 24 hours<br>after order processing<br>&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
                            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="features-blue" style="background-color:#f7f9fc;">
        <div class="container">
            <div class="intro">
                <h2 class="text-center">How does it work?</h2>
            </div>
            <div class="row features">
                <div class="col-sm-6 col-md-4 item"><i class="fa fa-upload icon" style="color:#f7f9fc;"></i>
                    <h3 class="name">Upload prescription</h3>
                    <p class="description">Customer needs to upload their prescription when ordering a prescribed medicine</p>
                </div>
                <div class="col-sm-6 col-md-4 item"><i class="fa fa-check icon" style="color:#f7f9fc;"></i>
                    <h3 class="name">Confirm</h3>
                    <p class="description">Our trained pharmacist confirms the uploaded prescription</p>
                </div>
                <div class="col-sm-6 col-md-4 item"><i class="fa fa-handshake-o icon" style="color:#f7f9fc;"></i>
                    <h3 class="name">Recieve</h3>
                    <p class="description">Ordered medicine will be delivered right into your doorstep</p>
                </div>
            </div>
        </div>
    </div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 style="font-family:Lora, serif;font-size:55px;">Our Partners</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12"><img src="assets/img/2GO_Group_Logo.png" width="100px"><img src="assets/img/grab-bike.jpg" width="150px" style="color:#000000;"></div>
            </div>
        </div>
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
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Gallery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="assets/js/index.js"></script>
    <script src="assets/js/multi-item-carousel.js"></script>
    <script src="assets/js/Simple-Slider1.js"></script>
</body>

</html>