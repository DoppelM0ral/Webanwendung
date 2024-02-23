<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Stadtguide</title>
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
			String zurReg   = request.getParameter("zurReg");
			
			//null-check
			if (btnLogin == null) btnLogin = "";
			if (zurReg == null) zurReg = "";
			
			//Login Button wird auf Wert überprüft
			if (btnLogin.equals("Anmelden")){
				login.setUserid(userid);
				login.setPassword(password);
				try{
					boolean loginGeklappt = login.checkUseridPassword();
					if (loginGeklappt){
						login.setLoggedIn(true);
						myMessage.setLoginSuccessful(userid);
						response.sendRedirect("./CentralView.jsp");
					}else{
						login.setLoggedIn(false);
						myMessage.setLoginFailed();
						response.sendRedirect("./LoginView.jsp");		
					}
				}catch(SQLException se){
					se.printStackTrace();
					login.setLoggedIn(false);
					myMessage.setDBError();
					response.sendRedirect("./LoginView.jsp");		
				}
			}else if(zurReg.equals("zurReg")){
				//Daten aus AccountBean löschen
				myAccount.initialize();
				myMessage.setRegistrationWelcome();
				response.sendRedirect("./RegView.jsp");
			}else{
				myLogin.setLoggedIn(false);
				myMessage.setGeneralWelcome();
				response.sendRedirect("./LoginView.jsp");
			}
		%>	
	</body>
</html>