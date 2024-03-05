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
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
		<%
			//Übertragung der Daten von RegisterView
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
			
			//Login Button wird auf Wert überprüft
			if (btnToLogin.equals("zum Anmelden")){
				//Weiterleiten zu LoginView
				message.setGeneralWelcome();
				response.sendRedirect("../views/LoginView.jsp");
			}else if(btnRegister.equals("Registrieren")){
				//Registrierung durchführen
				account.setUsername(username);
				account.setEmail(email);
				if(account.checkUserExist()== false && account.checkEmailExist()== false){
					account.setPassword(password);
					account.setLanguage(language);
					account.insertAccount();
					//Messagebean wird gesetzt
					message.setRegisterSuccess();
					//AccountBean wird gecleart
					account.initialize();
					//Weiterleiten zu LoginView
					response.sendRedirect("../views/LoginView.jsp");
				}else if(account.checkUserExist()){
					//Messagebean wird gesetzt
					message.setUsernameTaken();	
					//Weiterleiten zu RegisterView
					response.sendRedirect("../views/RegisterView.jsp");	
				}else if(account.checkEmailExist()){
					//Messagebean wird gesetzt
					message.setEmailTaken();	
					//Weiterleiten zu RegisterView
					response.sendRedirect("../views/RegisterView.jsp");	
				}
				
			//LoginCheck zurück zur CentralView
			}else if(loginCheck.equals("true")){
				message.setCentralHelloMessage();
				response.sendRedirect("../views/CentralView.jsp");
			}
		%>	
	</body>
</html>