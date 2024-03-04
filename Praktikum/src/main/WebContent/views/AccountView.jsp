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
			<link rel="stylesheet" type="text/css" href="../css/AccountCSS.css">
			
			<!-- In diesem Bereich wird das zentrale JavaScript geladen -->
			<script type="text/javascript" src="../javascript/RedirectScripts.js"></script>
			<script type="text/javascript" src="../javascript/ButtonScripts.js"></script>
			
			<!-- Hier wird das Icon geladen -->
			<link rel="icon" type="image/x-icon" href="../content/Icon.png">
			
		<title>Nutzer Informationen</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->
	<jsp:useBean id="account" class="beans.AccountBean" scope="session"/>	
	<jsp:useBean id="framework" class="beans.FrameworkBean" scope="session"/>	
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
	
	<!-- Redirect wenn nicht logged in -->
	<form action="../appls/CentralAppl.jsp" method="get" name="redirect">
		<input type="hidden" id="loginCheck" name="loginCheck" value="<jsp:getProperty name="login" property="loggedIn"/>"/>
	</form>
	<script type="text/javascript">
		loginFalseCheck();
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
	<div id="content">
		<table id="info">
			<tr>
				<td colspan="2">Nutzer Informationen</td>
			</tr>
			<tr>
				<td>Nutzername:</td>
				<td><jsp:getProperty name="account" property="username"/></td>
			</tr>
			<tr>
				<td>Passwort:</td>
				<td><jsp:getProperty name="account" property="password"/></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><jsp:getProperty name="account" property="email"/></td>
			</tr>
			<tr>
				<td>Sprache:</td>
				<td><jsp:getProperty name="account" property="language"/></td>
			</tr>
			
		</table>	
	</div>	
	<jsp:getProperty name="account" property="accountData"/>
		</div><!-- Dieses </div> schließt ein in der 20. Zeile(FrameworkBean) eröffnetes <div> -->
	<jsp:getProperty name="framework" property="footer"/>	
	</body>
</html>