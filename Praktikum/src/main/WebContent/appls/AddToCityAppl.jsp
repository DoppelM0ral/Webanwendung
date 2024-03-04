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
<jsp:useBean id="city" class="beans.CityBean" scope="session"></jsp:useBean>
<%
String type = request.getParameter("accommodation");
String animalsString = request.getParameter("animals");
String childcareString = request.getParameter("childcare");
String restaurantString = request.getParameter("restaurant");
String vegetarianString = request.getParameter("vegetarian");
String veganString = request.getParameter("vegan");
String pescetarianString = request.getParameter("pescetarian");
String halalString = request.getParameter("halal");
String koshaString = request.getParameter("koscher");
String addToAccommodation = request.getParameter("addToAccommodation");
String addToRestaurant = request.getParameter("addToRestaurant");
String btnBack = request.getParameter("btnBack");

boolean animals = Boolean.parseBoolean(animalsString);
boolean childcare = Boolean.parseBoolean(childcareString);
boolean restaurant = Boolean.parseBoolean(restaurantString);
boolean vegetarian = Boolean.parseBoolean(vegetarianString);
boolean vegan = Boolean.parseBoolean(veganString);
boolean pescetarian = Boolean.parseBoolean(pescetarianString);
boolean halal = Boolean.parseBoolean(halalString);
boolean kosha = Boolean.parseBoolean(koshaString);

if (addToAccommodation == null){addToAccommodation = "";}
if (addToRestaurant == null){addToRestaurant = "";}
if (btnBack == null){btnBack = "";}

if(addToAccommodation.equals("Hinzufuegen")){
	city.setType(type);
	city.setAnimals(animals);
	city.setChildcare(childcare);
	city.setRestaurant(restaurant);
	city.accommodationAnlegen();
	response.sendRedirect("../views/CityView.jsp");
}else if(addToRestaurant.equals("Hinzufuegen")){
	city.setVegetarian(vegetarian);
	city.setVegan(vegan);
	city.setPescetarian(pescetarian);
	city.setHalal(halal);
	city.setKosha(kosha);
	city.restaurantAnlegen();
	response.sendRedirect("../views/CityView.jsp");
}else if(btnBack.equals("Zurueck")){
	response.sendRedirect("../views/CityView.jsp");
}else { 
	response.sendRedirect("../views/addToCityView.jsp");
}
%>
</body>
</html>