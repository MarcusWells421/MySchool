<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Student Information</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/styles.css">
<style>
input[type=text], input[type=email], input[type=password]{
    position: relative;
    width: 480px;
    color: white;
    box-sizing: border-box;
    border: 2px solid #333399;
    border-radius: 2px;
    font-size: 24px;
    background-color: rgba(0,0,128,.25);
    background-position: 5px 5px;
    background-repeat: no-repeat;
    padding: 5px 12px 9px 16px;
    margin-bottom: 10px;
    margin-left: 18px;
    -webkit-transition: width 0.4s ease-in-out;
    transition: width 0.4s ease-in-out;
}

input[type=text]:focus, input[type=email]:focus, input[type=password]:focus {
    width: 82%;
    border: 2px solid white;
}

.tinybox {
	width: 85px !important;
	float: relative;
	padding: 5px 12px 4px 15px !important;
}
.tinybox:focus {
    border: 2px solid white;
}
.smallbox {
	width: 300px !important;
	float: relative;
	padding: 5px 12px 4px 15px !important;
}
.smallbox:focus {
    border: 2px solid white;
}
.longbox {
	width: 82% !important;
	float: relative;
	padding: 5px 12px 4px 15px !important;
}
.longbox:focus {
    border: 2px solid white;
}

.popbutton {
  	font-size: 12pt;
  	font-weight: normal;
}
#navtxt {font-size: 16pt;}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
</head>
<body class="gradientbg">
  <div>

	<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container">
		<div class="navbar-header">
		  <button type="button" class="navbar-toggle collapsed"
		  data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
		  <span class="sr-only">Toggle navigation</span>
		  <span class="icon-bar"></span>
		  <span class="icon-bar"></span>
		  <span class="icon-bar"></span>
		  </button>
		<a class="navbar-brand" href="/homebutton">MySchool</a>
		<img src="img\images\Apple.png" style="float:left" width="10%" height="11%" />
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav navbar-right">
				<li><a class="glyphicon glyphicon-home" href="/homebutton" id="navtxt"> Home</a></li>
				<li><a class="glyphicon glyphicon-cog" href="/signup" id="navtxt"> Settings</a></li>			
				<li><a class="glyphicon glyphicon-log-in" href="/" id="navtxt"> Log Out</a></li>
			</ul>
		  </div><!-- /.nav collapse -->
		</div>
	  </nav>
