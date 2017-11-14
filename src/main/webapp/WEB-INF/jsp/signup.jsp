<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Social Network</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/styles.css">
<style>
	btn {
	background-color = "blue";
	}
</style>
</head>
<body>
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
		<a class="navbar-brand" href="/">⃝ MyCircle</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">
			<ul class="nav navbar-nav">
				<li class="active"><a href="/">Home</a></li>
				<li><a class="glyphicon glyphicon-log-in" href="/login"> Login</a></li>
				<li><a class="glyphicon glyphicon-user" href="/signup"> Sign Up</a></li>			
			</ul>
		  </div><!-- /.nav collapse -->
		</div>
		</nav>
    <div class="container">
      <form:form class="form-signin" modelAttribute="userSignup" method="POST" action="signup">
        <form:label path="firstName">First Name</form:label>
        <form:input type="text" class="form-control" placeholder="Enter your first name here" required="true" path="firstName"></form:input>
        <form:label path="lastName"	>Last Name</form:label>
        <form:input type="text" class="form-control" placeholder="Enter your last name here" required="true" path="lastName"></form:input>
        <form:label path="age">Your Current Age</form:label>
        <form:input type="number" class="form-control" placeholder="Current age" required="true" path="age"></form:input>
        <form:label path="email">Email address</form:label>
        <form:input type="email" class="form-control" placeholder="Your e-mail address is your User ID" required="true" path="email"></form:input>
        <form:label path="password">Password</form:label>
        <form:input type="password" class="form-control" placeholder="Password" required="true" path="password"></form:input>

        <button class="btn btn-lg btn-primary btn-block" type="submit">Sign Up</button>
      </form:form>
            
	</div><!-- /.container -->
	<br><br><br><br><br><br><br>
    </body>
</html>