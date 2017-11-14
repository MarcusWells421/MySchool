<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>MySchool</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/styles.css">
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ul/1.12.1/jquery-ui.js"></script>
  <script>
  $(function() {
	  $("#datepicker").datepicker();
  });
  </script>
  <style>
  	#navtxt {font-size: 16pt;}
  	#quiztxt {text-align: left;}
  	.popbutton {
  		font-size: 12pt;
  		font-weight: bold;
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
	  
	  <div class="container home-container">
	    <div class="container text-center">
	  	  <div class="row">
	  	  	<div class="col-sm-3 well">

			   <h3><c:out value="Welcome ${loggedInUser.firstName}" /></h3>
	  	  	   <div class="well">
	  	  	   <h3><i>Download Center</i></h3>
	  	  	    <c:forEach var="myFile" items="${fileList}">
	  	  	    	<a href="/download?fileId=${myFile.fileid}">${myFile.filename}</a><br>
	  	  	    </c:forEach>
	  	  	   </div>

					<c:if test="${loggedInUser.role == 'Teacher'}">
						<div class="well">
							<h3>
								<i>Send Quiz</i>
							</h3>
							<c:forEach items="${quizNames}" var="qname">
								<a href="takeQuiz?quizName=${qname}">${qname}</a><br>						
							</c:forEach>
							<h6>*${quizAdded}</h6>  					
						</div>
					</c:if>

					<div class="well">
<%-- 	  	  	  	<p><c:out value="Welcome ${loggedInUser.firstName}" /></p>
				<img src="${loggedInUser.profilePic}" class="img-circle" height="65" width="65" alt="Avatar"> --%>	  	  	  		
	  	  	  	<h3><i>Upload Center</i></h3>
	  	  	  	<form method="POST" action="/upload" enctype="multipart/form-data">
	  	  	  		<input type="file" name="file" /><br>
	  	  	  		<center>
	  	  	  		<input type="submit" value="Upload File" />
	  	  	  		</center>
	  	  	  	</form>
	  	  	  </div>

	  	  	  <div class="well">
	  	  	  	<p>Be Social</p>
<!-- ******************FACEBOOK******************* -->
	  	  	  	<p><a href="#">Facebook  <font class="invisible">---</font></a>
	  	  	  	<iframe src="https://www.facebook.com/plugins/like.php?href=https%3A%2F%2Fdevelopers.facebook.com%2Fdocs%2Fplugins%2F&width=122&layout=button&action=like&size=large&show_faces=true&share=true&height=65&appId"
	  	  	  	width="122" height="30px" style="border:none;overflow:hidden" scrolling="no" frameborder="0" allowTransparency="true"></iframe></p>
<!-- ******************LINKEDIN******************* -->
		  	  	<p><a href="https://www.linkedin.com/">LinkedIn</a><font class="invisible">---</font>
		  	  	<script src="//platform.linkedin.com/in.js" type="text/javascript"> lang: en_US</script>
				<script type="IN/Share"></script></p>
<!-- ******************TWITTER******************* -->
		  	  	<p><a href="https://twitter.com/?lang=en">Twitter</a><font class="invisible">---</font>
		  	  	<a href="https://twitter.com/share?ref_src=twsrc%5Etfw" class="twitter-share-button" data-show-count="false">Tweet</a><script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script></p>
<!-- ******************GOOGLE******************* -->
	  		  	<p><a href="https://mail.google.com">Google</a><font class="invisible">---</font>
	  		  	  <script src="https://apis.google.com/js/platform.js" async defer></script>
  				  <g:plusone>Google +</g:plusone></p>
	  	  	  </div>
	  	  </div>
	  	  <div class="col-sm-7">
	  	    <div class="row">
	  	      <div class="col-sm-12">
	  	      	  <c:if test="${loggedInUser.role == 'Parent'}">
	  	      	    <h3>Schedule A Meeting with your student's teacher</h3>
<!-- 	  	      	    <h6>*Meeting is not scheduled until confirmed by your teacher</h6>
  					<p>  Teacher you'd like to meet with --> </c:if>

	  	      	  <c:if test="${loggedInUser.role == 'Teacher'}">
	  	      	    <h3>Schedule A Meeting with your student's parent</h3>
<!-- 	  	      	    <h6>*Meeting is not scheduled until confirmed by the parent</h6>
  					<p>  Parent you'd like to meet with --> </c:if>

	  	      	  <c:if test="${loggedInUser.role == 'Teacher' || loggedInUser.role == 'Parent'}">
<%--   					<input type="text" id="apptTeacher" name="apptTeacher"></p>
  					<p>  Propose An Appointment Date <input type="date" id="datepicker" name="apptDate">
  					  Time <input type="time" id="appttime" name="apptTime"></p>
  					  
      				<form:input type="text" class="form-control" path="message" placeholder="Please include any comments you'd like to send about the appointment" />
      			  <span class="input-group-btn">
      				<button class="btn btn-lg" type="submit" style="background-color: blue"><font color="white" >Confirm</font></button>
      			  </span>
 --%>
	  	      	  <br><iframe src="https://calendar.google.com/calendar/embed?title=Mr.%20Wells%27s%20Calendar&amp;showPrint=0&amp;showCalendars=0&amp;height=540&amp;wkst=1&amp;hl=en&amp;bgcolor=%239999ff&amp;src=en.usa%23holiday%40group.v.calendar.google.com&amp;color=%23125A12&amp;src=2ev6pqlfm39mr15bj4uc3tf4as%40group.calendar.google.com&amp;color=%23182C57&amp;ctz=America%2FChicago" style="border:solid 1px #777" width="95%" height="400" frameborder="0" scrolling="no"></iframe>

				  <br>
				  </c:if>
<%-- 	  	      	    <form:form method="POST" modelAttribute="post" action="post">
					<p class="text-left" ><strong>Comments</strong>
	  	      	    <form:input type="text" path="message" class="form-control" placeholder="Status: What's on your mind?"></form:input>
					<form:input type="hidden" path="username" value="${loggedInUser.username}" class="form-control"></form:input>
	  	      	    <br>
	  	      	    <button type="submit" class="popbutton" style="font-size: 14px">
	  	      	    <span class="glyphicon"></span><b>Send Comments</b></button>
					<form:textarea rows="10" cols="90" path="message"></form:textarea></p>
	  	      	    <br><br>
	  	      	    </form:form>
 --%>
<!-- ************************************** CHAT ************************************ -->
<!-- 	  	      	    <iframe src="http://deadsimplechat.com/+REcJw" width="97%" height="400px"  style="border:solid 1px #777" frameborder="0"></iframe>
	  	      	  	<br><br><br>
 -->
 				 <c:if test="${loggedInUser.role == 'Student'}">
 				 <h6>${quizMailed}</h6>
 				 </c:if>
 				 <c:if test="${loggedInUser.role == 'Student' && questions != null}">
 				  
 				 <div class="quiztxt" id="quiztxt">
 				 <img src="/img/Warning-icon.png" style="position: absolute; left: 105px; top: 10px" height="40" width="45"/><center><h3>A Quiz has been assigned to you!</h3></center><br>
				 <div class="well" id="quiztxt">				 	
 				 <h5><strong>Select one answer for each question. Click the submit button to turn in your quiz.</strong></h5><br>
	  	      	  		<c:set var="qnum" value="1" scope="page" />
	  	      	  		<c:forEach items="${questions}" var="q" varStatus="loop">
	  	      	  			<h5><strong><c:out value="${qnum}" />) ${q.question}</strong></h5>
	  	      	  			<div class="radio">
	  	      	  				<label><input type="radio" value="${q.option1}" name="quizoption${loop.index}" />${q.option1}</label>
	  	      	  			</div>
	  	      	  			<div class="radio">
	  	      	  				<label><input type="radio" value="${q.option2}" name="quizoption${loop.index}" />${q.option2}</label>
							</div>
	  	      	  			<div class="radio">
	  	      	  				<label><input type="radio" value="${q.option3}" name="quizoption${loop.index}" />${q.option3}</label>
							</div>
	  	      	  			<div class="radio">
	  	      	  				<label><input type="radio" value="${q.option4}" name="quizoption${loop.index}" />${q.option4}</label>
	  	      	  			</div>
	  	      	  				<br>
	  	      	  			<c:set var="qnum" value="${qnum + 1}" scope="page"/>
	  	      	  		</c:forEach>
	  	      	  	<center>
					<button class="popbutton" onclick="score()" >Submit Quiz</button>
					</center>
					</div>
				</div>		
				
					</c:if>
 
 
 
	  	      	  <c:if test="${loggedInUser.role == 'Student'}">
	  	      	  <h3>Initiate a chat with your teacher (if online)</h3>
	  	      	  </c:if>
