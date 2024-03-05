<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>LoginAppl</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->	
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
	<jsp:useBean id="account" class="beans.AccountBean" scope="session"/>
		<%
			//Übertragung der Daten von LoginView
			String username   = request.getParameter("username");
			String password = request.getParameter("password");
			String btnLogin = request.getParameter("btnLogin");
			String btnToRegister   = request.getParameter("btnToRegister");
			String btnLog   = request.getParameter("btnLog");
			String loginCheck	= request.getParameter("loginCheck");
			
			//null-check
			if (btnLogin == null) btnLogin = "";
			if (btnToRegister == null) btnToRegister = "";
			if (btnLog == null) btnLog = "";
			if (loginCheck == null) loginCheck = "";
			
			//Login Button wird auf Wert überprüft
			if (btnLogin.equals("Anmelden")){
				login.setUsername(username);
				login.setPassword(password);
				try{
					//Existiert ein Account mit den angegebenen Daten?
					boolean success = login.checkLogin();
					//Ja angemeldet weitergeleitet zur CentralView
					if (success){
						login.setLoggedIn(true);
						message.setLoginWelcome();
						account.setUsername(username);
						account.setPassword(password);
						response.sendRedirect("../views/CentralView.jsp");
					//Nein unangemeldet wieder zur LoginView
					}else{
						login.setLoggedIn(false);
						message.setLoginProblem();
						response.sendRedirect("../views/LoginView.jsp");		
					}
				}catch(SQLException se){
					se.printStackTrace();
					login.setLoggedIn(false);
					response.sendRedirect("../views/LoginView.jsp");		
				}
			//Button zur Registrierung wird überprüft
			}else if(btnToRegister.equals("zum Registrieren")){
				//Daten aus AccountBean löschen
				message.setRegisterWelcome();
				response.sendRedirect("../views/RegisterView.jsp");
			}
			//Fehler also zurück zur LoginView
			else if(btnLog.equals("btnLog")){
				message.setGeneralWelcome();
				response.sendRedirect("../views/LoginView.jsp");
			}
			//LoginCheck zurück zur CentralView
			else if(loginCheck.equals("true")){
				message.setCentralHelloMessage();
				response.sendRedirect("../views/CentralView.jsp");
			}else{
				response.sendRedirect("../views/CentralView.jsp");
			}
		%>	
	</body>
</html>