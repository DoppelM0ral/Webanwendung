<%@page import="beans.CityBean"%>
<%@ page import="java.util.List" %>
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
String searchBtn = request.getParameter("searchBtn");
String centerBtn = request.getParameter("centerBtn");
String addToCityBtn = request.getParameter("addToCityBtn");
String accommodationType = request.getParameter("accommodationType");
String animalsSearchString = request.getParameter("animalsSearch");
String childcareSearchString = request.getParameter("childcareSearch");
String restaurantSearchString = request.getParameter("restaurantSearch");
String vegetarianSearchString = request.getParameter("vegetarianSearch");
String veganSearchString = request.getParameter("veganSearch");
String pescetarianSearchString = request.getParameter("pescetarianSearch");
String halalSearchString = request.getParameter("halalSearch");
String koshaSearchString = request.getParameter("koshaSearch");

boolean animalsSearch = Boolean.parseBoolean(animalsSearchString);
boolean childcareSearch = Boolean.parseBoolean(childcareSearchString);
boolean restaurantSearch = Boolean.parseBoolean(restaurantSearchString);
boolean vegetarianSearch = Boolean.parseBoolean(vegetarianSearchString);
boolean veganSearch = Boolean.parseBoolean(veganSearchString);
boolean pescetarianSearch = Boolean.parseBoolean(pescetarianSearchString);
boolean halalSearch = Boolean.parseBoolean(halalSearchString);
boolean koshaSearch = Boolean.parseBoolean(koshaSearchString);

String hotel = "";
String airbnb = "";
String motel = "";

if (searchBtn == null){searchBtn = "";}
if (centerBtn == null){centerBtn = "";}
if (addToCityBtn == null){addToCityBtn = "";}

if(searchBtn.equals("Suchen")){
	out.println("button funktioniert");
	city.setAirbnb(airbnb);
	city.setHotel(hotel);
	city.setMotel(motel);
	city.setAnimals(animalsSearch);
	city.setChildcare(childcareSearch);
	city.setRestaurant(restaurantSearch);
	city.setVegetarian(vegetarianSearch);
	city.setVegan(veganSearch);
	city.setPescetarian(pescetarianSearch);
	city.setHalal(halalSearch);
	city.setKosha(koshaSearch);
	System.out.println("settings funktionieren");
	if (accommodationType != null) {
        if (accommodationType.equals("hotel") || accommodationType.equals("airbnb") || accommodationType.equals("motel")) {
        	System.out.println("in accommodation rein");
            // Der Benutzer sucht nach Unterkünften
            // Setzt den Wert der Variable 'search' in Bean auf 'accommodation'
            city.setSearch("accommodation");
        } else {
            // Der Benutzer sucht nach Restaurants
            // Setzt den Wert der Variable 'search' in Bean auf 'restaurant'
            System.out.println("in restaurant rein");
            city.setSearch("restaurant");
        }
    }
	System.out.println("if ging durch");
	String searchResults = city.getSearchResults();
	session.setAttribute("searchResults", searchResults);
	System.out.println("methode");
	
	response.sendRedirect("../views/CityView.jsp");
}else if(centerBtn.equals("Startseite")){
	
	response.sendRedirect("../views/CentralView.jsp");
}else if(addToCityBtn.equals("zur Stadt hinzufuegen")){
	response.sendRedirect("../views/AddToCityView.jsp");
}else { 
	response.sendRedirect("../views/CityView.jsp");
}
%>
</body>
</html>