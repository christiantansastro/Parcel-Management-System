<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Staff JSP</title>
</head>

<body>

<%@page import="com.dao.UserDao" %>
<jsp:useBean id="u" class="com.dao.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"></jsp:setProperty>

<%
	
	int j = UserDao.isStaffExist(u);
	
	if(j == 0){
		
		int i = UserDao.addStaff(u);
		
		if(i > 0){
			response.sendRedirect("adminStaffList.jsp");
		}

	}else{
		 request.setAttribute("error_message", "User exist, please add staff using different email");
         RequestDispatcher rd = request.getRequestDispatcher("/adminAddStaff.jsp");
         rd.forward(request, response);          
	}
%>

</body>

</html>