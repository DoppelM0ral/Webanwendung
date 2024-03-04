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
		
			<!-- In diesem Bereich wird das zentrale JavaScript geladen -->
			
			
			<!-- Hier werden relevante JavaScript Files geladen -->
			<script type="text/javascript" src="../javascript/ReloadScripts.js"></script>
			<script type="text/javascript" src="../javascript/RedirectScripts.js"></script>
			<script type="text/javascript" src="../javascript/ButtonScripts.js"></script>
			
			<!-- Hier wird das Icon geladen -->
			<link rel="icon" type="image/x-icon" href="../content/Icon.png">
		
		<title>Stadtguide</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die ben�tigten Beans geladen -->
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
	
	
	
	<!-- Hier wird die Inhalt aus der Framework Bean geladen, in diesem Fall das Framework f�r den Aufbau der
		 gesamten JSP-Struktur(Header/Sidebars/Footer) -->
	<jsp:getProperty name="framework" property="framework"/>
	
	<!-- Hier wird der entsprechend relevante Inhalt der MessageBean geladen -->
	<div id="mainmsg">
	<jsp:getProperty name="message" property="mainMessage"/>
	</div>
	<div id="secondarymsg">
	<jsp:getProperty name="message" property="secondaryMessage"/>
	</div>
	
	<form action="../appls/CentralAppl.jsp" method="get" name="reload">
		<input type="hidden" name="msgCheck" id="msgCheck" value='<jsp:getProperty name="message" property="mainMessage"/>'/>
	</form>
	<script type="text/javascript">
		reloadCheck();
	</script>
	
			<!-- <div class='content'>
				<table>
					<tr>
						<td width="20%">
							Was suchen sie?<br>
									<select name="gesucht" onChange="showOption(this)">
										<option value="">Ausw�hlen</option>
										<option value="restaurant">Restaurant</option>
										<option value="unterkunft">Unterkunft</option>
										<option value="kultur">Kultur</option>
										<option value="aktivitaet">Aktivit�t</option>
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