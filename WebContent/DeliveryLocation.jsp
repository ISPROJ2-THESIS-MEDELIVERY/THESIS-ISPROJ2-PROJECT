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
            <div class="row">
                <div class="col">
                    <p><br>For Deliveries from a pharmacy within the city of your delivery address a&nbsp;₱50.00 delivery charge will be added to your order<br><br>For Deliveries from a pharmacy outside the city of your delivery address a&nbsp;₱100.00 delivery
                        charge will be added to your order<br><br><br><br></p>
                </div>
                <div class="col"><img src="assets/img/location.png"></div>
            </div>
            <div class="row">
			<form action="DeliveryLocationController" method="post">
                <div class="col-md-6">
                    <div class="row">
                        <div class="col">
                            <div class="alert alert-danger" role="alert"><span><strong>Items with * require entry&nbsp;</strong></span></div><input type="text" name="Barangay" required="" placeholder="Barangay *" style="margin:20px;"><select required="" style="width:300px;margin:20px;"><option value="12" selected="">City / Municipality</option><option value="13">Caloocan</option><option value="14">City of Manila</option><option value="">Las Piñas</option><option value="">Makati</option><option value="">Malabon</option><option value="">Mandaluyong</option><option value="">Marikina</option><option value="">Muntinlupa</option><option value="">Navotas</option><option value="">Parañaque</option><option value="">Pasay</option><option value="">Pasig</option><option value="">Pateros</option><option value="">Quezon City</option><option value="">San Juan</option><option value="">Taguig</option><option value="">Valenzuela</option></select>
                            <textarea
                                name="CAddress" required="" placeholder="Complete Address (House Number, Building and Street Name) *" style="height:83px;width:285px;color:rgb(0,0,0);margin:20px;"></textarea><button class="btn btn-primary" type="submit" style="margin:21px;width:287px;background-color:#56c5ff;color:rgb(255,255,255);font-size:18px;">Order Now</button><button class="btn btn-primary" type="submit" style="margin:21px;width:287px;background-color:#56c5ff;color:rgb(255,255,255);font-size:18px;">Use Registration Address</button></div>
                    </div>
                </div>
                <div class="col"></div>
				</form>
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
</body>

</html>