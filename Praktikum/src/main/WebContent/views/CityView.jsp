<%@page import="beans.CityBean"%>
<%@page import="beans.LoginBean"%>
<%@page import="beans.MessageBean"%>
<%@page import="beans.FrameworkBean"%>
<%@page import="beans.AccountBean"%>
<%@ page import="java.util.List" %>
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
		<script type="text/javascript" src="../javascript/RedirectScripts.js"></script>
		<script type="text/javascript" src="../javascript/ButtonScripts.js"></script>
		<script type="text/javascript" src="../js/CityJS.js"></script>
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
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
	
	<!-- Redirect wenn nicht logged in -->
	<form action="../appls/CentralAppl.jsp" method="get" name="redirect">
		<input type="hidden" id="loginCheck" name="loginCheck" value="<jsp:getProperty name="login" property="loggedIn"/>"/>
	</form>
	<script type="text/javascript">
		loginFalseCheck();
	</script>
	
	<jsp:getProperty name="framework" property="framework"/>
	
	<div id="content">
	<form action="../appls/CityAppl.jsp" method="get">
		<table id="main">
			<tr>
				<td id="message" colspan="2" align="center">
					<p>Die Stadt <jsp:getProperty name="city" property="cityName"/> 
			 		mit der Postleitzahl <jsp:getProperty name="city" property="plz"/>
			 		hat <jsp:getProperty name="city" property="population"/> Einwohner.</p>
			 	</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<p><h4>Was suchen Sie?</h4></p>
				</td>
			</tr>

	
			<tr>
				<td colspan="2" align="center">
					<input type="radio" id=accommodationRadio name="searchType" value="accommodation" onclick="showHideFields()">Unterkunft
					<input type="radio" id="restaurantRadio" name="searchType" value="restaurant" onclick="showHideFields()">Restaurant<br>
				</td>
			</tr>

	


			<tr>
				<td id="accommodationFields" style="display: none;" colspan="2" align="center" >
					Unterkunftsart: <select name="accommodationType">
										<option value="vorschau">Aussuchen</option>
										<option value="hotel">Hotel</option>
										<option value="airbnb">AirBnB</option>
										<option value="motel">Motel</option>
									</select><br>
					<input type="checkbox"  name="animalsSearch" value="animalsSearch">Tiere erlaubt<br>
					<input type="checkbox"  name="childcareSearch" value="childcareSearch">Kinderbetreuung<br>
					<input type="checkbox"  name="restaurantSearch" value="restaurantSearch">Restaurant<br>
				</td>
			</tr>

			

			<tr>
				<td id="restaurantFields" style="display: none;" colspan="2" align="center">
						<input type="checkbox"  name="searchVegetarian" value="searchVegetarian">Vegetarisch<br>
                        <input type="checkbox"  name="searchVegan" value="searchVegan">Vegan<br>
                        <input type="checkbox"  name="searchPescetarian" value="searchPescetarian">Pescetarisch<br>
                        <input type="checkbox"  name="searchHalal" value="searchHalal">Halal<br>
                        <input type="checkbox"  name="searchKosha" value="searchKosha">Koscher<br>
				</td>
			</tr>

			<tr>
				<td colspan="2" align="center">
					<p><input type="submit" class="button" name="searchBtn" value="Suchen"></p>
				</td>
			</tr>

			<tr>			
				<td colspan="2" align="center">
					<p>Für ihre Suche sind die folgenden Ergebnisse vorhanden: </p>	
					<%
					String searchResults = (String) session.getAttribute("searchResults"); 
					if(searchResults != null && !searchResults.isEmpty()) {
					%>
					<%= session.getAttribute("searchResults") %>
					<%
    				// Nachdem die Suchergebnisse angezeigt wurden, löschen Sie sie aus der Sitzung
    				session.removeAttribute("searchResults");
					}
					%>
				</td>		
			</tr>
			
			<tr>
				<td align="center" width="50%">
					<input type="submit" class="button" name="centerBtn" value="Startseite">
				</td>
				<td align="center">
					<input type="submit" class="button" name="addToCityBtn" value="zur Stadt hinzufuegen">
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	
</html>