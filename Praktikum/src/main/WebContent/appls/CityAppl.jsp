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
String searchBtn = request.getParameter("searchBtn");
String returnBtn = request.getParameter("returnBtn");
String addToBtn = request.getParameter("addToBtn");
String typeSearch = request.getParameter("typeSearch");
String animalsSearchString = request.getParameter("animalsSearch");
String childcareSearchString = request.getParameter("childcareSearch");
String restaurantSearchString = request.getParameter("restaurantSearch");

boolean animalsSearch = Boolean.parseBoolean(animalsSearchString);
boolean childcareSearch = Boolean.parseBoolean(childcareSearchString);
boolean restaurantSearch = Boolean.parseBoolean(restaurantSearchString);

if (searchBtn == null){searchBtn = "";}
if (returnBtn == null){returnBtn = "";}
if (addToBtn == null){addToBtn = "";}

if(searchBtn.equals("Suchen")){
	
	response.sendRedirect("../views/CityView.jsp");
}else if(returnBtn.equals("Zurueck")){
	
	response.sendRedirect("../views/CityView.jsp");
}else if(addToBtn.equals("Stadt hinzufuegen")){
	response.sendRedirect("../views/AddCityView.jsp");
}else { 
	response.sendRedirect("../views/CityView.jsp");
}
%>
</body>
</html>