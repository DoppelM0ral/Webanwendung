<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
			<!-- Hier wird die Schriftart geladen -->
			<link rel="stylesheet" href="https://use.typekit.net/oov2wcw.css">
			
			<!-- Hier wird die Grundformatierung geladen -->
			<link rel="stylesheet" type="text/css" href="../css/FrameworkCSS.css">
			
			<!-- In diesem Bereich werden andere relevante Formatierungen geladen -->
			<link rel="stylesheet" type="text/css" href="../css/RegisterCSS.css">
			
			<!-- In diesem Bereich wird das zentrale JavaScript geladen -->
			<script type="text/javascript" src="../javascript/RedirectScripts.js"></script>
			<script type="text/javascript" src="../javascript/ButtonScripts.js"></script>
			
			<!-- Hier wird das Icon geladen -->
			<link rel="icon" type="image/x-icon" href="../content/Icon.png">
		
		<title>Stadtguide</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->
	<jsp:useBean id="account" class="beans.AccountBean" scope="session"/>	
	<jsp:useBean id="framework" class="beans.FrameworkBean" scope="session"/>	
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>

		<!-- Redirectwenn logged in -->
	<form action="../appls/RegisterAppl.jsp" method="get" name="redirect">
		<input type="hidden" id="loginCheck" name="loginCheck" value="<jsp:getProperty name="login" property="loggedIn"/>"/>
	</form>
	<script type="text/javascript">
		loginTrueCheck();
	</script>
	
	<!-- Hier wird die Inhalt aus der Framework Bean geladen, in diesem Fall das Framework für den Aufbau der
		 gesamten JSP-Struktur(Header/Sidebars/Footer) -->
	<jsp:getProperty name="framework" property="framework"/>
	
	<!-- Hier wird der entsprechend relevante Inhalt der MessageBean geladen -->
	<div id="mainmsg">
	<jsp:getProperty name="message" property="mainMessage"/>
	</div>
	<div id="secondarymsg">
	<jsp:getProperty name="message" property="secondaryMessage"/>
	</div>
	
	<!-- Hier wird die Oberfläche fürs Registrieren geladen -->
	<%-- <jsp:getProperty name="account" property="registerField"/> --%>
	
		<div id='content'>
	
			<form  action='../appls/RegisterAppl.jsp' method='get'>
				<table >
					<tr>
			 			<td><img id="info" alt="info" src="../content/Info.png"></td>
			 			<td>Nickname:</td>
			 			<td><input type='text' name='username' value=''/></td>
					</tr>
					<tr>
						<td><img id="info" alt="info" src="../content/Info.png"></td>
						<td>Passwort:</td>
						<td><input id='passwordField' type='password' name='password' value=''/></td>
					</tr>
					<tr>
						<td><img id="info" alt="info" src="../content/Info.png"></td>
						<td>E-Mail:</td>
						<td><input type='email' name='email' value=''/></td>
			 		</tr>
					<tr>
						<td colspan="3" align="center">
							<input class='button' type='submit' name='btnToLogin' value='zum Anmelden'/>
							<input class='button' type='submit' name='btnRegister' value='Registrieren'/>
						</td>
					</tr>
				</table>
			</form>
	
		</div>
		
	</div><!-- Dieses </div> schließt ein in der 20. Zeile eröffnetes <div> -->
	<jsp:getProperty name="framework" property="footer"/>	
	</body>
</html>