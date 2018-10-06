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
    <link rel="stylesheet" type="text/css" href="js/data_table/reset-min.css">
	<link rel="stylesheet" type="text/css" href="js/data_table/complete.css">
</head>

<body><img src="assets/img/adminlogo.png">
    <nav class="navbar navbar-light navbar-expand-md">
        <div class="container-fluid"><a class="navbar-brand" href="#"></a><button class="navbar-toggler" data-toggle="collapse" data-target="#navcol-1"><span class="sr-only">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
            <div class="collapse navbar-collapse"
                id="navcol-1">
                <ul class="nav navbar-nav">
                	 <li class="nav-item" role="presentation"><a class="nav-link" href="TotalAudit.jsp">Home</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ManageCustomerAccount.jsp" style="color:rgba(0,0,0,0.5);">Manage Customer Accounts</a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ManagePharmacyAccount.jsp">Manage Pharmeceutical Parters&nbsp;<br></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="ManageDeliveryCourierAccount.jsp" style="color:rgba(0,0,0,0.9);">Manage Delivery Service Accounts<br></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ManageInventory.jsp">Inventory Management<br></a></li>
                </ul>
                <ul class="nav navbar-nav ml-auto"></ul>
            </div>
        </div>
    </nav>
    <div>
        <div class="container">
            <div class="row">
                <div class="col-md-6"><select class="form-control" name="Over The Counter "><option value="">Filter</option><option value="13">Courier Service ID</option><option value="14">Company Name</option><option value="">Company Street</option><option value="">Company Barangay</option><option value="">Company City</option><option value="">Date Added</option></select></div>          
            </div>
        </div>
    </div>
    <br>
    <div>
        <div class="container">                           
                    <div>
                        <table id="DeliveryAccount" class="pretty">
                            <thead>
                                <tr>
						            <th>Courier Service ID</th>
						            <th>Company Name</th>
						            <th>Company Street</th>
						            <th>Company Barangay</th>
						            <th>Company City</th>
						            <th>Company Province</th>
						            <th>Company Landline</th>
						            <th>Company Cellular</th>
						            <th>Company Contact</th>
						            <th>Date Added</th>
						            <th>Edit Details</th>
                                </tr>
                            </thead>
                            <tbody>
                              	<c:forEach items="${productList}" var="item">
										<tr>
											<td><c:out value="${item.CourierServiceID}" /></td>
											<td><c:out value="${item.CompanyName}" /></td>
											<td><c:out value="${item.CompanyStreet}" /></td>
											<td><c:out value="${item.CompanyBarangay}" /></td>
											<td><c:out value="${item.CompanyCity}" /></td>
											<td><c:out value="${item.CompanyProvince}" /></td>
											<td><c:out value="${item.CompanyLandline}" /></td>
											<td><c:out value="${item.CompanyCellular}" /></td>
											<td><c:out value="${item.CompanyContact}" /></td>											
											<td>
												<form action='' method='post'>
												<input type="hidden" name="" value="<c:out value="" />"/>
												<input type='submit' name='Action' value="Update" style='display: on-hover' />
												</form>
											</td>
											
										</tr>
								</c:forEach>
                            </tbody>
                        </table>
                    </div>
                    <br>
      </div>
      </div>
        <form action="ManageDeliveryCourierAccountController" method="post">
            <h1 class="text-center">Register Company(Dispatcher)</h1>
            <div class="form-row" style="padding:40px;">
                <div class="col"><input class="form-control" type="text" name="CourierService" required="" placeholder="Courier Service"></div>
            </div>
            <div class="form-row" style="padding:40px;">
                <div class="col"><input class="form-control" type="text" name="CStreet" required="" placeholder="Company Street"></div>
            </div>
            <div class="form-row" style="padding:40px;">
                <div class="col"><input class="form-control" type="text" name="CBarangay" required="" placeholder="Company Barangay"></div>
            </div>
            <div class="form-row" style="padding:40px;">
                <div class="col"><input class="form-control" type="text" name="CCity" required="" placeholder="Company City"></div>
            </div>
            <div class="form-row" style="padding:40px;">
                <div class="col"><input class="form-control" type="text" name="ContactNumber" required="" placeholder="Company Contact/Landline"></div>
            </div>
            <div class="form-row" style="padding:40px;">
                <div class="col">
                    <div class="alert alert-danger" role="alert"><span style="color:#eb3b60;font-size:15px;"><strong>Upload Document / Business License&nbsp;</strong></span></div><input class="visible" type="file" accept="image/*" required=""></div>
            </div>
            <div class="form-row">
                <div class="col" style="padding:40px;">
                    <div class="form-row" style="padding:15px;">
                        <div class="col"><input class="form-control" type="email" name="Email" required="" placeholder="Email Address *" style="width:300px;"></div>
                    </div>
                    <div class="form-row" style="padding:15px;">
                        <div class="col"><input class="form-control" type="password" name="Password" required="" placeholder="Create Password" style="width:300px;"></div>
                    </div>
                    <div class="form-row" style="padding:15px;">
                        <div class="col"><input class="form-control" type="password" name="Password-repeat" required="" placeholder="Re-enter Password" style="margin:0px;width:300px;"></div>
                    </div>
                </div>
            </div>
            <div class="form-row" style="padding:0px;">
                <div class="col"><button class="btn btn-primary float-left" type="submit" style="font-size:30px;width:362px;">Create Account</button></div>
            </div>
        </form>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/bootstrap/js/bootstrap.min.js"></script>
        <script src="assets/js/Gallery.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Swiper/3.3.1/js/swiper.jquery.min.js"></script>
        <script src="assets/js/index.js"></script>
        <script src="assets/js/multi-item-carousel.js"></script>
        <script src="assets/js/Simple-Slider1.js"></script>
            <script type="text/javascript"  src="js/jquery-1.8.3.js"></script>
<script type="text/javascript"  src="js/data_table/jquery.dataTables.min.js"></script>
<script type="text/javascript"  src="js/data_table/jquery.dataTables.plugins.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#DeliveryAccount").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true
            });
        });
        </script>
</body>

</html>