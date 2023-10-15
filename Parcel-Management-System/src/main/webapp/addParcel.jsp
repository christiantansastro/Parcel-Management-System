<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Parcel JSP</title>
</head>

<body>

<%@page import="com.dao.UserDao" %>
<jsp:useBean id="u" class="com.dao.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"></jsp:setProperty>

<%
	int i = UserDao.addParcel(u);
	
	if(i > 0){
		String email = request.getParameter("email");
		RequestDispatcher req = request.getRequestDispatcher("staffParcelList.jsp");
		req.include(request, response);
	}

%>

</body>

</html>