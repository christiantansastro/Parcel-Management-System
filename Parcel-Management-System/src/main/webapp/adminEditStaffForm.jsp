<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parcels - Admin Edit Staff</title>
<link href="resources/style.css" rel="stylesheet" type="text/css" />
<style>
.nav-option {
	display: grid;
	grid-template-columns: auto;
	gap: 0px;
}
.center-nav {
	max-width: 400px;
}
#nav-staff{
	color: var(--clr-dark);
}
</style>
</head>
<body>
<%@page import="com.dao.UserDao, com.dao.bean.User" %>
<%
	String sID = request.getParameter("sID");
	User u = UserDao.staffListEdit(Integer.parseInt(sID));
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
			<a href="adminEditStaff.jsp" class="option-btn-1">Edit Staff</a>
		</div>
	</div>
	
	<div class="wrapper">
		<div id="error_message"><p>${error_message}</p></div>
		<div class="successful-message"></div>
		
		<form onsubmit="return validate()" action="adminEditStaff.jsp" method="post">
			
			<input type="text" id="sID" name="sID" value="<%=sID%>" style="display: none">
			
			<div class="form-row">
				<div class="label-column">
					<label for="fName">First Name</label>
				</div>
				<div class="input-column">
					<input type="text" id="fName" name="fName" value="<%=u.getfName()%>">					
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="lName">Last Name</label>
				</div>
				<div class="input-column">
					<input type="text" id="lName" name="lName" value="<%=u.getlName()%>">
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="email">Email</label>
				</div>
				<div class="input-column">
					<input type="email" id="email" name="email" value="<%=u.getEmail()%>">
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="password">Password</label>
				</div>
				<div class="input-column">
					<input type="password" id="password" name="password" value=<%=u.getPassword() %>>
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="phoneNo">Phone Number</label><br>
				</div>
				<div class="input-column">
					<input type="text" id="phoneNo" name="phoneNo" value="<%=u.getPhoneNo()%>">
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="country">Country</label>
				</div>
				<div class="input-column">
					<input type="text" id="country" name="country" value="<%=u.getCountry()%>">
				</div>
			</div>

			<input class="submit-btn" type="submit">
		</form>

	</div>

	<footer>@2022 All Rights Reserved</footer>
</body>

<script src="javascript/validation.js"></script>

</html>