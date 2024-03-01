<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>CentralAppl</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->	
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>	
		<%
		String btnHome   = request.getParameter("btnHome");
		
		if(btnHome.equals("btnHome")){
			message.setGeneralWelcome();
			response.sendRedirect("../views/CentralView.jsp");
		}
			
		%>	
	</body>
</html>