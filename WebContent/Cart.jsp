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
    <div class="col">
        <h1>MY ORDER</h1>
    </div>
    <div class="col">
    <a href="PurchaseController?PharmaID=<c:out value="${SelectedBranch.branchID}" />"><button class="btn btn-primary" type="button" style="background-color:#222222;padding:12px;">ADD MORE PRODUCTS+</button></a>
    </div>
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
                	<c:forEach items="${CartList}" var="cartdetails">
			            <tr>
			                <td><c:out value="${cartdetails.name}" /></td>
			                <td><c:out value="${cartdetails.description}" /></td>
			                <td><img src="data:image/jpeg;base64,<c:out value="${cartdetails.image}" />" /></td>
			                <td><c:out value="${cartdetails.size}" /></td>
			                <td><c:out value="${cartdetails.prescription}" /></td>
			                <td><c:out value="${cartdetails.quantity}" /></td>
			                <td><c:out value="${cartdetails.unitCost}" /></td>
			                <td><c:out value="${cartdetails.totalCost}" /></td>
			            </tr>
					</c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <div class="col float-left" style="width:1008px;">
        <div class="form-group float-left" style="width:961px;">
            <div class="col float-left" style="width:274px;"><label class="col-form-label">Subtotal:</label><label class="col-form-label float-right">PXXX.00</label></div>
        </div>
        <div class="form-group float-left" style="width:974px;">
            <div class="col float-left" style="width:271px;"><label class="col-form-label" style="width:159px;">Delivery Surcharge:</label><label class="col-form-label float-right">PXX.00</label></div>
        </div>
        <div class="form-group float-left" style="width:965px;">
            <div class="col float-left" style="width:270px;"><label class="col-form-label">Total:</label><label class="col-form-label float-right">PXXX.00</label></div>
        </div>
        <div class="form-group float-left" style="width:958px;">
        	<form action="PurchaseController" method="post">
            	<div class="col float-left">
            		<input class="btn btn-primary float-left" type="submit" style="padding:19px;font-size:25px;background-color:#2779a3;" name="Action" value="Checkout"></input>
            	</div>
        	</form>
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