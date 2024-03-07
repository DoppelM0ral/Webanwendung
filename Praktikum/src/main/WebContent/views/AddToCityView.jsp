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
			<link rel="stylesheet" type="text/css" href="../css/AddToCityCSS.css">
			<!-- In diesem Bereich wird das zentrale JavaScript geladen -->
			
			
			<!-- Hier werden relevante JavaScript Files geladen -->
			<script type="text/javascript" src="../javascript/ReloadScripts.js"></script>
			<script type="text/javascript" src="../javascript/RedirectScripts.js"></script>
			<script type="text/javascript" src="../javascript/ButtonScripts.js"></script>
			<script type="text/javascript" src="../javascript/SearchScripts.js"></script>
			
			<!-- Hier wird das Icon geladen -->
			<link rel="icon" type="image/x-icon" href="../content/Icon.png">
		
		<title>Stadt Erweitern</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->
	<jsp:useBean id="account" class="beans.AccountBean" scope="session"/>	
	<jsp:useBean id="framework" class="beans.FrameworkBean" scope="session"/>	
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
	<jsp:useBean id="city" class="beans.CityBean" scope="session"/>
	
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
		<form action="../appls/AddToCityAppl.jsp" method="get" name="searchform">
			<table>
				<!-- Initiale Frage -->
				<tr>
					<td colspan="2">
						Was möchtest du anlegen?
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<select id="search" name="search" onChange="showSpecific(this)">
							<option value="">Auswählen</option>
							<option value="Restaurant">Restaurant</option>
							<option value="Unterkunft">Unterkunft</option>
						</select>
					</td>
				</tr>
				<!-- Grunddaten öffnet sich wenn Ausgewählt -->
				<tr>
					<td class="basicinfo info" colspan="2">
						<p>Bitte gib hier die Grunddaten an:</p>
					</td>
				</tr>
				<tr>
					<td class="basicinfo">
						Name:
					</td>
					<td class="basicinfo">
						<input type="text" name="name"/>
					</td>
				</tr>
				<tr>
					<td>
						<input type="hidden" name="plz" value="<jsp:getProperty name='city' property='plz'/>">
					</td>
				</tr>
				<tr>
					<td class="basicinfo">
						Straße:
					</td>
					<td class="basicinfo">
						<input type="text" name="street"/>
					</td>
				</tr>
				<tr>
					<td class="basicinfo">
						Hausnummer: &nbsp;
					</td>
					<td class="basicinfo">
						<input type="text" name="housenumber"/>
					</td>
				</tr>
				<tr>
					<td class="basicinfo">
						Preisniveua: 
					</td>
					<td class="basicinfo">
						 <select name="price">
							<option>Günstig </option>
							<option>Normal </option>
							<option>Teuer </option>
						</select>
					</td>
				</tr>
				<!-- Von Auswahl abhängig sichtbare spezifische Eigenschaften -->	
				<tr>
					<td class="basicinfo info" colspan="2">
						<p>Bitte gib hier spezifische Eigenschaften an:</p>
					</td>
				</tr>
				<!-- Restaurant -->
				<tr>
					<td class="basicinfo restaurant" colspan="2">
						<input class="restaurant" type="checkbox" id="veg" name="veg" value="veg"> Vegetarisch<br>
						<input class="restaurant" type="checkbox" id="vegan" name="vegan" value="vegan"> Vegan<br>
						<input class="restaurant" type="checkbox" id="pesc" name="pesc" value="pesc"> Pescetarisch<br>
						<input class="restaurant" type="checkbox" id="halal" name="halal" value="halal"> Halal<br>
						<input class="restaurant" type="checkbox" id="kosha" name="kosha" value="kosha"> Kosha<br>
						
					</td>
				</tr>
				<!-- Accommodation -->
				<tr class="accommodation" >
					<td class="basicinfo accommodation">
						Unterkunftsart: 
					</td>
					<td class="basicinfo accommodation" >
						 <select class="accommodation"  name="type">
							<option>AirBnB</option>
							<option>Hotel</option>
							<option>Motel</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="basicinfo accommodation" colspan="2">
						
						<input class="accommodation" type="checkbox" id="pets" name="pets" value="pets"> Haustiere erlaubt<br>
						<input class="accommodation" type="checkbox" id="kids" name="kids" value="kids"> Kinderbetreung<br>
						<input class="accommodation" type="checkbox" id="rest" name="rest" value="rest"> Restaurant inkl.<br>
						
					</td>
				</tr>
				<tr>
					<td class="basicinfo info" colspan="2">
						<input type="submit" class="button" id="submit" name="btnAdd" value=""/>
					</td>
				</tr>
			</table>
		</form>
	</div>
	
	
	</div><!-- Dieses </div> schließt ein in der 20. Zeile eröffnetes <div> -->
	<jsp:getProperty name="framework" property="footer"/>
	</body>
</html>