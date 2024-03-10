<%@page import="beans.MessageBean"%>
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
<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
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
if (btnNew == null){btnNew= "";}


//Application
if (backBttn.equals("Zurueck")){

	response.sendRedirect("../views/CentralView.jsp");}
else if (confirmBttn.equals("Anlegen")){
	city.setCityName(nameCity);
	city.setPlz(plz);
	city.setPopulation(population);
	city.cityAnlegen();
	message.setCityMessage();
	response.sendRedirect("../views/CityView.jsp");	}
else if (btnNew.equals("btnNew")){
	message.setNewCity();
	response.sendRedirect("../views/AddCityView.jsp");	}
else{
	response.sendRedirect("../views/CentralView.jsp");}
%>
</body>
</html>