<!-- ***************************** CHAT ***************************** -->
	  	      	  <c:if test="${loggedInUser.role == 'Student'}">
					<div id="tlkio" data-channel="MySchool" data-theme="theme--day" style="width:95%;height:300px;"></div>
					<script async src="http://tlk.io/embed.js" type="text/javascript"></script> 
	  	      	  </c:if>
<!-- **************************************************************** -->

<!-- <br><br>
<div style="padding-right:100px">
<iframe src="http://deadsimplechat.com/aH6y5" height="300" width="90%"></iframe>
</div>
 	  	      	  	<br><br><br>

<iframe src="http://deadsimplechat.com/+PJLIM" frameborder="0" width="800px" height="600px"></iframe> -->
	  	      	  	<br><br><br>


 
	  	      	  
	  	      	<div class="panel panel-default text-left">
	  	      	  <div class="panel-body">
	  	      	    <form:form method="POST" modelAttribute="post" action="post">
	  	      	    <form:input type="text" path="message" class="form-control" placeholder="Status: What's on your mind?"></form:input>
	  	      	    <form:input type="hidden" path="username" value="${loggedInUser.username}" class="form-control"></form:input>
	  	      	    <!-- <p contenteditable="true">Status: What's on your mind?</p> -->
	  	      	    <br>
	  	      	    <button type="submit" class="btn btn-default btn-sm">
	  	      	      <span class="glyphicon"></span>Post</button>	
	  	      	    </form:form>
	  	      	  </div>
	  	      	</div>
	  	      </div>
	  	    </div>
	  	    <c:forEach var="post" items="${posts}">
	  	    <div class="row">
	  	      <div class="col-sm-3">
	  	        <div class="well">
	  	          <p><c:out value="${post.person.firstName}" /></p>
	  	          <%-- <img src="${post.person.profilePic}" class="img-circle" height="55" width="55" alt="Avatar"> --%>
	  	        </div>
	  	      </div>
	  	      <div class="col-sm-9">
	  	        <div class="well">
	  	          <p><c:out value="${post.message}" /></p>
	  	        </div>
	  	        <button type="button" class-"btn btn-default btn-sm><span class="glyphicon glyphicon-thumbs-up"></span>Like</button>
	  	      </div>
	  	    </div>
	  	    </c:forEach>
	  	  </div>
		<div class="col-sm-2 well">
		  <div class="thumbnail">
		    <h3><i>Upcoming Events</i></h3>
	  	  	    <c:forEach  var="events" items="${eventList}">
	  	  	    	<h4>${events.eventName}</h4>
	  	  	    	<img src="${events.eventPicPath}" width="100%" height="100%" />
	  	  	    	<h5>${events.eventDate}</h5>
	  	  	    	${events.eventLocation}
	  	  	    	<hr class="hr">
	  	  	    </c:forEach>
		  </div>
		  <!-- <div class="well"> -->
		  <div>
		    <a href="https://www.target.com/c/school-office-supplies/-/N-5xsxr#?lnk=snav_rd_school_supplies" target="_blank"><img alt="Target Advertisement" src="/img/Target-Ad.jpg" width="100%" height="120%"></a>
		  </div>
		  <!-- <div class="well"> -->
		  <br>
		  <div>
		    <a href="https://www.walmart.com/cp/back-to-school/1071204" target="_blank"><img alt="Walmart Advertisement" src="/img/Walmart-Ad.jpg" width="100%" height="120%"></a>
		  </div>
		</div>
	  </div>
	  </div>
	  
	  
	  <script type="text/javascript">
	  $(document).ready(function(){
		  alert("READY!!!");
	 });
	  
	  
	  
	  
	  	function score()
	  	{
	  		
	  		var q1 = $('input[name=quizoption0]:checked').val();
	  		var q2 = $('input[name=quizoption1]:checked').val();
	  		var q3 = $('input[name=quizoption2]:checked').val();
	  		var q4 = $('input[name=quizoption3]:checked').val();
	  		var q5 = $('input[name=quizoption4]:checked').val();
	  		
	  		var myResult =0;
	  		if(q1 == 'Thomas Jefferson')
	  			{
	  			myResult += 20;	
	  			}
	  		if(q2 == '1776'){
	  			myResult += 20;	
	  		}
	  		if(q3 == 'Philadelphia'){
	  			myResult += 20;	
	  		}
	  		if(q4 == 'Paul Revere'){
	  			myResult += 20;	}
	  		if(q5 == 'George Washington'){
	  			myResult += 20;	
	  		}
	  		
	  		
	  		
	  		$.ajax({
	  			type:"POST",
	  			url:"showScore?myResult="+myResult,
	  			sucess:function(result){
	  				alert("success");
	  			},
	  			error:function(result){}
	  			
	  		});
	  		
	  		
	  		alert("Your score is: "+myResult);
	  		$('#quiztxt').hide();
	  	}
	  
	  </script>
	  
	  
	  
	  
	  
	  
	  

</body>
</html>