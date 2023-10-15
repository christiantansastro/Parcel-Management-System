<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Parcels - Customer View Profile</title>
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
#nav-profile{
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
				<li><a href="customerLogin.jsp?email=${email}" id="nav-logout">Log out</a></li>
			</ul>
		</nav>
	</header>

	<div class="page-title">
		<h2>Customer</h2>
	</div>

	<div class="center-nav">
		<div class="nav-option">
			<a href="customerViewProfile.jsp?email=${email}" class="option-btn-1">View Profile</a> 
			<a href="customerEditProfileForm.jsp?email=${email}" class="option-btn-2">Edit Profile</a>
		</div>
	</div>

	<div class="wrapper">

		<form>
			<div class="form-row">
				<div class="label-column">
					<label for="fName">First Name</label>
				</div>
				<div class="input-column">
					<input type="text" id="fName" name="fName" placeholder="<%=u.getfName()%>" readonly>
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="lName">Last Name</label>
				</div>
				<div class="input-column">
					<input type="text" id="lName" name="lName" placeholder="<%=u.getlName()%>" readonly>
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="email">Email</label>
				</div>
				<div class="input-column">
					<input type="email" id="email" name="email" placeholder="<%=u.getEmail()%>" readonly>
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="phoneNo">Phone Number</label><br>
				</div>
				<div class="input-column">
					<input type="text" id="phoneNo" name="phoneNo" placeholder="<%=u.getPhoneNo()%>" readonly>
				</div>
			</div>
			
			<div class="form-row">
				<div class="label-column">
					<label for="country">Country</label><br>
				</div>
				<div class="input-column">
					<input type="text" id="country" name="country"  placeholder="<%=u.getCountry()%>" readonly>
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="password">Password</label>
				</div>
				<div class="input-column">
					<input type="password" id="password" name="password" value="<%=u.getPassword()%>" readonly>
				</div>
			</div>
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