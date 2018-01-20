<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link rel="stylesheet" href="css/core.css" type="text/css">

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<link rel="stylesheet" href="css/signup.css" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Sign Up</title>
</head>
<body>
<div class="container">
    <div class="col-md-12">
    <div id="logbox">
      <form id="signup" method="post" action="/signup">
        <h1>create an account</h1>
        <input name="user[name]" type="text" placeholder="What's your username?" pattern="^[\w]{3,16}$" autofocus="autofocus" required="required" class="input pass"/>
        <input name="user[password]" type="password" placeholder="Choose a password" required="required" class="input pass"/>
        <input name="user[password2]" type="password" placeholder="Confirm password" required="required" class="input pass"/>
        <input name="user[email]" type="email" placeholder="Email address" class="input pass"/>
        <input type="submit" value="Sign me up!" class="inputButton"/>
        <div class="text-center">
            already have an account? <a href="http://localhost:8080/THESIS-ISPROJ2-PROJECT/login.jsp" id="login_id">login</a>
        </div>
      </form>
    </div>
   </div>
   </div>
    <!--col-md-6-->
</body>
</html>