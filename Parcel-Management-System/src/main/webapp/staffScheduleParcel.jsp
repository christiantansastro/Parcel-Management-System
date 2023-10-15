<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Parcels - Staff Schedule Parcel</title>
<link href="resources/style.css" rel="stylesheet" type="text/css" />
<style>
.wrapper{
	background: var(--clr-light);
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
	List<User>list = UserDao.viewSchedule();
	request.setAttribute("list", list);
	
	String email = request.getParameter("email"); 
	request.setAttribute("email", email);
%>
	<header>
		<nav>
			<img src="resources/images/parcel-logo.jpg" class="logo">
			<ul class="nav-list">
				<li><a href="staffParcelList.jsp?email=${email}" id="nav-parcel">Parcel</a></li>
				<li><a href="staffProfile.jsp?email=${email}" id="nav-profile">Profile</a></li>
				<li><a href="index.html" id="nav-logout">Log out</a></li>
			</ul>
		</nav>
	</header>

	<div class="page-title">
		<h2>Staff</h2>
	</div>

	<div class="center-nav">
		<div class="nav-option">
			<a href="staffAddParcel.jsp?email=${email}" class="option-btn-2">Add Parcel</a> <a
				href="staffParcelList.jsp?email=${email}" class="option-btn-2">Parcel List</a> <a
				href="staffSearchParcel.jsp?email=${email}" class="option-btn-2">Search Parcel</a>
			<a href="staffScheduleParcel.jsp?email=${email}" class="option-btn-1">Schedule</a>
		</div>
	</div>
 
 	<div class="wrapper">
		<table>
			<tr>
				<th>Parcel ID</th>
				<th>Schedule Date</th>
				<th>Schedule Time</th>
				<th>Customer ID</th>
				<th>Status</th>
			</tr>
			
			<c:forEach items="${list}" var="u">
				<tr>
					<td>${u.getpID()}</td>
					<td>${u.getpScheduleDate()}</td>
					<td>${u.getpScheduleTime()}</td>
					<td>${u.getcID()}</td>
					<td>${u.getpStatus()}</td>
				</tr>
			</c:forEach>
		</table>
	</div>

	<footer>@2022 All Rights Reserved</footer>
</body>
</html>