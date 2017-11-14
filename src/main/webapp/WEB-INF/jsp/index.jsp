<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>MySchool</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" href="assets/css/style.css" />
		<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/css?family=Open+Sans:400,300'>
		<link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>

	</head>
	<body id="top">

			<!-- Banner -->
			<!--
				To use a video as your background, set data-video to the name of your video without
				its extension (eg. images/banner). Your video must be available in both .mp4 and .webm
				formats to work correctly.
			-->
				
				<section id="banner" >
					<video src="img/images/MySchoolLanding.mp4" autoplay loop muted></video>
					<div class="inner">
						<header>
							<font style="color: #fff; font-size: 5em; font-weight: 400; font-family: 'Passion One', cursive; margin: 0;">Welcome to </font><font style="color: #fff; font-size:4.25em; font-weight:bold; font-family: Segoe Print !important" >MySchool</font>
							<img src="img\images\Apple.png" style="float:right" width="9%" height="10%" />
							<div class="#subtitle">
								<p><b>The key to a successful education is an open line of communication</b></p>
							</div>
						</header>
						<a href="#loginfram" class="more">Go To Login</a>
					</div>
				</section>
				
			<!-- Main -->
				<div id="main">
					<center>
					<h2>Our Mission</h2>
					<b>The purpose of MySchool is to open a direct line of communication between educators, students, and their parents/guardians. For younger students, extensive research shows that when parents are actively involved in the education of their children, the children perform exponentially better. For the college-age student, parental supervision may not be necessary, but open communication with your professors / instructors can become the key to your success. With MySchool's suite of communication and document tools, you can be more firmly in control of the progress of your own education. Are you ready to take control of your / your child's education?</b>
					<p id="thumbnails"><h2><a href="#loginfram" class="text-glow">Click HERE to Sign In to <font style="font-family: Segoe Print !important" >MySchool</font>.</a><font style="color: rgba(0,0,0,0) !important">------------</font>Not registered yet?<font style="color: rgba(0,0,0,0) !important">------------------------</font><a href="#loginfram" class="text-glow">Click HERE to Sign Up!</a></h2></p>
				
					</center>

					<div class="inner">

					<!-- Boxes -->
						<div class="thumbnails" id="thumbnails">

							<div class="box">
								<a href="#" class="image fit"><img src="img\images\TeacherSignIn.jpg" alt="" /></a>
								<div class="inner">
									<h3>I am an Educator</h3>
									<p>Shaping young minds that will shape the course of our world. Each and every day, you shape the future.</p>
									<div>
										<a href="#loginfram" class="button fit">Available Features</a>
									</div>
								</div>
							</div>

							<div class="box">
								<a href="#" class="image fit"><img src="img\images\ParentLogin.jpg" alt="" /></a>
								<div class="inner">
									<h3>I am a Parent or Guardian</h3>
									<p>You've decided to be an active part of your child's education. Good! Your child's success may depend upon it.</p>
									<a href="#loginfram" class="button style2 fit">Available Features</a>
								</div>
							</div>

							<div class="box">
								<a href="#" class="image fit"><img src="img\images\StudentLogin.jpg" alt="" /></a>
								<div class="inner">
									<h3>I am a Student</h3>
									<p>Education is more than school. It's an opportunity to grow and develop your mind and skills. You can achieve! You can succeed!</p>
									<a href="#loginfram" class="button style3 fit">Available Features</a>
								</div>
							</div>
						</div>
					</div>
				</div>

	<!------------------------------------------------------------------------------>
		<div><iframe id="loginfram" src="/iframe" width="700px" height="854px"></iframe></div>
	<!------------------------------------------------------------------------------>

			<!-- Footer -->
				<footer id="footer">
					<div class="inner">
						<ul class="icons">
							<li><a href="https://twitter.com/login" class="icon fa-twitter"><span class="label">Twitter</span></a></li>
							<li><a href="https://en-gb.facebook.com/login/" class="icon fa-facebook"><span class="label">Facebook</span></a></li>
							<li><a href="https://www.instagram.com/accounts/login/" class="icon fa-instagram"><span class="label">Instagram</span></a></li>
							<li><a href="mailto:IMakeComputerMagic@gmail.com?Subject=MySchool%20Question" class="icon fa-envelope"><span class="label">Email</span></a></li>
						</ul>
						<p class="copyright">&copy; 2017 MySchool / Capstone Project by Marcus Wells / Claim Academy Demo Day / 9 November 2017</p>
					</div>
				</footer>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.scrolly.min.js"></script>
			<script src="assets/js/jquery.poptrox.min.js"></script>
			<script src="assets/js/skel.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			<script  src="assets/js/index.js"></script>
			
	</body>
</html>