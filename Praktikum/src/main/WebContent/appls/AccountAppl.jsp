<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>AccountAppl</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->	
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
	
		<%
		String btnInfo  = request.getParameter("btnInfo");
		String loginCheck	= request.getParameter("loginCheck");

		if(btnInfo 	== null){btnInfo = "";}
		if(loginCheck	== null){loginCheck  = "";}

		
		if(btnInfo.equals("btnInfo")){
			message.setAccountWelcome();
			
			response.sendRedirect("../views/AccountView.jsp");
		}else if(loginCheck.equals("false")){
			message.setGeneralWelcome();
			response.sendRedirect("../views/LoginView.jsp");
		}else{
			message.setGeneralWelcome();
			response.sendRedirect("../views/CentralView.jsp");
		}
			
		%>	
	</body>
</html>