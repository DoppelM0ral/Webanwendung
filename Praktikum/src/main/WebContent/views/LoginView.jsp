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
		<link rel="stylesheet" type="text/css" href="../css/LoginCSS.css">
		
		<!-- Hier wird das Icon geladen -->
		<link rel="icon" type="image/x-icon" href="../content/Icon.png">

		<title>Login</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->
	<jsp:useBean id="account" class="beans.AccountBean" scope="session"/>	
	<jsp:useBean id="framework" class="beans.FrameworkBean" scope="session"/>	
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
	
	
	
	<!-- Hier wird die Inhalt aus der Framework Bean geladen, in diesem Fall das Framework für den Aufbau der
		 gesamten JSP-Struktur(Header/Sidebars/Footer) -->
	<jsp:getProperty name="framework" property="framework"/>
	
	<!-- Hier sollte Inhalt aus der MessageBean, es ist derzeit nur ein Platzhalter -->
		<!-- <div class="message">
			Hey für die Funktion "jeweilige Funktion" musst du dich eingeloggen oder alternativ kannst du dich auch Registrieren
		</div> -->
	
	<!-- Hier wird das Feld für der Login aus der LoginBean geladen -->
	<jsp:getProperty name="login" property="loginDiv"/>
		
		</div><!-- Dieses </div> schließt ein in der 20. Zeile eröffnetes <div> -->
	<jsp:getProperty name="framework" property="footer"/>	
	</body>
</html>