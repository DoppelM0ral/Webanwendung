<%@page import="beans.CityBean"%>
<%@page import="beans.MessageBean"%>
<%@page import="beans.FrameworkBean"%>
<%@page import="beans.AccountBean"%>
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
		<script type="text/javascript" src="../js/AddToCityJS.js"></script>
		<!-- Hier wird das Icon geladen -->
		<link rel="icon" type="image/x-icon" href="../content/Icon.png">
		
		<title>Stadtguide</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->
	<jsp:useBean id="account" class="beans.AccountBean" scope="session"/>	
	<jsp:useBean id="framework" class="beans.FrameworkBean" scope="session"/>	
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
	<jsp:useBean id="city" class="beans.CityBean" scope="session"/>
	
	
	<jsp:getProperty name="framework" property="framework"/>
	
	<div id="content"> 
		<form action="../appls/AddToCityAppl.jsp" method="get">
			<input type='radio' name='auswahl' value='unterkunft' onclick="showFields('unterkunft')"> Unterkunft
			<input type='radio' name='auswahl' value='restaurant' onclick="showFields('restaurant')"> Restaurant<br>
			
			<input type="submit" class="button" name="btnBack" value="Zurueck">
		</form>
		<br>
		<br>
		<br>
		<br>
				<div id='unterkunftFields' style='display: none;'>
		        <h3>Unterkunft hinzuf&uuml;gen</h3>
		        	<form action='../appls/AddToCityAppl.jsp' method='get'>
		       			<table>
		        			<tr>
		        				<td>Unterkunftsart:</td>
		        				<td><input type="text" name="accommodation" value=""></td>
		        			</tr>
		        			<tr>
		        				<td>Sind Tiere erlaubt?</td>
		        				<td>
		        					<input type="radio" name="animals" value="yes">Ja <br>
		        					<input type="radio" name="animals" value="nein">Nein <br>
		        				</td>
		        			</tr>
		        			<tr>
		        				<td>Gibt es Kinderbetreuung?</td>
		        				<td>
		        					<input type="radio" name="childcare" value="yes">Ja <br>
		        					<input type="radio" name="childcare" value="nein">Nein <br>
		        				</td>
		        			</tr>
		        			<tr>
		        				<td>Gibt es ein Restaurant?</td>
		        				<td>
		        					<input type="radio" name="restaurant" value="yes">Ja <br>
		        					<input type="radio" name="restaurant" value="nein">Nein <br>
		        				</td>
		        			</tr>
		        		</table>
		        		<input type='submit' class='button' name='addToAccommodation' value='Hinzufuegen'>
		        	</form>
		        </div>

		    	<div id="restaurantFields" style="display: none;">
		        <h3>Restaurant hinzuf&uuml;gen</h3>
		        	<form action="../appls/AddToCityAppl.jsp" method="get">
		        		<input type="checkbox" name="restaurantFood" value="vegetarian">Vegetarisch <br>
		        		<input type="checkbox" name="restaurantFood" value="vegan">Vegan <br>
		        		<input type="checkbox" name="restaurantFood" value="pescetarian">Pescetarisch <br>
		        		<input type="checkbox" name="restaurantFood" value="halal">Halal <br>
		        		<input type="checkbox" name="restaurantFood" value="kosha">Koscher <br>
		        		<input type="submit" class="button" name="addToRestaurant" value="Hinzufuegen">
		        	</form>
		        </div>
	</div>
	
	
	</div><!-- Dieses </div> schließt ein in der 20. Zeile eröffnetes <div> -->
	<jsp:getProperty name="framework" property="footer"/>
	</body>
</html>