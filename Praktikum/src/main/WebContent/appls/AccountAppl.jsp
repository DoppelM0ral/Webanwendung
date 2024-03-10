<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		
		<!-- Login Redirect Script -->
		<script type="text/javascript" src="../javascript/RedirectScripts.js"></script>
		
		<title>AccountAppl</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->	
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
	<jsp:useBean id="account" class="beans.AccountBean" scope="session"/>
	
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
	        String btnInfo    = request.getParameter("btnInfo");
	        String btnChange  = request.getParameter("btnChange");
	        String btnLogout  = request.getParameter("btnLogout");
	
	        //null-check
	        if(btnInfo         == null)    {btnInfo = "";}
	        if(btnChange    == null)    {btnChange= "";}
	        if(btnLogout    == null)    {btnLogout = "";}
	
	        //Tatsächliche Verarbeitung
	        if(btnInfo.equals("btnInfo")){
	            message.setAccountWelcome();
	            account.getAccountData();
	            response.sendRedirect("../views/AccountView.jsp");
	        }else if(btnChange.equals("Ausgewählte Information ändern")){
	
	            response.sendRedirect("../views/LoginView.jsp");
	        }else if(btnLogout.equals("Abmelden")){
	            account.initialize();
	            login.setLoggedIn(false);
	            message.setLogoutMessage();
	
	            response.sendRedirect("../views/LoginView.jsp");
	        }else{
	            message.setAccountWelcome();
	            account.getAccountData();
	            response.sendRedirect("../views/AccountView.jsp");
	        }	
		%>	
	</body>
</html>