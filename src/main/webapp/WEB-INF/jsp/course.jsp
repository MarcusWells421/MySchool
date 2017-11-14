<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<title>Courses</title>
  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ul/1.12.1/jquery-ui.js"></script>
  <script>
  $(function() {
	  $("#datepicker").datepicker();
  });
  </script>
  <style type="text/css">

  .weekDays-selector input {
  display:none!important:
  }
  
  .weekDays-selector input[type=checkbox] + label {
  display: inline-block;
  border-radius: 6px;
  background: #dddddd;
  height: 40px;
  width: 30px;
  margin-right: 3px;
  line-height: 40px;
  text-align: center;
  cursor: pointer;
  }
  
  .weekDays-selector input[type=checkbox]:checked + label {
  background: #2AD705;
  color: #ffffff
  }

  .navbar-inverse {
     background-color: 	#F5F5DC;
     border-color: #000000;
  }

  .td style{width:800px;}
  
  </style>
  </head>
  
<body>

<nav class="navbar navbar-inverse navbar-fixed-top">
  <div class="container">
    <div class="navbar-header">
      <!-- button type="button" class="navbar toggle-collapsed" data-toggle="collapse"
      data-target="#navbar" aria-expanded="false" aria-controls="navbar">
      <span class="sr only">Toggle navigation</span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="#">Project name</a-->
    </div>
    <div id="navbar" class="collapse navbar-collapse">
      <ul class="list-inline">
        <li class="active"><a href="#">Home    </a></li>
        <li><a href="#about">About    </a></li>
        <li><a href="#contact">Contact    </a></li>
      </ul>
    </div>  
  </div>
</nav>

<div class="container">
  <div style="margin-top": 100px"></div>
  <div style="width: 300px">
  
  <br>
  <br>
  
  <form action="SchedulerServlet" method="post">
  <br><br>
  Professors
    <select class="form-control" name="professor">
      <option value="John White">John White</option>
      <option value="Michael Brown">Michael Brown</option>
      <option value="Tina Doe">Tina Doe</option>
      <option value="Emily Winter">Emily Winter</option>
      <option value="Christine Summer">Christine Summer</option>
    </select>
	<br>
  Courses
    <select class="form-control" name="courseName">
      <option value="Java Programming">Java Programming</option>
      <option value="C#">C#</option>
      <option value="C++">C++</option>
      <option value="Ruby on Rails">Ruby on Rails</option>
      <option value="Php">Php</option>
      <option value="SQL">SQL</option>
      <option value="JavaScript">JavaScript</option>
    </select>
	<br>

  <div class = "form-group">
	<label for = "roomNumber">Room Number</label>
	<input type="text" class="form-control" name="roomNumber" id="roomNumber" placeholder = "Room Number">
  </div>
  <div class = "form-group">
	<label for = "time">Time</label>
	<input type="time" class="form-control" name="time" id="time" placeholder = "Time">
  </div>
	
  <div class="weekDays-selector">
    <input type="checkbox" name="weekday" value="MONDAY" id="weekday-mon" class="weekday" />
    <label for="weekday-mon">Mon    </label>
    <input type="checkbox" name="weekday" value="TUESDAY" id="weekday-tue" class="weekday" />
    <label for="weekday-mon">Tue    </label>
    <input type="checkbox" name="weekday" value="WEDNESDAY" id="weekday-wed" class="weekday" />
    <label for="weekday-mon">Wed    </label>
    <input type="checkbox" name="weekday" value="THURSDAY" id="weekday-thu" class="weekday" />
    <label for="weekday-mon">Thu    </label>
    <input type="checkbox" name="weekday" value="FRIDAY" id="weekday-fri" class="weekday" />
    <label for="weekday-mon">Fri    </label>
  </div>
  <br>
  <p>Enter Start Date: <input type="date" id="datepicker" name="startDate"></p>
  <br><br>
  <button type="submit" class="btn btn-primary btn-lg">Add Course</button>
  </form>
  <br>
  <br>  
    <c:if test="${courses != null}">
    <table class="table table-hover">
	  <tr>
        <th>Start Date</th>
        <th>Room Number</th>
        <th>Course Name</th>
        <th>Weekday</th>
        <th>Time</th>
        <th>Professor</th>
      </tr>
  	<c:forEach var="course" items="${courses}">
      <tr>
        <td><c:out value="${course.startDate}" /></td>
        <td><c:out value="${course.roomNumber}" /></td>
        <td><c:out value="${course.courseName}" /></td>
        <td>
        
        <c:forEach var="day" items="${course.occurences}">
        <c:out value="${day}" />
        </c:forEach>
        
        </td>
        <td><c:out value="${course.time}" /></td>
        <td><c:out value="${course.professor}" /></td>
      </tr>
    </c:forEach>
	</table>
	</c:if>
  </div>
</div>
</body>
</html>