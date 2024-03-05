<%@page import="beans.CityBean"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="city" class="beans.CityBean" scope="session"/>
<%

String nameCity = request.getParameter("nameCity");
String plz = request.getParameter("plz");
String population = request.getParameter("population");
String backBttn = request.getParameter("backBttn");
String confirmBttn = request.getParameter("confirmBttn");
String btnNew = request.getParameter("btnNew");

//NullCheck und Aufbereitung der parameter
if (backBttn == null){backBttn = "";}
if (confirmBttn == null){confirmBttn = "";}
if (btnNew == null){btnNew = "";}

//Application
//Back Button kann eigentlich weg ich habe den home button oben links implementiert 
//der führt immer zurück zur CentralView
if (backBttn.equals("Zurueck")){
	response.sendRedirect("../views/CentralView.jsp");}
else if (confirmBttn.equals("Anlegen")){
	city.setCityName(nameCity);
	city.setPlz(plz);
	city.setPopulation(population);
	city.cityAnlegen();
	response.sendRedirect("../views/CityView.jsp");	}
else if (btnNew.equals("btnNew")){
	//MessageBean muss noch bearbeitet werden die weiterleitung von der Central
	//Habe ich(Kai) eingefügt weil ich eine funktion gebraucht habe
	response.sendRedirect("../views/AddCityView.jsp");}
else{
	response.sendRedirect("../views/CentralView.jsp");}
%>
</body>
</html>