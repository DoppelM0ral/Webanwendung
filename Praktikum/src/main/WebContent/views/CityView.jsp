<%@page import="beans.CityBean"%>
<%@page import="beans.LoginBean"%>
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
					Unterkunftsart: <input type="text"  name="typeSearch" value=""><br>
					<input type="checkbox"  name="search" value="animalsSearch">Tiere erlaubt<br>
					<input type="checkbox"  name="search" value="childcareSearch">Kinderbetreuung<br>
					<input type="checkbox"  name="search" value="restaurantSearch" onclick="toggleRestaurantDetails()">Restaurant<br>
					<div id="restaurantDetails" style="display:none;">
                        <input type="checkbox"  name="searchRestaurant" value="searchVegetarian">Vegetarisch<br>
                        <input type="checkbox"  name="searchRestaurant" value="searchVegan">Vegan<br>
                        <input type="checkbox"  name="searchRestaurant" value="searchPescetarian">Pescetarisch<br>
                        <input type="checkbox"  name="searchRestaurant" value="searchHalal">Halal<br>
                        <input type="checkbox"  name="searchRestaurant" value="searchKosha">Koscher<br>
                    </div>
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
				</td>		
			</tr>

			
			<tr>
				<td align="center" width="50%">
					<input type="submit" class="button" name="returnBtn" value="Zurueck">
				</td>
				<td align="center">
					<input type="submit" class="button" name="addToBtn" value="Stadt hinzufuegen">
				</td>
			</tr>
		</table>
	</form>
	</div>
	
	
	
</html>