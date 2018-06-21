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
                <div class="col-md-4"><button class="btn btn-primary" type="button" style="background-color:#56c5ff;">Button</button></div>
                <div class="col-md-4">
                    <div class="row">
                        <div class="col">
                            <h1 class="text-center" style="font-family:Lora, serif;font-size:28px;">For Pharmacists<br></h1>
                        </div>
                    </div>
                </div>
                <div class="col-md-4"></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <div class="table-responsive">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>CustomerID</th>
                                    <th>Customer Name</th>
                                    <th>Medicine Name</th>
                                    <th>Medicine Description</th>
                                    <th>Amount / Qty</th>
                                    <th>Product Sale Approval /prescription Approval</th>
                                    <th>Senior Citizen/ Person With Disability - &nbsp;ID Approval for Discount</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><label>Label</label></td>
                                    <td><label>Label</label></td>
                                    <td><label>Label</label></td>
                                    <td>&nbsp;&nbsp;<label>Label</label></td>
                                    <td>&nbsp;<label>Label</label></td>
                                    <td><a href="#">Download Image</a>
                                        <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-1"><label class="form-check-label" for="formCheck-1">Approve</label></div>
                                        <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-2"><label class="form-check-label" for="formCheck-2">Disapprove</label></div><label>Comment&nbsp;</label>
                                        <div class="row">
                                            <div class="col"><textarea name="CommentProductSale"></textarea></div>
                                        </div>
                                    </td>
                                    <td><a href="#">Download Image</a>
                                        <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-1"><label class="form-check-label" for="formCheck-1">Approve</label></div>
                                        <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-2"><label class="form-check-label" for="formCheck-2">Disapprove</label></div><label>Comment&nbsp;</label>
                                        <div class="row">
                                            <div class="col"><textarea name="CommentPWD"></textarea></div>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td><label>Label</label></td>
                                    <td><label>Label</label></td>
                                    <td><label>Label</label></td>
                                    <td>&nbsp;<label>Label</label></td>
                                    <td><label>Label</label></td>
                                    <td><a href="#">Download Image</a>
                                        <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-4"><label class="form-check-label" for="formCheck-4">Approve</label></div>
                                        <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-3"><label class="form-check-label" for="formCheck-3">Disapprove</label></div><label>Comment&nbsp;</label>
                                        <div class="row">
                                            <div class="col"><textarea name="CommentProductSale"></textarea></div>
                                        </div>
                                    </td>
                                    <td><a href="#">Download Image</a>
                                        <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-1"><label class="form-check-label" for="formCheck-1">Approve</label></div>
                                        <div class="form-check"><input class="form-check-input" type="radio" id="formCheck-2"><label class="form-check-label" for="formCheck-2">Disapprove</label></div><label>Comment&nbsp;</label>
                                        <div class="row">
                                            <div class="col"><textarea name="CommentPWD"></textarea></div>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div></div>
    <div></div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4"><button class="btn btn-primary" type="submit" style="background-color:#56c5ff;">Update Changes</button></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4"><button class="btn btn-primary" type="button" style="background-color:#56c5ff;color:rgb(255,255,255);width:210px;">Print Financial Reports<br></button></div>
                <div class="col-md-4"><button class="btn btn-primary" type="button" style="color:rgb(255,255,255);background-color:#56c5ff;width:212px;">Print Sale History<br></button></div>
            </div>
        </div>
    </div>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-4"></div>
                <div class="col-md-4"></div>
                <div class="col-md-4"></div>
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