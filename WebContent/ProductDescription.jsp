<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
                </ul>
            </div>
        </div>
    </nav><div class="row">
<div class="image-gallery">
  <aside class="thumbnails">
    <a href="#" class="selected thumbnail" data-big="http://www.deeez.co/wp-content/uploads/2016/09/medicine-packaging-design-tasnim-01.jpg">
      <div class="thumbnail-image" style="background-image: url(http://www.deeez.co/wp-content/uploads/2016/09/medicine-packaging-design-tasnim-01.jpg)"></div>
    </a>
    <a href="#" class="thumbnail" data-big="https://i.ytimg.com/vi/ToVQfjpq7x4/maxresdefault.jpg">
      <div class="thumbnail-image" style="background-image: url(https://i.ytimg.com/vi/ToVQfjpq7x4/maxresdefault.jpg)"></div>
    </a>
    <a href="#" class="thumbnail" data-big="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSThcuDPbM0El0RkRoIWDYZXuxAS7tFRtxFEJy7l_l0cS-Ib8ZMWA">
      <div class="thumbnail-image" style="background-image: url(https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSThcuDPbM0El0RkRoIWDYZXuxAS7tFRtxFEJy7l_l0cS-Ib8ZMWA)"></div>
    </a>
  </aside>

  <main class="primary" style="background-image: url('http://www.deeez.co/wp-content/uploads/2016/09/medicine-packaging-design-tasnim-01.jpg');"></main>
</div>
</div>
    <div class="row">
	<form action="ProductDescriptionController" method="get">
        <div class="col">
            <div class="row" style="margin:15px;">
                <div class="col">
                    <h1 style="font-size:50px;">Brand Name</h1>
                </div>
            </div>
            <div class="row" style="margin:10px;">
                <div class="col"><label class="col-form-label" style="font-size:32px;margin:10px;">Generic Name</label></div>
            </div>
            <div class="row" style="font-size:20px;margin:25px;">
                <div class="col"><label class="col-form-label">Price: PXX.XX</label></div>
            </div>
            <div class="row" style="margin:10px;">
                <div class="col">
                    <h1>Product Details</h1>
                    <div class="row">
                        <div class="col"><label class="col-form-label" style="font-size:20px;">Product Detail Summary</label>
                            <div class="row">
                                <div class="col"><label class="col-form-label" style="font-size:20px;">Product Strength</label></div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col"><label class="col-form-label" style="font-size:20px;">Product Form</label></div>
                    </div>
                    <div class="row">
                        <div class="col"><label class="col-form-label" style="font-size:20px;">Manufacturer</label></div>
                    </div>
                    <div class="row">
                        <div class="col"><label class="col-form-label" style="font-size:20px;">Origin</label></div>
                    </div>
                </div>
            </div>
        </div>
		</form>
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