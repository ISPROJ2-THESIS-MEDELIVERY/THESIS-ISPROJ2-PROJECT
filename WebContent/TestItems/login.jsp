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
</head>
<body>
	<div class="login-clean">
	<form action="LoginController" method="post">
		<c:if test="${RetryLogin != null}">
			Failed Login Attempts: <c:out value="${LoginTry}" /><br>
			Only 5 attempts are allowed
		</c:if>
		<h2 class="sr-only">Login Form</h2>
        <div class="form-group">
        	<input type="text" name="Username" placeholder="Username" class="form-control" maxlength="25"/>
        </div>
        <div class="form-group">
        	<input type="password" name="Password" placeholder="Password" class="form-control" maxlength="25"/>
        </div>
        <div class="form-group">
            <button class="btn btn-primary btn-block" type="submit">Log In</button>
        </div>
		<!--  <fieldset>
			<div align="center">
				<label for="Username">Username</label><br />
				<input type="text" name="Username" placeholder="Username" maxlength="25"/>
			</div>&nbsp;
			<div align="center">
				<label for="Password">Password</label><br />
				<input type="text" name="Password" placeholder="Password" maxlength="25"/>
			</div>&nbsp;
			<div align="center">
				<input type="submit" value="Submit" />
			</div>
		</fieldset>  -->
	</form>
	</div>
</body>
</html>