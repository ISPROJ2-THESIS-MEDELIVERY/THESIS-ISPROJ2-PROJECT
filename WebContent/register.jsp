<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="RegistrationController" method="post" enctype="multipart/form-data">
        
    <div class="image-holder" style="background-image:url(&quot;assets/img/Medicine.jpg&quot;);width:501px;margin:18px;height:560px;"></div>
        <h2 class="text-center"><strong>Create</strong> an account.</h2>
        <div class="form-group">
            <div class="alert alert-danger" role="alert"><span style="color:#eb3b60;"><strong>* Required Fields</strong></span></div>
            <input class="form-control" type="text" name="FullName" required="" placeholder="FullName *">
            <input class="form-control" type="text" name="Username" required="" placeholder="Username *">
            <input class="form-control" type="text" name="CAddress" required="" placeholder="Address *">
            <input class="form-control" type="email" name="CusEmail" required="" placeholder="Email *">
            <input class="form-control" type="number" name="ContactNumber" required="" placeholder="Contact Number *">
            </div>
        
        <input class="form-control" type="password" name="Password" required="" placeholder="Create Password">
        <input class="form-control" type="password" name="Password-repeat" required="" placeholder="Re-enter Password" style="margin:0px;">
        
        <h2>Form control: inline radio buttons</h2>
          <p>Please Select:</p>
            <label class="radio-inline">
              <input type="radio" name="seniorbool" value="weaponizingoldmen"> Senior/PWD Discount
            </label>            
        
        <div class="alert alert-danger" role="alert"><span style="color:#eb3b60;font-size:15px;"><strong>Please Upload a Photo of your Senior Citizen ID/ PWD ID&nbsp;</strong></span></div><input class="visible" type="file" id="Photo" name="Photo">
        <input class="form-control" type="text" name="SeniorCitizenID" placeholder="Senior Citizen ID">                
	
	
	
    <div class="form-check"><label class="form-check-label" style="margin:20px;font-size:20px;"><input class="form-check-input" type="checkbox">I agree to the license terms.</label></div>
    
    <!--  <div class="g-recaptcha" data-sitekey="6Ld-CHAUAAAAAA5oeWgfBIU2xWrCFitjhWtN_QLP"></div> -->

	<div class="form-group"><button class="btn btn-primary btn-block" type="submit" style="background-color:#56c5ff;">Sign Up</button></div><a href="#" class="already" style="color:#282d32;font-size:20px;">Already have an account? Login here.</a>

</form>
</body>
</html>