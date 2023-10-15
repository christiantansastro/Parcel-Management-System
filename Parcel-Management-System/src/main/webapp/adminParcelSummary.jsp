<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Parcels - Admin Parcel Summary</title>
<link href="resources/style.css" rel="stylesheet" type="text/css" />
<style>
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
.nav-option {
	display: grid;
	grid-template-columns: auto;
	gap: 0px;
}
.center-nav {
	max-width: 400px;
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
	List<User>list = UserDao.adminParcelSummary();
	request.setAttribute("list", list);
	
	User u = UserDao.viewParcelSummary();
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
			<a href="adminParcelSummary.jsp" class="option-btn-1">Parcel Summary</a>
		</div>
	</div>

	<div class="wrapper">
		
		<form>
			<div class="form-row">
				<div class="label-column">
					<label for="totalparcel">Total Parcel</label>
				</div>
				<div class="input-column">
					<input type="text" id="pStatus" name="pStatus" value=<%=u.getAddPstatus()%>>
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="collected">Collected</label>
				</div>
				<div class="input-column">
					<input type="text" id="collected" name="collected" value=<%=u.getpStatus()%>>
				</div>
			</div>

			<div class="form-row">
				<div class="label-column">
					<label for="notcollected">Not Collected</label>
				</div>
				<div class="input-column">
					<input type="text" id="notcollected" name="notcollected" value=<%=u.getpStatusNot()%>>
				</div>
			</div>
		</form>
		<br>
		<h3>PARCEL LIST</h3>

		<table>
			<tr>
				<th>Parcel ID</th>
				<th>Customer ID</th>
				<th>Status</th>
				<th>Date Received</th>
				<th>Date Collected</th>
			</tr>
			
			<c:forEach items="${list}" var="u">
			<tr>
				<td>${u.getpID()}</td>
				<td>${u.getcID()}</td>
				<td>${u.getpStatus()}</td>
				<td>${u.getpDateReceived()}</td>
				<td>${u.getpCollectedDate()}</td>
			</tr>
			</c:forEach>
			
		</table>
	</div>

	<footer>@2022 All Rights Reserved</footer>

</body>
</html>