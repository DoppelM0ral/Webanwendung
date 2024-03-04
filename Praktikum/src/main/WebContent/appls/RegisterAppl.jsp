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
	<!-- In diesem Bereich werden die ben�tigten Beans geladen -->
	<jsp:useBean id="account" class="beans.AccountBean" scope="session"/>	
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
		<%
			//�bertragung der Daten von RegisterView
			String username   = request.getParameter("username");
			String password = request.getParameter("password");
			String language = request.getParameter("language");
			String email 	= request.getParameter("email");
			String btnToLogin	 = request.getParameter("btnToLogin");
			String btnRegister   = request.getParameter("btnRegister");
			String loginCheck	= request.getParameter("loginCheck");
			
			//null-check
			if (btnToLogin == null) btnToLogin = "";
			if (btnRegister == null) btnRegister = "";
			if (loginCheck == null) loginCheck = "";
			
			//Login Button wird auf Wert �berpr�ft
			if (btnToLogin.equals("zum Anmelden")){
				//Weiterleiten zu LoginView
				message.setGeneralWelcome();
				response.sendRedirect("../views/LoginView.jsp");
			}else if(btnRegister.equals("Registrieren")){
				//Registrierung durchf�hren
				account.setUsername(username);
				account.setPassword(password);
				account.setLanguage(language);
				account.setEmail(email);
				account.insertAccountNoCheck();
				//Actionmessage wird gesetzt
				message.setMainMessage("Dein Account wurde erstellt");
				message.setSecondaryMessage("Jetzt musst du dich nur noch anmelden :)");
				//Weiterleiten zu LoginView
				response.sendRedirect("../views/LoginView.jsp");
			}
			//LoginCheck zur�ck zur CentralView
			else if(loginCheck.equals("true")){
				message.setCentralHelloMessage();
				response.sendRedirect("../views/CentralView.jsp");
			}
		%>	
	</body>
</html>