<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Parcels - Admin Staff List</title>
<link href="resources/style.css" rel="stylesheet" type="text/css" />
<style>
.nav-option {
	display: grid;
	grid-template-columns: auto auto;
	gap: 0px;
}
.center-nav {
	max-width: 500px;
}
.wrapper {
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
#nav-staff{
	color: var(--clr-dark);
}
</style>
</head>

<body>
<%@page import="com.dao.UserDao, com.dao.bean.User, java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	List<User>list = UserDao.viewStaffList();
	request.setAttribute("list", list);
%>

	<header>
		<nav>
			<img src="resources/images/parcel-logo.jpg" class="logo">
			<ul class="nav-list">
				<li><a href="adminStaffList.jsp" id="nav-staff">Staff</a></li>
				<li><a href="adminParcelSummary.jsp" id="nav-parcel">Parcel</a></li>
				<li><a href="index.html" id="nav-logout">Log out</a></li>
			</ul>
		</nav>
	</header>

	<div class="page-title">
		<h2>Admin</h2>
	</div>

	<div class="center-nav">
		<div class="nav-option">
			<a href="adminAddStaff.jsp" class="option-btn-2">Add Staff</a> <a
				href="adminStaffList.jsp" class="option-btn-1">Staff List</a>
		</div>
	</div>

	<div class="wrapper">
		<table>
			<tr>
				<th>Staff ID</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th style="display:none;">Password</th>
				<th>Phone Number</th>
				<th>Country</th>
				<th>Role</th>
				<th>Edit</th>
				<th>Delete</th>
			</tr>
			
			<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getsID()}</td>
				<td>${u.getfName()}</td>
				<td>${u.getlName()}</td>
				<td>${u.getEmail()}</td>
				<td style="display:none;">${u.getPassword()}</td>
				<td>${u.getPhoneNo()}</td>
				<td>${u.getCountry()}</td>
				<td>${u.getRole()}</td>
				<td>
					<a href="adminEditStaffForm.jsp?sID=${u.getsID()}" class="edit-btn">Edit</a>
				</td>
				<td>
					<a href="adminDeleteStaff.jsp?sID=${u.getsID()}" class="delete-btn">Delete</a>
				</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>

	<footer>@2022 All Rights Reserved</footer>

</body>
</html>