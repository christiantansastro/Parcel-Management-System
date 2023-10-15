<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parcels - Customer Schedule Time</title>
<link href="resources/style.css" rel="stylesheet" type="text/css" />
<style>
.nav-option{
	display: grid;
	grid-template-columns: auto;
	gap: 0px;
}
.center-nav{
	max-width: 400px;
}
#nav-parcel{
	color: var(--clr-dark);
}
</style>
</head>
<body>
<%@page import="com.dao.UserDao, com.dao.bean.User, java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	String email = request.getParameter("email"); 
	request.setAttribute("email", email);
	
	User u = UserDao.viewProfile(email);
%>
	<header>
		<nav>
			<img src="resources/images/parcel-logo.jpg" class="logo">
			<ul class="nav-list">
				<li><a href="customerTrackParcel.jsp?email=${email}" id="nav-parcel">Parcel</a></li>
				<li><a href="customerViewProfile.jsp?email=${email}" id="nav-profile">Profile</a></li>
				<li><a href="index.html" id="nav-logout">Log out</a></li>
			</ul>
		</nav>
	</header>

	<div class="page-title">
		<h2>Customer</h2>
 	</div>

	<div class="center-nav">
		<div class="nav-option">
			<a href="customerScheduleTimeForm.jsp?email=${email}?" class="option-btn-1">Schedule Time</a>
		</div>
	</div>

	<div class="wrapper">
		<div id="error_message"><p>${error_message}</p></div>

		<form onsubmit="return validateSchedule()" action="customerScheduleTime.jsp?email=${email}" method="post">

			<input id="cID" style="display: none;" name="cID" value="<%=u.getcID()%>">
			
			<div class="form-row">
				<div class="label-column">
					<label for="pScheduleDate">Schedule Date</label>
				</div>
				<div class="input-column">
					<input type="date" id="pScheduleDate" name="pScheduleDate">
				</div>
			</div>
			
			<div class="form-row">
				<div class="label-column">
					<label for="pScheduleTime">Schedule Time</label>
				</div>
				<div class="input-column">
					<input type="time" id="pScheduleTime" name="pScheduleTime">
					<p style="font-size: 14px;">Note: Office hours are 14:00 to 17:00</p>
				</div>
			</div>
			
			<input type="submit" class="submit-btn">
		</form>

	</div>


	<div class="contact-us">
		<div style="margin-top: 30px;">
			<h2>contact us</h2>
		</div>
		<div>
			<p>Phone: +60-123123123</p>
			<p>E-mail: parcel@xmu.edu.my</p>
			<p>Visit us on B1#117</p>
		</div>
	</div>

	<footer>@2022 All Rights Reserved</footer>
</body>

<script src="javascript/validation.js"></script>

</html>