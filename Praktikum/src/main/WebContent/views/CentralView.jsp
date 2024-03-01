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
	
	<!-- Redirect wenn nicht logged in -->
	<jsp:getProperty name="login" property="loginRedirect"/>
	
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
			<!-- <div class='content'>
				<table>
					<tr>
						<td width="20%">
							Was suchen sie?<br>
									<select name="gesucht" onChange="showOption(this)">
										<option value="">Auswählen</option>
										<option value="restaurant">Restaurant</option>
										<option value="unterkunft">Unterkunft</option>
										<option value="kultur">Kultur</option>
										<option value="aktivitaet">Aktivität</option>
									</select>
						</td>
					</tr>
				</table>
			</div> -->
			<div>
				<table>
				</table>
			</div>
		</div>
	<jsp:getProperty name="framework" property="footer"/>	
	</body>
</html>