<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" href="https://use.typekit.net/oov2wcw.css">
		<link rel="stylesheet" type="text/css" href="../css/FrameworkCSS.css">
		<link rel="stylesheet" type="text/css" href="../css/LoginCSS.css">
		<link rel="icon" type="image/x-icon" href="../content/Icon.png">
		<title>Login</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->
	<jsp:useBean id="account" class="beans.AccountBean" scope="session"/>	
	<jsp:useBean id="framework" class="beans.FrameworkBean" scope="session"/>	
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
	
	<!-- Hier wird die Inhalt aus der Framework Bean geladen, in diesem Fall das Framework für den Aufbau der
		 gesamten JSP-Struktur(Header/Sidebars/Footer) -->
	<jsp:getProperty name="framework" property="framework"/>
		<div class="message">
			Hey für die Funktion "jeweilige Funktion" musst du eingeloggt sein alternativ kannst du dich auch Registrieren
		</div>
		<div class="login">
			<table>
				<tr>
					<td>Nickname:</td>
					<td><input type="text" name="userid" value="" /></td>
				</tr>
				<tr>
					<td>Passwort:</td>
					<td><input type="password" name="password" value="" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<input class="button" type="submit" name="btnLogin" value="Anmelden" />
						<input class="button" type="submit" name="btnRegister" value="Registrieren"/>
					</td>
				</tr>
			</table>
		
		
		</div>
	</body>
</html>