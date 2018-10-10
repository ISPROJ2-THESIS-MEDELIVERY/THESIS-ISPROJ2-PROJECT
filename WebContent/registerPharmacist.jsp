<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no" />
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
<link rel="stylesheet" href="assets/css/Login-Form-Clean.css" />
<link rel="stylesheet" href="assets/css/styles.css" />
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,700" />
<link rel="stylesheet" href="assets/css/Header-Blue.css" />
</head>
<body>
	 <div>
        <div class="header-blue">
            <nav class="navbar navbar-dark navbar-expand-md navigation-clean-search">
                <div class="container"><a href="home.jsp" class="navbar-brand">Medelivery</a>
                    <div class="collapse navbar-collapse" id="navcol-1">
                        <ul class="nav navbar-nav"></ul>
                        <form target="_self" class="form-inline mr-auto">
                            <div class="form-group"><label for="search-field"></label></div>
                        </form>
                        <c:if test="${userAccess == null}">
                        <span class="navbar-text"><a href="login.jsp" class="login">Log In</a></span>
                        <a class="btn btn-light action-button" role="button" href="register.jsp">Registration</a>
                        </c:if>
                    </div>
                </div>
            </nav>
        </div>
    </div>
    
    <div class="login-clean"> 
	<form action="RegistrationController" method="post" enctype="multipart/form-data">
		<div class="form-group">
        	<input type="text" name="Username" required="" placeholder="User Name *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="password" name="Password" required="" placeholder="Create Password" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="FistName" required="" placeholder="First Name *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="LastName" required="" placeholder="Last Name *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="PharNumb" required="" placeholder="PRC Number *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="PharPosi" required="" placeholder="Position *" class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="PharText" required="" value="<c:out value="${PharmacySelect.pharmacyName}" />" disabled class="form-control"/>
        </div>
        <div class="form-group">
        	<input type="text" name="PharEyeD" required="" value="<c:out value="${PharmacySelect.pharmacyID}"/> class="form-control"/>
        </div>
        <div class="form-group">
        	<select name="PharSele" class="form-control">
        		<c:forEach items="${PharmacyBranch}" var="branch">
					<option value =<c:out value="${branch.branchID}"/>>
						<c:out value="${branch.branchStreet}" /> - <c:out value="${branch.branchBarangay}" /> - <c:out value="${branch.branchProvince}" /> - <c:out value="${branch.branchOwner}" />
					</option>
				</c:forEach>
			</select>
        </div>
        <div class="form-group">
        	<input type="hidden" name="SecretCode" value="RjRILW7K7Xz96hD" class="form-control"/>
        </div>
        <div class="form-group">
            <button class="btn btn-primary btn-block" type="submit">Sign Up</button>
        </div>
        <a class="already" href="login.jsp">Back</a> 
		<%-- <input type="text" 		name="Username" 	required="" 	placeholder="User Name *"><br>
		<input type="password" 	name="Password" 	required="" 	placeholder="Create Password"><br>
		<hr>
		<input type="text" 		name="FistName" 	required="" 	placeholder="First Name *"><br>
		<input type="text" 		name="LastName" 	required="" 	placeholder="Last Name *"><br>
		<input type="text" 		name="PharNumb" 	required="" 	placeholder="PRC Number *"><br>
		<input type="text" 		name="PharPosi" 	required="" 	placeholder="Position *"><br>
		<input type="text" 		name="PharText" 	required="" 	value="<c:out value="${PharmacySelect.pharmacyName}" />" disabled><br>
		<input type="hidden"	name="PharEyeD" 	required=""		value="<c:out value="${PharmacySelect.pharmacyID}" />">
		<select name="PharSele">
			<c:forEach items="${PharmacyBranch}" var="branch">
				<option value =<c:out value="${branch.branchID}"/>>
					<c:out value="${branch.branchStreet}" /> - <c:out value="${branch.branchBarangay}" /> - <c:out value="${branch.branchProvince}" /> - <c:out value="${branch.branchOwner}" />
				</option>
			</c:forEach>
		</select>
		<hr>
		<input type="hidden"	name="SecretCode" 	value="RjRILW7K7Xz96hD">
		<button type="submit" 	style="background-color:#56c5ff;">Sign Up</button>
		<a href="index.jsp" class="already" style="color:#282d32;font-size:20px;">back</a> --%>
	</form>
	</div>
	
<footer class="footer text-center">
    <div class="container">
        <div class="row">
            <div class="col-md-4 mb-5 mb-lg-0">
                <h4 class="text-uppercase mb-4">Location</h4>
                <p></p>
            </div>
            <div class="col-md-4 mb-5 mb-lg-0">
                <h4 class="text-uppercase">Around the Web</h4>
                <ul class="list-inline">
                    <li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="#"><i class="fa fa-facebook fa-fw"></i></a></li>
                    <li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="#"><i class="fa fa-google-plus fa-fw"></i></a></li>
                    <li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="#"><i class="fa fa-twitter fa-fw"></i></a></li>
                    <li class="list-inline-item"><a class="btn btn-outline-light btn-social text-center rounded-circle" role="button" href="#"><i class="fa fa-dribbble fa-fw"></i></a></li>
                </ul>
            </div>
            <div class="col-md-4">
                <h4 class="text-uppercase mb-4">About medelivery</h4>
                <p class="lead mb-0"><span></span></p>
            </div>
        </div>
    </div>
</footer>
</body>
</html>