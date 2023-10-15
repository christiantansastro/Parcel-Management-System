<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Parcels - Admin Add Staff</title>
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
#nav-staff{
	color: var(--clr-dark);
}
</style>

</head>

<body>
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
			<a href="adminAddStaff.jsp" class="option-btn-1">Add Staff</a> <a
				href="adminStaffList.jsp" class="option-btn-2">Staff List</a>
		</div>
	</div>
	
	<div class="wrapper">
		<div id="error_message"><p>${error_message}</p></div>
		<br>
			
		<form onsubmit="return validate()" action="addStaff.jsp" method="post"> 
			<div class="form-row">
				<div class="label-column">
					<label for="fName">First Name</label>
				</div>
				<div class="input-column">
					<input type="text" name="fName" id="fName">
				</div>
			</div>
			
			<div class="form-row">
				<div class="label-column">
					<label for="lastname">Last Name</label>
				</div>
				<div class="input-column">
					<input type="text" name="lName" id="lName">
				</div>
			</div>
				
			<div class="form-row">
				<div class="label-column">
					<label for="email">Email</label>
				</div>
				<div class="input-column">
					<input type="email" name="email" id="email">
				</div>
			</div>
			
			<div class="form-row">
				<div class="label-column">
					<label for="phonenumber">Phone Number</label><br>
				</div>
				<div class="input-column">
					<input type="text" name="phoneNo" id="phoneNo">
				</div>
			</div>
			
			<div class="form-row">
				<div class="label-column">
					<label for="country">Country</label>
				</div>
				<div class="input-column">
					<input type="text" name="country" id="country">
				</div>
			</div>
			
			<div class="form-row">
				<div class="label-column">
					<label for="password">Password</label>
				</div>
				<div class="input-column">
					<input type="password" name="password" id="password">
				</div>
			</div>
			
			<div class="form-row">
				<div class="label-column">
					<label for="role">Role</label>
				</div>
				<div class="input-column">
					<select name="role">
						<option>Staff</option>
						<option>Admin</option>
					</select><br>
					<br>
				</div>
			</div>
							
			<input type="submit" class="submit-btn">

		</form>
		
	</div>
	
	<footer>@2022 All Rights Reserved</footer>

</body>
	
<script src="javascript/validation.js"></script>

</html>