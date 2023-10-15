<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@page import="com.dao.UserDao" %>
<jsp:useBean id="u" class="com.dao.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"/>

<%
	String email = request.getParameter("email");

	int i = UserDao.addSchedule(u);

	RequestDispatcher req = request.getRequestDispatcher("customerScheduleParcel.jsp");
	req.include(request, response);
%>

</body>
</html>