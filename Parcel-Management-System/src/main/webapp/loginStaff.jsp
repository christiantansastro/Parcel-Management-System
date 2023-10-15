<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Verify Staff Login</title>

<script>
function alert(){
	alert("Success");	
}
</script>

</head>
<body>

<%@page import="com.dao.UserDao"%>
<jsp:useBean id="u" class="com.dao.bean.User"></jsp:useBean>
<jsp:setProperty property="*" name="u"></jsp:setProperty>

<%

int i = UserDao.loginStaff(u);

if (i>0){
	String email = request.getParameter("email");
	RequestDispatcher req = request.getRequestDispatcher("staffParcelList.jsp");
	req.include(request, response);
}
else {
	response.sendRedirect("staffLoginError.jsp");
}

%>

</body>
</html> 