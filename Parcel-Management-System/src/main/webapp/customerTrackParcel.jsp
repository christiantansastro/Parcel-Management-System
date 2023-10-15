<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Parcels - Customer Track Parcel</title>
<link href="resources/style.css" rel="stylesheet" type="text/css" />
<style>
.nav-option{
	display: grid;
	grid-template-columns: auto auto auto;
	gap: 0px;
}
.center-nav{
	max-width: 600px;
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
	
	List<User>list = UserDao.trackParcelCustomer(email);
	request.setAttribute("list", list);
	
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
			<a href="customerTrackParcel.jsp?email=${email}" class="option-btn-1">Track Parcel</a> 
			<a href="customerScheduleParcel.jsp?email=${email}" class="option-btn-2">Schedule</a>
			<a href="customerParcelHistory.jsp?email=${email}" class="option-btn-2">History</a>
		</div>
	</div>


	<div class="wrapper">
		<form action="customerScheduleTimeForm.jsp?email=${email}" method="post">
			<table>
				<tr>
					<th>Parcel ID</th>
					<th>Date Arrived</th>
					
				</tr>
				<c:forEach items="${list}" var="u">
				<tr>
					<td>${u.getpID()}</td> 
					<td>${u.getpDateReceived()}</td>
				</tr>
				</c:forEach>
				
			</table>
			<button class="submit-btn" type="submit">Schedule</button>

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
</html>