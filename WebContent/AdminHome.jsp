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

<body><img src="assets/img/adminlogo.png">
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid"><a class="navbar-brand" href="#"></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1">
                <ul class="nav navbar-nav">
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="ManageCustomerAccount.jsp">Manage Customer Accounts</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ManagePharmacyAccount.jsp">Manage Pharmeceutical Parters&nbsp;<br></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ManageDeliveryCourierAccount.jsp">Manage Delivery Service Accounts<br></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ManageInventory.jsp">Inventory</a></li>
                </ul>
                <ul class="nav navbar-nav ml-auto">
                    <li class="nav-item" role="presentation"><a class="nav-link" href="Login.jsp">Login</a></li>
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
        <div><a class="carousel-control-prev" href="#carousel-1" role="button" data-slide="prev"><span class="sr-only">Previous</span></a><a class="carousel-control-next" href="#carousel-1" role="button" data-slide="next"><span class="sr-only">Next</span></a></div>
        <ol
            class="carousel-indicators"></ol>
    </div>
    <div style="padding:20px;margin:10px;">
        <div class="container">
            <div class="row">
                <div class="col-md-6">
                    <h1>Select Month for Record Printing</h1>
                </div>
                <div class="col-md-6">
                    <div class="row" style="padding:15px;">
                        <div class="col"><input type="date"></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div style="padding:20px;margin:15px;">
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <div class="row" style="padding:15px;">
                        <div class="col"><button class="btn btn-primary" type="button">Print Audit Trail</button></div>
                    </div>
                    <div class="row" style="padding:15px;">
                        <div class="col"><select><optgroup label="This is a group"><option value="12" selected="">Select Pharmacy</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select></div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row" style="padding:15px;">
                        <div class="col"><button class="btn btn-primary" type="button">Print Sale History</button></div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="row" style="padding:15px;">
                        <div class="col"><button class="btn btn-primary" type="button">Print Order History / Delivery Time</button></div>
                    </div>
                    <div class="row" style="padding:15px;">
                        <div class="col"><select><optgroup label="This is a group"><option value="12" selected="">Select Delivery Service</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select></div>
                    </div>
                </div>
            </div>
        </div>
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