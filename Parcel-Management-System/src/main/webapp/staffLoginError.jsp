<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Parcels - Staff Login</title>
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
#nav-staff{
	color: var(--clr-dark);
}
</style>
</head>

<body>
<%@page import="com.dao.UserDao, com.dao.bean.User, java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<header>
		<nav>
			<img src="resources/images/parcel-logo.jpg" class="logo">
			<ul class="nav-list">
				<li><a href="adminLogin.jsp" id="nav-admin">Admin</a></li>
				<li><a href="staffLogin.jsp" id="nav-staff">Staff</a></li>
				<li><a href="customerLogin.jsp" id="nav-customer">Customer</a></li>
			</ul>
		</nav>
	</header>

	<div class="page-title">
		<h2>Staff</h2>
	</div>

	<div class="center-nav">
		<div class="nav-option">
			<a href="staffLogin.jsp" class="option-btn-1">Login</a>
		</div>
	</div>
	
	<div class="wrapper">
		<div id="error_message"><p>${error_message}</p></div>
		<div class="successful-message"></div>
		
		<p style="color:red; padding-left:15px;">Incorrect email or password</p>
		<form onsubmit="return validateLogin()" action="loginStaff.jsp" method="post">
			
			<div class="form-row">
				<div class="label-column">
					<label for="email">Email</label>
				</div>
				<div class="input-column">
					<input type="email" id="email" name="email" placeholder="xx@mail.com">
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="password">Password</label>
				</div>
				<div class="input-column">
					<input type="password" id="password" name="password">
				</div>
			</div>

 			<input type="submit" class="submit-btn">
 		</form>

	</div>

	<footer>@2022 All Rights Reserved</footer>

</body>

<script src="resources/sample.js"></script>

</html>