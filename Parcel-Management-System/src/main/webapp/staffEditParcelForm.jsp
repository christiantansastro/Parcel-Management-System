<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Parcels - Staff Edit Parcel</title>
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
<%@page import="com.dao.UserDao, com.dao.bean.User" %>

<%
	String pID = request.getParameter("pID");
	User u = UserDao.trackParcel(pID);
	
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
			<a href="staffEditParcelForm.jsp?email=${email}" class="option-btn-1">Edit Parcel</a>
		</div>
	</div>

	<div class="wrapper">
		<div id="error_message"><p>${error_message}</p></div>
		<div class="successful-message"></div>
		

		<form onsubmit="return validateEditParcel()" action="staffEditParcel.jsp?email=${email}" method="post">			
			<div class="form-row">
				<div class="label-column">
					<label for="pID">Parcel ID</label>
				</div>
				<div class="input-column">
					<input type="text" id="pID" name="pID" value="<%=u.getpID()%>">
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="cID">Customer ID</label>
				</div>
				<div class="input-column">
					<input type="text" id="cID" name="cID" value="<%=u.getcID()%>">
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="pDateReceived">Date Received</label>
				</div>
				<div class="input-column">
					<input type="date" id="pDateReceived" name="pDateReceived" value="<%=u.getpDateReceived()%>">
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="pStatus">Status</label>
				</div>
				<div class="input-column">
					<select name="pStatus" id="pStatus">
						<option>Collected</option>
						<option>Not Collected</option>
					</select> 
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="pCollectedDate">Date Collected</label>
				</div>
				<div class="input-column">
					<input type="date" id="pCollectedDate" name="pCollectedDate" value="<%=u.getpCollectedDate()%>">
				</div>
			</div>
			
			<input type="submit" class="submit-btn"> 
			
		</form>
	</div>

	<footer>@2022 All Rights Reserved</footer>

</body>

<script src="javascript/validation.js"></script>

</html>