<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parcels - Customer Edit Schedule</title>
</head>
<body>

<%@page import="com.dao.UserDao" %>
<jsp:useBean id="u" class="com.dao.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	int i = UserDao.updateSchedule(u);

	if (i>0){	
		String email = request.getParameter("email");
		RequestDispatcher req = request.getRequestDispatcher("customerScheduleParcel.jsp");
		req.include(request, response);
	}
	
%>

</body>
</html>