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
		String btnHome	= request.getParameter("btnHome");
		String btnInfo  = request.getParameter("btnInfo");
		String reload	= request.getParameter("reload");
		
		if(btnHome	== null){btnHome = "";}
		if(btnInfo 	== null){btnInfo = "";}
		if(reload	== null){reload	 = "";}
		
		
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
		}else if(reload.equals("<h2>Du bist jetzt angemeldet!</h2>")){
			message.setCentralHelloMessage();
			response.sendRedirect("../views/CentralView.jsp");
		}else{
			message.setGeneralWelcome();
			response.sendRedirect("../views/CentralView.jsp");
		}
			
		%>	
	</body>
</html>