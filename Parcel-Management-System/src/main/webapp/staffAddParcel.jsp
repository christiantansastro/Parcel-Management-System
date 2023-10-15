<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<html>
<head>
<meta charset="UTF-8">
<title>Parcels - Staff Add Parcel</title>
<link href="resources/style.css" rel="stylesheet" type="text/css" />
<style>
#nav-parcel{
	color: var(--clr-dark);
}
</style>
</head>

<body>
<%
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
			<a href="staffAddParcel.jsp?email=${email}" class="option-btn-1">Add Parcel</a> <a
				href="staffParcelList.jsp?email=${email}" class="option-btn-2">Parcel List</a> <a
				href="staffSearchParcel.jsp?email=${email}" class="option-btn-2">Search Parcel</a>
			<a href="staffScheduleParcel.jsp?email=${email}" class="option-btn-2">Schedule</a>
		</div>
	</div>

	<div class="wrapper">
		<div id="error_message"><p>${error_message}</p></div>
		<div class="successful-message"></div>
		
		<form onsubmit="return validateParcel()" action="addParcel.jsp?email=${email}" method="post">
			<div class="form-row">
				<div class="label-column">
					<label for="pID">Parcel ID</label>
				</div>
				<div class="input-column">
					<input type="text" id="pID" name="pID">
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="cID">Customer ID</label>
				</div>
				<div class="input-column">
					<input type="text" id="cID" name="cID">
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="pDateReceived">Date Received</label>
				</div>
				<div class="input-column">
					<input type="date" id="pDateReceived" name="pDateReceived">
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
			
			<input type="submit" class="submit-btn"> 
	
		</form>
	</div>

	<footer>@2022 All Rights Reserved</footer>

</body>

<script src="javascript/validation.js"></script>

</html>