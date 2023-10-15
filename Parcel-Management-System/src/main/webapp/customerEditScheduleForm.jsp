<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parcels - Customer Schedule Parcel</title>
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
.wrapper {
	background: var(- -clr-light);
	width: 90%;
	max-width: 1200px;
	min-width: 700px;
	padding: 50px 5%;
	border-radius: 10px;
	display: blocked;
	margin: 0 auto;
	margin-top: 40px;
	margin-bottom: 80px;
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
	
	String scID = request.getParameter("scID");
 	User u = UserDao.viewScheduleCustomerEdit(Integer.parseInt(scID));

%>
	<header>
		<nav>
			<img src="resources/images/parcel-logo.jpg" class="logo">
			<ul class="nav-list">
				<li><a href="customerTrackParcel.jsp?email=${email}" id="nav-parcel">Parcel</a></li>
				<li><a href="customerViewProfile.jsp?email=${email}" id="nav-profile">Profile</a></li>
				<li><a href="customerLogin.jsp?email=${email}" id="nav-logout">Log out</a></li>
			</ul>
		</nav>
	</header>

	<div class="page-title">
		<h2>Customer</h2>
	</div>

	<div class="center-nav">
		<div class="nav-option">
			<a href="customerEditSchedule.jsp?email=${email}" class="option-btn-1">Edit Schedule</a>
		</div>
	</div>

	<div class="wrapper">
		<div id="error_message"><p>${error_message}</p></div>
		<div class="successful-message"></div>
			
		<form onsubmit="return validateEditSchedule()" action="customerEditSchedule.jsp?email=${email}" method="post">

			<input id="scID" style="display: none;" name="scID" value="<%=u.getscID()%>">
			
			<div class="form-row">
				<div class="label-column">
					<label for="pScheduleDate">Schedule Date</label>
				</div>
				<div class="input-column">
					<input type="date" id="pScheduleDate" name="pScheduleDate" value="<%=u.getpScheduleDate()%>">
				</div>
			</div>
			
			<div class="form-row">
				<div class="label-column">
					<label for="pScheduleTime">Schedule Time</label>
				</div>
				<div class="input-column">
					<input type="time" id="pScheduleTime" name="pScheduleTime" value="<%=u.getpScheduleTime()%>">
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