<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MedeliveryGUI_v4</title>
    <link rel="stylesheet" href="/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/fonts/font-awesome.min.css">
    <link rel="stylesheet" href="/fonts/ionicons.min.css">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Cookie">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lora">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,300,700,400italic,300italic,700italic">
    <link rel="stylesheet" href="/Article-Clean.css">
    <link rel="stylesheet" href="/Article-List.css">
    <link rel="stylesheet" href="/Brands.css">
    <link rel="stylesheet" href="/Contact-Form-Clean.css">
    <link rel="stylesheet" href="/Data-Summary-Panel---3-Column-Overview--Mobile-Responsive.css">
    <link rel="stylesheet" href="/Features-Blue.css">
    <link rel="stylesheet" href="/Features-Boxed.css">
    <link rel="stylesheet" href="/Footer-Basic.css">
    <link rel="stylesheet" href="/Footer-Dark.css">
    <link rel="stylesheet" href="/Good-login-dropdown-menu.css">
    <link rel="stylesheet" href="/Good-login-dropdown-menu1.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/css/swiper.min.css">
    <link rel="stylesheet" href="/Gallery.css">
    <link rel="stylesheet" href="/Gallery1.css">
    <link rel="stylesheet" href="/Login-Form-Clean.css">
    <link rel="stylesheet" href="/Pretty-Search-Form.css">
    <link rel="stylesheet" href="/Map-Clean.css">
    <link rel="stylesheet" href="/multi-item-carousel.css">
    <link rel="stylesheet" href="/Navbar-Centered.css">
    <link rel="stylesheet" href="/Navigation-with-Search.css">
    <link rel="stylesheet" href="/Pretty-Table.css">
    <link rel="stylesheet" href="/Pretty-Table1.css">
    <link rel="stylesheet" href="/Registration-Form-with-Photo.css">
    <link rel="stylesheet" href="/Simple-Slider.css">
    <link rel="stylesheet" href="/style.css">
    <link rel="stylesheet" href="/styles.css">
    <link rel="stylesheet" href="/Team-Boxed.css">
    <link rel="stylesheet" href="/TR-Form.css">
</head>

<body><img src="/MedeliveryLogo.png">
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid"><a class="navbar-brand" href="#"></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="Home.html">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="About.html">About</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ContactUs.html">Contact Us</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="Members.html">Membership Registration</a></li>
                </ul>
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="Login.html">Login</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <div class="register-photo">
        <div class="form-container">
            <div class="image-holder" style="background-image:url(&quot;/Medicine.jpg&quot;);width:501px;margin:18px;height:560px;"></div>
            <form action="RegistrationController" method="post">
                <h2 class="text-center"><strong>Create</strong> an account.</h2>
                <div class="form-group">
                    <div class="alert alert-danger" role="alert">
                    	<span style="color:#eb3b60;"><strong>* Required Fields</strong></span>
                    </div>
                    <input class="form-control" type="text" name="FullName" placeholder="First Name *" maxlength="100" autofocus="">
					<input class="form-control" type="text" name="CAddress" placeholder="Address  *" maxlength="200" autofocus="">
					<input class="form-control" type="text" name="ContactNumber" required="" placeholder="Landline / Cellphone *" maxlength="11" autofocus="">
                    <div class="alert alert-danger" role="alert"><span style="color:#eb3b60;font-size:15px;">
                    	<strong>If applicable, please upload a photo of your Senior Citizen ID/ PWD ID&nbsp;</strong>
                    	</span>
                    </div>
                    <input class="visible" type="file" name="SeniorCitizenID">
                    <input class="form-control" type="text" name="Username" required="" placeholder="Username*" maxlength="100">
                    <input class="form-control" type="email" name="CusEmail" required="" placeholder="Email Address *" maxlength="100">
				</div>
                	<div class="form-group">
                	<input class="form-control" type="password" name="password" required="" placeholder="Create Password" maxlength="100"></div>
                	<input class="form-control" type="password" name="password-repeat" required="" placeholder="Re-enter Password" maxlength="100" style="margin:0px;">
                <div class="form-group" style="margin: ;"></div>
                <div class="form-group">
                    <div class="form-check"><label class="form-check-label" style="margin:20px;font-size:20px;"><input class="form-check-input" type="checkbox">I agree to the license terms.</label></div>
                </div>
                <div class="form-group">
					<input class="btn btn-primary btn-block" type="submit" value="Sign Up"  style="background-color:#56c5ff;"/>
               	</div>
               		<a href="#" class="already" style="color:#282d32;font-size:20px;">Already have an account? Login here.</a>
               	</form>
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
    <script src="/js/jquery-3.2.1.min.js"></script>
    <script src="/bootstrap/js/bootstrap.min.js"></script>
    <script src="/Gallery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="/index.js"></script>
    <script src="/multi-item-carousel.js"></script>
    <script src="/Simple-Slider1.js"></script>
    <script id="bs-live-reload" data-sseport="3074" data-lastchange="1519444579511" src="/js/livereload.js"></script>
</body>

</html>