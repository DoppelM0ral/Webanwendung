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
	
	<jsp:getProperty name="city" property="addCityDiv"/>
	
	</div><!-- Dieses </div> schließt ein in der 20. Zeile eröffnetes <div> -->
	<jsp:getProperty name="framework" property="footer"/>
	</body>
</html>