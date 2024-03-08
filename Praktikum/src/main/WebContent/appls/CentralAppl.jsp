<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		
		<!-- Login Redirect Script -->
		<script type="text/javascript" src="../javascript/RedirectScripts.js"></script>
		
		<title>CentralAppl</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->	
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>	
	<jsp:useBean id="city" class="beans.CityBean" scope="session"/>
	
	<!-- Redirect wenn nicht logged in -->
	<form action="../appls/CentralAppl.jsp" method="get" name="redirect">
		<input type="hidden" id="loginCheck" name="loginCheck" value="<jsp:getProperty name="login" property="loggedIn"/>"/>
	</form>
	<script type="text/javascript">
		loginFalseCheck();
	</script>
	
		<!-- Inhalt Java Funktionen -->
		<%
			//HTTP Übernahme
			String btnHome		= request.getParameter("btnHome");
			String btnInfo  	= request.getParameter("btnInfo");
			String btnSearch	= request.getParameter("btnSearch");
			String loginCheck	= request.getParameter("loginCheck");
			String msgCheck		= request.getParameter("msgCheck");
			String plzsearch	= request.getParameter("plzsearch");
			String namesearch	= request.getParameter("namesearch");
			
			//null-check
			if(btnHome		== null){btnHome = "";}
			if(btnInfo 		== null){btnInfo = "";}
			if(btnSearch	== null){btnSearch= "";}
			if(loginCheck	== null){loginCheck  = "";}
			if(msgCheck		== null){msgCheck  = "";}
			
			if(btnInfo.equals("btnInfo")){
				message.setAccountWelcome();
				response.sendRedirect("../views/AccountView.jsp");
			}else if(btnHome.equals("btnHome")){
				if(login.isLoggedIn()){
					message.setCentralHelloMessage();
					response.sendRedirect("../views/CentralView.jsp");
				}else{
					message.setGeneralWelcome();
					response.sendRedirect("../views/LoginView.jsp");
				}	
			}else if(btnSearch.equals("Wechseln zur Stadt")){
				if(plzsearch != null){
					city.selectCityWithPLZ(plzsearch);
					response.sendRedirect("../views/CityView.jsp");
				}else if(namesearch != null){
					city.selectCityWithName(namesearch);
					response.sendRedirect("../views/CityView.jsp");
				}	
			}else if(loginCheck.equals("false")){
				message.setGeneralWelcome();
				response.sendRedirect("../views/LoginView.jsp");
			}else if(msgCheck.equals("<h2>Du bist jetzt angemeldet!</h2>")){
				message.setCentralHelloMessage();
				response.sendRedirect("../views/CentralView.jsp");
			}else{
				message.setGeneralWelcome();
				response.sendRedirect("../views/CentralView.jsp");
			}
				
		%>	
	</body>
</html>