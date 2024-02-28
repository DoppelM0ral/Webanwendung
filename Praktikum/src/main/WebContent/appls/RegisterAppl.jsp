<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>RegisterAppl</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->
	<jsp:useBean id="account" class="beans.AccountBean" scope="session"/>	
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
		<%
			//Übertragung der Daten von RegisterView
			String username   = request.getParameter("username");
			String password = request.getParameter("password");
			String language = request.getParameter("language");
			String email 	= request.getParameter("email");
			String btnToLogin	 = request.getParameter("btnToLogin");
			String btnRegister   = request.getParameter("btnRegister");
			
			//null-check
			if (btnToLogin == null) btnToLogin = "";
			if (btnRegister == null) btnRegister = "";
			
			//Login Button wird auf Wert überprüft
			if (btnToLogin.equals("zum Anmelden")){
				//Weiterleiten zu LoginView
				response.sendRedirect("../views/LoginView.jsp");
			}else if(btnRegister.equals("Registrieren")){
				//Registrierung durchführen
				account.setUsername(username);
				account.setPassword(password);
				account.setLanguage(language);
				account.setEmail(email);
				account.insertAccountNoCheck();
				//Weiterleiten zu LoginView
				response.sendRedirect("../views/LoginView.jsp");
			}
		%>	
	</body>
</html>