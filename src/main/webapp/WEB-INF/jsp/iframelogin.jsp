<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html >
  <head>
	<meta charset="UTF-8">
	<title>Login / Sign Up</title>
  	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:400,300'>
	<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
	<link rel="stylesheet" href="css/loginstyles.css">
	<base target="_top">
  </head>
<body>
<div class="cotn_principal">
  <div class="cont_centrar">
  <h3 class="logintext"><a href="/">Home</a></h3>
  
  <c:if test="${not empty message}">
  	<h2 class="logintext"><c:out value="${message}"></c:out></h2>
  	<!-- <applet alt="Sign Up successful! You may now login.">Sign Up successful! You may now login.</applet> -->
  </c:if>
  	
	<div class="cont_login">
	  <div class="cont_info_log_sign_up">
		<div class="col_md_login">
		  <div class="cont_ba_opcitiy">
		  	<h2>LOGIN</h2>  
  		  	<p>Welcome Back to <font style="font-family:Segoe Print">MySchool</font>!</p> 
  		  	<button class="btn_login" onclick="cambiar_login()">LOGIN</button>
  		  </div>
  	    </div>
		<div class="col_md_sign_up">
  	  	  <div class="cont_ba_opcitiy">
  			<h2>SIGN UP</h2>
			<p>New to <font style="font-family:Segoe Print">MySchool</font>? Let's get started!</p>
	  		<button class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
	  	  </div>
  		</div>
  	  </div>
<!------------------------------------------------------------------------------------------------------------>  
	  <div class="cont_back_info">
      	<div class="cont_img_back_grey">
       	<img src="img\images\MySchoolLanding.jpg" alt="" />
       	</div>
      </div>
	  <div class="cont_forms" >
    	<div class="cont_img_back_">
       	<img src="img\images\MySchoolLanding.jpg" alt="" />
       	</div>
<!-- ************************************ LOGIN FORM ************************************ -->   			
 	  	<div class="cont_form_login">
			<a href="#" onclick="ocultar_login_sign_up()" ><i class="material-icons">&#xE5C4;</i></a>
   			<h2>LOGIN</h2>
   			<form:form class="form-signin" modelAttribute="userLogin" method="POST" action="login">
 			<form:input type="text" placeholder="Username" path="username" required="required" class="bigbox" />
			<form:password path="password" required="required" placeholder="Password" class="bigbox"/>
			<button type="submit" class="btn_login" onclick="cambiar_login()">LOGIN</button>
			</form:form>
  		</div>
<!-- ************************************ SIGNUP FORM ************************************ -->     		
		<div class="cont_form_sign_up">
			<a href="#" onclick="ocultar_login_sign_up()"><i class="material-icons">&#xE5C4;</i></a>
     		<h2>SIGN UP</h2>     		
     		<form:form class="form-signin" modelAttribute="userLogin" method="POST" action="signup">
			<form:input type="text" placeholder="Choose A Username" path="username" class="bigbox" required="required" />
			<form:input type="text" placeholder="First Name" class="shortbox" path="firstName" required="required" />
			<form:input type="text" placeholder="M.I." class="tinybox" path="middleInitial" />
			<form:input type="text" placeholder="Last Name" path="lastName" class="bigbox" required="required" />
			<form:input type="text" placeholder="Street Address" path="street" class="bigbox" />
			<form:input type="text" placeholder="City" class="shortbox" path="city" />
			<form:input list="states" name="states"  class="tinybox" placeholder="State" path="state" />
				<datalist id="states">
					<option value="AL"><option value="AK"><option value="AZ"><option value="AR"><option value="CA">
					<option value="CO"><option value="CT"><option value="DE"><option value="FL"><option value="GA">
					<option value="HI"><option value="ID"><option value="IL"><option value="IN"><option value="IA">
					<option value="KS"><option value="KY"><option value="LA"><option value="ME"><option value="MD">
					<option value="MA"><option value="MI"><option value="MN"><option value="MS"><option value="MO">
					<option value="MT"><option value="NE"><option value="NV"><option value="NH"><option value="NJ">
					<option value="NM"><option value="NY"><option value="NC"><option value="ND"><option value="OH">
					<option value="OK"><option value="OR"><option value="PA"><option value="RI"><option value="SC">
					<option value="SD"><option value="TN"><option value="TX"><option value="UT"><option value="VT">
					<option value="VA"><option value="WA"><option value="WV"><option value="WI"><option value="WY">
					<option value="PR"><option value="GU"><option value="VI">
				</datalist>
			<form:input type="text" placeholder="Zip Code" path="zipCode" class="bigbox" />
			<form:input type="email" placeholder="Email address" path="email" class="bigbox" />
			<form:input type="password" placeholder="Password" path="password" required="required" class="bigbox" />
			<input type="password" placeholder="Confirm Password" required class="bigbox">
			<form:input list="roles" id="role" name="role" placeholder="Choose your role from the list" path="role" class="bigbox" />
			  <datalist id="roles">
			  	<option value="Admin"><option value="Teacher"><option value="Parent"><option value="Student">
			  </datalist>
<%--  			<form:input list="levels" id="level" name="level" path="level" placeholder="Choose from the list" class="bigbox"  />
			  <datalist id="levels">
			  	<option value="Pre-K"><option value="Kindergarten"><option value="First Grade"><option value="Second Grade">
			  	<option value="Third Grade"><option value="Fourth Grade"><option value="Fifth Grade"><option value="Sixth Grade">
			  	<option value="Seventh Grade"><option value="Eigth Grade"><option value="Ninth Grade"><option value="Tenth Grade">
			  	<option value="Eleventh Grade"><option value="Twelfth Grade"><option value="College / University">
			  </datalist>
 --%>			<br><br><button type="submit" class="btn_sign_up" onclick="cambiar_sign_up()">SIGN UP</button>
			<center>
			  Parents will enter student information<br> on the next page.
			</center>
			</form:form>
		  </div>
		</div>
	  </div>
	</div>
  </div>
  
  <script  src="/js/index.js"></script>

</body>
</html>