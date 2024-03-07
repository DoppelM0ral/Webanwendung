<%@page import="org.postgresql.translation.messages_bg"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">		
		<title>Stadt Erweitern</title>
	</head>
	<body>
	<!-- In diesem Bereich werden die benötigten Beans geladen -->
	<jsp:useBean id="account" class="beans.AccountBean" scope="session"/>	
	<jsp:useBean id="login" class="beans.LoginBean" scope="session"/>
	<jsp:useBean id="city" class="beans.CityBean" scope="session"/>
	<jsp:useBean id="message" class="beans.MessageBean" scope="session"/>
	<jsp:useBean id="add" class="beans.AddBean" scope="session"/>
	
		<!-- Redirect wenn nicht logged in -->
	<form action="../appls/CentralAppl.jsp" method="get" name="redirect">
		<input type="hidden" id="loginCheck" name="loginCheck" value="<jsp:getProperty name="login" property="loggedIn"/>"/>
	</form>
	<script type="text/javascript">
		loginFalseCheck();
	</script>
	
		<%
			//HTTP Übernahme
			String search 		= request.getParameter("search");
			String name	  		= request.getParameter("name");
			String plz	  		= request.getParameter("plz");
			String street 		= request.getParameter("street");
			String housenumber 	= request.getParameter("housenumber");
			String price 		= request.getParameter("price");
			String veg			= request.getParameter("veg");
			String vegan 		= request.getParameter("vegan");
			String pesc 		= request.getParameter("pesc");
			String halal 		= request.getParameter("halal");
			String kosha 		= request.getParameter("kosha");
			String type 		= request.getParameter("type");
			String pets 		= request.getParameter("pets");
			String kids 		= request.getParameter("kids");
			String rest 		= request.getParameter("rest");
			String btnAdd 		= request.getParameter("btnAdd");
			
			//Initialisierung boolean Werte
			boolean booleanveg	 	= false;
			boolean	booleanvegan 	= false;
			boolean	booleanpesc		= false; 
			boolean	booleanhalal	= false;
			boolean	booleankosha	= false;
			boolean	booleanpets		= false;
			boolean	booleankids		= false;
			boolean	booleanrest		= false;
			
			
			//null-check
			if(btnAdd == null)	{btnAdd = "";}
			if(veg == null)		{veg = "";}
			if(vegan == null)	{vegan = "";}		
			if(pesc == null)	{pesc = "";}	
			if(halal == null)	{halal = "";}
			if(kosha == null)	{kosha = "";}
			if(pets == null)	{pets = "";}
			if(kids == null)	{kids = "";}	
			if(rest == null)	{rest = "";}
			
			//Aufbearbeitung Restaurant
			if(veg.equals("veg"))		{booleanveg = true;}
			if(vegan.equals("vegan"))	{booleanvegan = true;}		
			if(pesc.equals("pesc"))		{booleanpesc = true;}	
			if(halal.equals("halal"))	{booleanhalal = true;}
			if(kosha.equals("kosha"))	{booleankosha = true;}
			
			//Aufbearbeitung Unterkunft
			if(pets.equals("pets"))		{booleanpets = true;}
			if(kids.equals("kids"))		{booleankids = true;}		
			if(rest.equals("rest"))		{booleanrest = true;}	
			
			//Tatsächliche Verarbeitung
			if(!btnAdd.equals("")){
				
				add.setSearch(search);
				add.setName(name);
				add.setStreet(street);
				add.setPlz(plz);
				add.setHousenumber(housenumber);
				add.setPrice(price);
				
				if(btnAdd.equals("Restaurant anlegen")){
					add.setVeg(booleanveg);
					add.setVegan(booleanvegan);
					add.setPesc(booleanpesc);
					add.setHalal(booleanhalal);
					add.setKosha(booleankosha);
					add.createRestaurant();
					add.createBase();
					message.setAddResSuccess(); 
					
					response.sendRedirect("../views/CityView.jsp");
				}else if(btnAdd.equals("Unterkunft anlegen")){
					add.setType(type);
					add.setPets(booleanpets);
					add.setKids(booleankids);
					add.setRest(booleanrest);
					add.createAccommodation();
					add.createBase();
					message.setAddAccSuccess();
					
					response.sendRedirect("../views/CityView.jsp");
				}	
			}
			
		
		%>

	</body>
</html>