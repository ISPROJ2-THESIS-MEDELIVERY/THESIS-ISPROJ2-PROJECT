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
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="Home.jsp" style="color:rgba(0,0,0,0.5);">Manage Customer Accounts</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="About.jsp" style="color:rgba(0,0,0,0.9);">Manage Pharmeceutical Parters&nbsp;<br></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ContactUs.jsp" style="color:rgba(0,0,0,0.5);">Manage Delivery Service Accounts<br></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ContactUs.jsp">Inventory Management</a></li>
                </ul>
                <ul class="nav navbar-nav ml-auto"></ul>
            </div>
        </div>
    </nav><select><optgroup label="This is a group"><option value="12" selected="">Filter</option><option value="13">Customer ID</option><option value="14">User ID</option><option value="">Customer Name</option></optgroup></select>
    <div class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Pharmacist ID</th>
                    <th>User ID</th>
                    <th>Branch ID</th>
                    <th>Name (Branch Supervisor)</th>
                    <th>Position</th>
                    <th><strong>PRC No.</strong><br></th>
                    <th>Date Added</th>
                    <th>Contact Number</th>
                    <th>Business License / Document (Proof of Operation)</th>
                    <th>Function</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><button class="btn btn-primary" type="button">View</button></td>
                    <td><button class="btn btn-primary" type="button">Delete</button><button class="btn btn-primary" type="submit">Update</button></td>
                </tr>
                <tr>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><button class="btn btn-primary" type="button">View</button></td>
                    <td><button class="btn btn-primary" type="button">Delete</button><button class="btn btn-primary" type="submit">Update</button></td>
                </tr>
            </tbody>
        </table>
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
    <form action="ManagePharmacyAccountController" method="post">
        <h2 class="text-center"><strong>Register Company(Pharmacy)</strong></h2>
        <div class="form-row" style="padding:5px;">
            <div class="col"><input class="form-control" type="text" name="CName" required="" placeholder="Company Name" style="width:350px;"></div>
            <div class="col"><input class="form-control" type="text" name="CStreet" required="" placeholder="Company Street" style="width:350px;"></div>
        </div>
        <div class="form-row" style="padding:5px;">
            <div class="col"><input class="form-control" type="text" name="CBarangay" required="" placeholder="Company Barangay" style="width:350px;"></div>
            <div class="col"><input class="form-control" type="text" name="CCity" required="" placeholder="Company City" style="width:350px;"></div>
        </div>
        <div class="form-row" style="padding:5px;">
            <div class="col">
                <div class="form-row">
                    <div class="col">
                        <div class="alert alert-danger" role="alert"><span style="color:#eb3b60;font-size:15px;"><strong>Upload Document / Business License&nbsp;</strong></span></div>
                    </div>
                </div>
                <div class="form-row">
                    <div class="col"><input class="visible" type="file" name="BusinessLicense"></div>
                </div>
            </div>
            <div class="col">
                <div class="form-row">
                    <div class="col"><input class="form-control" type="text" name="ContactNumber" required="" placeholder="Company Contact/Landline" style="width:350px;"></div>
                </div>
            </div>
        </div>
        <div class="form-row">
            <div class="col"><input class="form-control" type="email" name="Email" required="" placeholder="Email Address *" style="width:350px;margin:5px;"><input class="form-control" type="password" name="Password" required="" placeholder="Create Password" style="width:350px;margin:5px;">
                <input
                    class="form-control" type="password" name="Password-repeat" required="" placeholder="Re-enter Password" style="margin:5px;width:350px;"><button class="btn btn-primary" type="submit" style="font-size:31px;width:360px;">Create Courier Account</button></div>
        </div>
    </form>
    <script src="assets/js/jquery.min.js"></script>
    <script src="assets/bootstrap/js/bootstrap.min.js"></script>
    <script src="assets/js/Gallery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
    <script src="assets/js/index.js"></script>
    <script src="assets/js/multi-item-carousel.js"></script>
    <script src="assets/js/Simple-Slider1.js"></script>
</body>

</html>