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
                	<li class="nav-item" role="presentation"><a class="nav-link" href="AdminHome.jsp">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="ManageCustomerAccount.jsp">Manage Customer Accounts</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ManagePharmacyAccount.jsp">Manage Pharmeceutical Parters&nbsp;<br></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ManageDeliveryCourierAccount.jsp">Manage Delivery Service Accounts<br></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ManageInventory.jsp">Inventory Management<br></a></li>
                </ul>
                <ul class="nav navbar-nav ml-auto"></ul>
            </div>
        </div>
    </nav><select name="Date Added"><optgroup label="This is a group"><option value="12" selected="">Filter</option><option value="13">Customer ID</option><option value="14">User ID</option><option value="">Customer Name</option></optgroup></select>
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Customer ID</th>
                    <th>User ID</th>
                    <th>Customer Name</th>
                    <th>Order History</th>
                    <th>Address</th>
                    <th>Email&nbsp;</th>
                    <th>IsSeniorCitizen</th>
                    <th>Date Added</th>
                    <th>Contact Number</th>
                    <th>Function</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><button class="btn btn-primary" type="button">Print Order History</button></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><button class="btn btn-primary" type="button">Delete</button><button class="btn btn-primary" type="submit">Update</button></td>
                </tr>
                <tr>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><button class="btn btn-primary" type="button">Print Order History</button></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><button class="btn btn-primary" type="button">Delete</button><button class="btn btn-primary" type="submit">Update</button></td>
                </tr>
            </tbody>
        </table>
    </div>
    <div class="register-photo">
	<form action="ManageCustomerAccountController" method="post">
        <h1 style="margin:30px;">User registration</h1>
        <div class="row" style="padding:-1px;">
            <div class="col"><input type="text" name="FirstName" required="" placeholder="FullName *" style="width:330px;font-size:20px;"></div>
            <div class="col"><input type="text" name="LastName" required="" placeholder="Last Name *" style="width:330px;font-size:20px;"></div>
        </div>
        <div class="row" style="padding:0px;">
            <div class="col"><input type="text" name="CAddress" required="" placeholder="Address*" style="font-size:20px;width:330px;"></div>
            <div class="col"><input type="text" name="ContactNumber" required="" placeholder="Landline / Cellphone *" style="width:330px;font-size:20px;"></div>
        </div>
        <div class="row">
            <div class="col">
                <div class="row">
                    <div class="col">
                        <p style="font-size:20px;">Upload PWD or Senior Citizen picture if neccessary</p>
                    </div>
                </div>
                <div class="row">
                    <div class="col" style="font-size:20px;"><input class="visible" type="file" accept="image/*"></div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col"><input type="email" name="CusEmail" required="" placeholder="Email Address *" style="font-size:20px;"></div>
        </div>
        <div class="row">
            <div class="col"><input type="password" name="Password" required="" placeholder="Create Password" style="font-size:20px;"></div>
        </div>
        <div class="row">
            <div class="col"><input type="password" name="Password-repeat" required="" placeholder="Re-enter Password" style="margin:0px;font-size:20px;"></div>
        </div>
        <div class="row">
            <div class="col"><button class="btn btn-primary" type="submit" style="font-size:34px;width:359px;">Create New User</button></div>
        </div>
		</form>
    </div>
	
	
    <div class="features-boxed"></div>
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
</body>

</html>