<!-- ************************************************************************************* -->	  
	  <div class="row">
	  	 <div class="col-md-4">
	  	 	<video src="/img/StudentInfo.mp4" height="100%" width="100%" autoplay loop muted />
	  	 </div>
	  	 <div class="col-md-8">
	  	   <input type="checkbox" class="pick1" name="pick1" value="1" onchange="valueChanged()" />
	  	   <span class="checkboxtext"><font class="invisible">--</font>My student has already enrolled in <font class="myschool">MySchool</font>!</span>
	  	  	
	  	 <div class="form1">
	  	 <form:form  modelAttribute="student">
	  	 	<br>
 	  	  	<form:input path="username" placeholder="Enter your student's MySchool Username Here" />
			<br><br>
			<center>
	  		<form:button type="submit" formaction="/addstudent" method="POST" modelAttribute="student" class="popbutton">Add Another Student</form:button><font class="invisible">------------------</font>
	  		<form:button type="submit" formaction="/parentsignupcomplete" method="POST" modelAttribute="student" class="popbutton">Complete the Sign Up process</form:button>
	  	    </center>
		 </form:form>	
		 </div>
 	  	  	<br><br>
	  	  	<input type="checkbox" class="pick2" name="pick2" onchange="valueChanged()" />
	  	  	<span class="checkboxtext"><font class="invisible">--</font>I will create a <font class="myschool">MySchool</font> account for my student now!</span>
	  	  	<br><br>


		<div class="form2">
	  	 <form:form modelAttribute="student">
			<form:input value="" path="username" placeholder="Select a Username" />
			<br>
			<form:input value="" path="firstName" class="smallbox" placeholder="First Name" />
			<form:input value="" path="middleInitial" class="tinybox" placeholder="M.I." />
			<form:input value="" path="lastName" class="smallbox" placeholder="Last Name" />
			<form:input value="" path="street" placeholder="Street Address" />
			<br>
			<form:input value="" path="city" class="smallbox" placeholder="City" />
			<form:input value="" path="state" class="tinybox" placeholder="State" />
			<form:input value="" path="zipCode" class="smallbox" placeholder="Zip Code" />
			<form:input id="hide1" value=" " type="email" path="email" placeholder="E-mail Address" />
			<br>
			<form:password id="hide2" path="password" placeholder="Password" value=" "/>
			<br>
			<form:input list="levels" id="level" name="level" path="level" placeholder="Please choose your student's grade level from the list" class="longbox" />
			  <datalist id="levels">
			  	<option value="Pre-K"><option value="Kindergarten"><option value="First Grade"><option value="Second Grade">
			  	<option value="Third Grade"><option value="Fourth Grade"><option value="Fifth Grade"><option value="Sixth Grade">
			  	<option value="Seventh Grade"><option value="Eigth Grade"><option value="Ninth Grade"><option value="Tenth Grade">
			  	<option value="Eleventh Grade"><option value="Twelfth Grade"><option value="College / University">
			  </datalist>
 			<center>
	  		<form:button type="submit" formaction="/addstudent" method="POST" modelAttribute="student" class="popbutton">Add Another Student</form:button><font class="invisible">------------------</font>
	  		<form:button type="submit" formaction="/parentsignupcomplete" method="POST" modelAttribute="student" class="popbutton">Complete the Sign Up process</form:button>
	  	    </center>
		</form:form>
		</div>
	  	  	<input type="checkbox" id="linkedAccounts" name="linkedAccounts" class="pick3" onchange="valueChanged()"/>
	  	  	<span class="checkboxtext"><font class="invisible">--</font>My student is neither enrolled with <font class="myschool">MySchool</font>, nor do I wish to create an account for the student.</span>
			<br><br>
			
		<div class="form3">
	  	<form:form modelAttribute="student">
			<form:input value="" path="firstName" class="smallbox" placeholder="First Name" />
			<form:input value="" path="middleInitial" class="tinybox" placeholder="M.I." />
			<form:input value="" path="lastName" class="smallbox" placeholder="Last Name" />
			<br>
			<form:input list="levels" id="level" name="level" path="level" placeholder="Please choose your student's grade level from the list" class="longbox" />
			  <datalist id="levels">
			  	<option value="Pre-K"><option value="Kindergarten"><option value="First Grade"><option value="Second Grade">
			  	<option value="Third Grade"><option value="Fourth Grade"><option value="Fifth Grade"><option value="Sixth Grade">
			  	<option value="Seventh Grade"><option value="Eigth Grade"><option value="Ninth Grade"><option value="Tenth Grade">
			  	<option value="Eleventh Grade"><option value="Twelfth Grade"><option value="College / University">
			  </datalist>
			<br><br>
			<center>
	  		<form:button type="submit" formaction="/addstudent" method="POST" modelAttribute="student" class="popbutton">Add Another Student</form:button><font class="invisible">------------------</font>
	  		<form:button type="submit" formaction="/parentsignupcomplete" method="POST" modelAttribute="student" class="popbutton">Complete the Sign Up process</form:button>
	  	    </center>
		 </form:form>
	  	 </div>
	  </div>
	  <br><br><br>
  </div>
  
<script type="text/javascript">
   
   $( document ).ready(function() {
	   $('.form1').hide();
   		$('.form2').hide();
   		$('.form3').hide();
});
   
   
function valueChanged()
{
	$('.form1').hide();
	$('.form2').hide();
	$('.form3').hide();
	 if($('.pick1').is(':checked'))   
	        $('.form1').show();
	 if($('.pick2').is(':checked'))
	        $('.form2').show();
	 if($('.pick3').is(':checked'))
	        $('.form3').show();
}
</script>

</body>
</html>