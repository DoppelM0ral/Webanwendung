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
	<jsp:useBean id="account" class="beans.AccountBean" scope="session"/>	
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
		<%
			//Übertragung der Daten von LoginView
			String userid   = request.getParameter("userid");
			String password = request.getParameter("password");
			String btnLogin = request.getParameter("btnLogin");
			String btnToRegister   = request.getParameter("btnToRegister");
			
			//null-check
			if (btnLogin == null) btnLogin = "";
			if (btnToRegister == null) btnToRegister = "";
			
			//Login Button wird auf Wert überprüft
			if (btnLogin.equals("Anmelden")){
				login.setUserid(userid);
				login.setPassword(password);
				try{
					boolean loginGeklappt = login.checkUseridPassword();
					if (loginGeklappt){
						login.setLoggedIn(true);
						response.sendRedirect("../views/CentralView.jsp");
					}else{
						login.setLoggedIn(false);
						response.sendRedirect("../views/LoginView.jsp");		
					}
				}catch(SQLException se){
					se.printStackTrace();
					login.setLoggedIn(false);
					response.sendRedirect("../views/LoginView.jsp");		
				}
			}else if(btnToRegister.equals("zum Registrieren")){
				//Daten aus AccountBean löschen
				response.sendRedirect("../views/RegisterView.jsp");
			}else{
				response.sendRedirect("../views/LoginView.jsp");
			}
		%>	
	</body>
</html>