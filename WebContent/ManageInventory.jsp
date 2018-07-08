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
                    <li class="nav-item" role="presentation"><a class="nav-link" href="ManageDeliveryCourierAccount.jsp">Manage Delivery Service Accounts<br></a></li>
                    <li class="nav-item" role="presentation"><a class="nav-link active" href="ManageInventory.jsp" style="color:rgba(0,0,0,0.9);">Inventory Management<br></a></li>
                </ul>
                <ul class="nav navbar-nav ml-auto"></ul>
            </div>
        </div>
    </nav>
    <h2 class="text-center"><strong>Product Register</strong></h2>
    <!-- <select><optgroup label="This is a group"><option value="12" selected="">Filter</option><option value="13">Product ID</option><option value="14">Product Name</option><option value="">Generic Name</option><option value="">Registration Number</option><option value="">Rx Products</option><option value="">Over The Counter Products</option></optgroup></select> -->
    
    <div>
        <div class="container">                           
                    <div>
                    <!-- First Table -->
                        <table id="Inventory" class="pretty"">
                            <thead>
      <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Generic Name</th>
                    <th>Registration No</th>
                    <th>Product Image(s)</th>
                    <th>Product Strength</th>
                    <th>Product Form</th>
                    <th>Product Packaging</th>
                    <th>Manufacturer</th>
                    <th>Origin</th>
                    <th><br><strong>Product Description</strong><br></th>
                    <th><br><strong>IsRxProduct</strong><br></th>
                    <th>Maximum Per Order</th>
                    <th>Functions</th>
                </tr>
		</thead>
    
    
    
    <tbody>
    	<tr>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label>&nbsp;</td>
                    <td><label>Label</label></td>
                    <td><input type="file" name="ProductImage"></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td>Cell 12<input type="number"></td>
                    <td><button class="btn btn-primary" type="button">Delete</button><button class="btn btn-primary" type="button">Update</button></td>
                </tr>
	</tbody>
              </table>
                        <br>
                    </div>
      </div>
      </div>
    
    <div
        class="table-responsive">
        <table class="table">
            <thead>
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Generic Name</th>
                    <th>Registration No</th>
                    <th>Product Image(s)</th>
                    <th>Product Strength</th>
                    <th>Product Form</th>
                    <th>Product Packaging</th>
                    <th>Manufacturer</th>
                    <th>Origin</th>
                    <th><br><strong>Product Description</strong><br></th>
                    <th><br><strong>IsRxProduct</strong><br></th>
                    <th>Maximum Per Order</th>
                    <th>Functions</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label>&nbsp;</td>
                    <td><label>Label</label></td>
                    <td><input type="file" name="ProductImage"><input type="file" name="ProductImage"><input type="file" name="ProductImage"></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td>Cell 12<input type="number"></td>
                    <td><button class="btn btn-primary" type="button">Delete</button><button class="btn btn-primary" type="button">Update</button></td>
                </tr>
                <tr>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label> </td>
                    <td><label>Label</label></td>
                    <td><input type="file" name="ProductImage"><input type="file" name="ProductImage"><input type="file" name="ProductImage"></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td><label>Label</label></td>
                    <td>Cell 12<input type="number"></td>
                    <td><button class="btn btn-primary" type="button">Delete</button><button class="btn btn-primary" type="button">Update</button></td>
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
        <form action="ManageInventoryController" method="post">
            <h2 class="text-center"><strong>Add Product</strong></h2>
            <div class="alert alert-info" role="alert"><span style="color:#000000;font-size:14px;"><strong>Select from the dropdown the Product ID to &nbsp;</strong></span>
                <div class="alert alert-success" role="alert"><span><strong>UPDATE a preexisting record</strong></span></div>
            </div>
            <div class="alert alert-info" role="alert"><span style="color:#000000;font-size:14px;"><strong>Enter the a products details to &nbsp;</strong></span>
                <div class="alert alert-danger" role="alert"><span><strong>CREATE/INSERT a new record</strong></span></div>
            </div>
            <div class="form-row" style="padding:5px;">
                <div class="col"><select class="form-control" name="ProductID" required="" style="width:349px;"><optgroup label="This is a group"><option value="12" selected="">Product ID</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select></div>
            </div>
            <div class="form-row" style="padding:5px;">
                <div class="col"><input class="form-control" type="text" name="PName" required="" placeholder="Product Name" style="width:350px;"></div>
                <div class="col"><input class="form-control" type="text" name="GName" required="" placeholder="Generic Name" style="width:350px;"></div>
            </div>
            <div class="form-row" style="padding:5px;">
                <div class="col"><input class="form-control" type="text" name="PStrength" required="" placeholder="Product Strength" style="width:350px;"></div>
                <div class="col"><input class="form-control" type="text" name="PForm" required="" placeholder="Product Form" style="width:350px;"></div>
            </div>
            <div class="form-row" style="padding:5px;">
                <div class="col"><input class="form-control" type="text" name="PPackaging" required="" placeholder="Product Packaging" style="width:350px;"></div>
                <div class="col"><input class="form-control" type="text" name="Manufacturer" required="" placeholder="Manufacturer" style="width:350px;"></div>
            </div>
            <div class="form-row" style="padding:5px;">
                <div class="col"><input class="form-control" type="text" name="POrigin" required="" placeholder="Product Origin" style="width:350px;"></div>
            </div>
            <div class="form-row">
                <div class="col" style="padding:5px;"><textarea class="form-control" name="ProductDescription" required="" placeholder="Product Description" style="width:350px;"></textarea></div>
            </div>
            <div class="form-row" style="padding:5px;">
                <div class="col"><select class="form-control" required="" style="width:350px;"><optgroup label="This is a group"><option value="12" selected="">Prescription (RX Required)</option><option value="13">Over the counter</option><option value="14">This is item 3</option></optgroup></select></div>
            </div>
            <div class="form-row" style="padding:5px;">
                <div class="col"><select class="form-control" required="" style="width:350px;"><optgroup label="This is a group"><option value="12" selected="">Pharmacy  /  Distrubutor</option><option value="13">This is item 2</option><option value="14">This is item 3</option></optgroup></select></div>
            </div>
            <div class="form-row" style="padding:5px;">
                <div class="col">
                    <div class="alert alert-danger" role="alert"><span style="color:#eb3b60;font-size:15px;"><strong>if Pharmacy is not in the list above please input the pharmacy name below&nbsp;</strong></span></div>
                </div>
            </div>
            <div class="form-row" style="padding:5px;">
                <div class="col"><input class="form-control" type="text" name="Pharmacy" required="" placeholder="Pharmacy" style="width:350px;"></div>
            </div>
            <div class="form-row" style="padding:5px;">
                <div class="col">
                    <div class="alert alert-danger" role="alert"><span style="color:#eb3b60;font-size:15px;"><strong>(1) Product Image must be Provided</strong></span></div>
                </div>
            </div>
            <div class="form-row" style="padding:5px;">
                <div class="col"><input class="visible" type="file" accept="image/*" name="ProductImage" required=""></div>
            </div>
            <div class="form-row" style="padding:5px;">
                <div class="col"><button class="btn btn-primary btn-block" type="submit" style="background-color:#184e8e;font-size:20px;">Add Product</button><button class="btn btn-primary btn-block" type="submit" style="background-color:#184e8e;font-size:20px;">Update Item</button></div>
                <div
                    class="col"></div>
            <div class="col">
                <h2 class="text-center"><strong>Manage Stock</strong></h2>
            </div>
            <div class="col"><select class="form-control"><optgroup label="This is a group"><option value="12" selected="">Filter</option><option value="13">Stock ID</option><option value="14">Product ID</option><option value="">BranchID</option></optgroup></select></div>
            <div
                class="col">
                <div class="table-responsive">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>Stock ID</th>
                                <th>Product ID</th>
                                <th>Product Name</th>
                                <th>Branch ID</th>
                                <th>Branch Name</th>
                                <th>Quantity /Current Supply</th>
                                <th>Front page Featured</th>
                                <th>Set Supply Status</th>
                                <th>Function</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><label>Label</label></td>
                                <td><label>Label</label></td>
                                <td><label>Label</label></td>
                                <td><label>Label</label></td>
                                <td>Cell 5</td>
                                <td><label>Label</label></td>
                                <td><label></label><select class="form-control" name="FeaturedStatus"><optgroup label="This is a group"><option value="12" selected="">Unset</option><option value="13">Set as Featured</option><option value="14">This is item 3</option></optgroup></select></td>
                                <td><label></label><select class="form-control" name="SupplyStatus"><optgroup label="This is a group"><option value="12" selected="">Available</option><option value="13">Unavailable</option><option value="14">This is item 3</option></optgroup></select></td>
                                <td><button class="btn btn-primary" type="button">Delete</button><button class="btn btn-primary" type="submit">Update</button></td>
                            </tr>
                            <tr>
                                <td><label>Label</label></td>
                                <td><label>Label</label></td>
                                <td><label>Label</label></td>
                                <td><label>Label</label></td>
                                <td>Cell 5</td>
                                <td><label>Label</label></td>
                                <td><label></label><select class="form-control" name="FeaturedStatus"><optgroup label="This is a group"><option value="12" selected="">Unset</option><option value="13">Set as Featured</option><option value="14">This is item 3</option></optgroup></select></td>
                                <td><label></label><select class="form-control" name="SupplyStatus"><optgroup label="This is a group"><option value="12" selected="">Available</option><option value="13">Unavailable</option><option value="14">This is item 3</option></optgroup></select></td>
                                <td><button class="btn btn-primary" type="button">Delete</button><button class="btn btn-primary" type="submit">Update</button></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                </div>
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
            $("#Inventory").dataTable({
                "sPaginationType": "full_numbers",
                "bJQueryUI": true, "sScrollX": "100%",
                "bScrollCollapse": true
            });
        });
        </script>
</body>

</html>