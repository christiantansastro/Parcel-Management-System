<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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

int i = UserDao.loginAdmin(u);

if (i>0){
	response.sendRedirect("adminStaffList.jsp");
}
else {
	response.sendRedirect("adminLoginError.jsp");
}

%>



</body>
</html> 