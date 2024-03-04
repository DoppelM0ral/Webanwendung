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

//NullCheck und Aufbereitung der parameter
if (backBttn == null){backBttn = "";}
if (confirmBttn == null){confirmBttn = "";}


//Application
if (backBttn.equals("Zurueck")){
	response.sendRedirect("../views/CentralView.jsp");}
else if (confirmBttn.equals("Anlegen")){
	city.setCityName(nameCity);
	city.setPlz(plz);
	city.setPopulation(population);
	city.cityAnlegen();
	response.sendRedirect("../views/CityView.jsp");	}
else{
	response.sendRedirect("../views/CentralView.jsp");}
%>
</body>
</html>