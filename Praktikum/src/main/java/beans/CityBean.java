package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import jdbc.NoConnectionException;
import jdbc.PostgreSQLAccess;

public class CityBean {
	
	boolean a;
	String search;
	String idAccommodation;
	String idRestaurant;
	String cityName;
	String plz;
	String population;
	String veganString = "true";
	boolean vegan;
	String vegetarianString = "true";
	boolean vegetarian;
	String halalString = "true";
	boolean halal;
	String pescetarianString = "true";
	boolean pescetarian;
	String koshaString = "true";
	boolean kosha;
	String hotel;
	String airbnb;
	String motel;
	String type;
	String animalsString;
	boolean animals;
	String childcareString;
	boolean childcare;
	String restaurantString;
	boolean restaurant;
	
	
	Connection dbConn;
	
	//Von Caro Angelegt
	
	public CityBean() throws NoConnectionException{
		this.dbConn = new PostgreSQLAccess().getConnection();
		this.initialize();
	}
	
	public void initialize() {
		this.cityName = ""; 
		this.plz = "";
		this.population = "";
		this.vegan = false;
		this.vegetarian = false;
		this.pescetarian = false;
		this.halal = false;
		this.kosha = false;
		this.animals = false;
		this.hotel = "";
		this.airbnb = "";
		this.motel = "";
		this.childcare = false;
		this.restaurant = false;
		this.search = "";
	}
	
	
	
	public String getSearchResults() throws NoConnectionException, SQLException{

		System.out.println("in der methode");
		String output = "";
		String sql = "SELECT * FROM " + this.search;
		if (this.search.equals("restaurant")) {
            sql = "SELECT r.*, b.name AS base_name, b.reference AS base_reference, b.street AS base_street, b.housenumber AS base_number " +
                  "FROM restaurant r " +
                  "JOIN base b ON r.refid = b.refid " +
                  "WHERE 1=1 "; // Dummy-Bedingung, um die WHERE-Klausel korrekt zu bilden

            if (this.vegetarian) {
                sql += "AND r.vegetarian = true ";
            }
            if (this.vegan) {
                sql += "AND r.vegan = true ";
            }
            if (this.pescetarian) {
                sql += "AND r.pescetarian = true ";
            }
            if (this.halal) {
                sql += "AND r.halal = true ";
            }
            if (this.kosha) {
                sql += "AND r.kosha = true ";
            }
        } else if (this.search.equals("accommodation")) {
            sql = "SELECT a.*, b.name AS base_name, b.reference AS base_reference, b.street AS base_street, b.housenumber AS base_number " +
                  "FROM accommodation a " +
                  "JOIN base b ON a.refid = b.refid " +
                  "WHERE 1=1 "; // Dummy-Bedingung, um die WHERE-Klausel korrekt zu bilden

            if (airbnb != null && !airbnb.isEmpty()) {
                sql += "AND a.type = 'airbnb'";
            }
            if (hotel != null && !hotel.isEmpty()) {
                sql += "AND a.type = 'hotel'";
            }
            if (motel != null && !motel.isEmpty()) {
                sql += "AND a.type = 'motel' ";
            }
            
        
        }else {
            // Behandeln Sie den Fall, wenn this.search nicht "restaurant" oder "accommodation" entspricht
            // Hier k�nnen Sie eine Standardabfrage festlegen oder eine Fehlermeldung generieren
            // Zum Beispiel:
            throw new IllegalArgumentException("Ung�ltiger Suchtyp: " + this.search);
        }
		System.out.println("methode wird ausgefuehrt");
		ResultSet dbRes = this.dbConn.prepareStatement(sql).executeQuery();
		while(dbRes.next()) {
			System.out.println("funktioniertVor");
			output += dbRes.getString("base_reference")+ (":&nbsp;") + dbRes.getString("base_name") + (",&nbsp;") + dbRes.getString("base_street") + ("&nbsp;") + dbRes.getString("base_number") +"\n<br>";
			System.out.println("funktioniertNach");
		} System.out.println("schleife uebersprungen");
		return output;
		
	}
	
	public boolean cityCheck() throws SQLException{
		//true - Stadt existiert - liegt in der Datenbank vor
		//false - Stadt existiert - liegt nicht in der Datenbank vor
		String sql = "select name from city where plz = ?";
		System.out.println(sql);
		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		prep.setString(1, this.plz);
		ResultSet dbRes = prep.executeQuery();
		boolean check = dbRes.next();
		return check;
	}
	
	public void cityAnlegen() throws SQLException{
		String sql = "insert into city (plz, name, population) values (?,?,?)";
		System.out.println(sql);
		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		prep.setString(1, this.plz);
		prep.setString(2, this.cityName);
		prep.setString(3, this.population);
		prep.executeUpdate();
		System.out.println("Die Stadt " + this.cityName + " mit der Postleitzahl " + this.plz + " wurde erfolgreich angelegt.");
	}
	
	public String findNextAvailableIdAccommodation() throws SQLException {
        String sql = "SELECT AID FROM accommodation";
        PreparedStatement prep = this.dbConn.prepareStatement(sql);
        ResultSet resultSet = prep.executeQuery();

        List<String> existingIds = new ArrayList<>();

        while (resultSet.next()) {
            existingIds.add(resultSet.getString("AID"));
        }

        // Schleife, um die n�chste verf�gbare ID zu finden
        int counter = 1;
        while (true) {
            String potentialId = "A" + counter;
            if (!existingIds.contains(potentialId)) {
                return potentialId; // Die n�chste verf�gbare ID gefunden
            }
            counter++;
        }
    }
	
	public void accommodationAnlegen() throws SQLException {
		this.idAccommodation = findNextAvailableIdAccommodation();
		String sql = "insert into accommodation (AID, type, animals, childcare, restaurant, RID) values (?,?,?,?,?,?)";
		System.out.println(sql);
		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		prep.setString(1, this.idAccommodation);
		prep.setString(2, this.type);
		prep.setBoolean(3, this.animals);
		prep.setBoolean(4, this.childcare);
		prep.setBoolean(5, this.restaurant);
		prep.executeUpdate();
		System.out.println();
	}
	
//	public boolean restaurantCheck() throws SQLException {
//	    String sql = "SELECT id FROM restaurant WHERE UPPER(name) = UPPER(?)";
//	    PreparedStatement prep = this.dbConn.prepareStatement(sql);
//	    prep.setString(1, this.newRestName);
//	    ResultSet dbRes = prep.executeQuery();
//	    boolean check = dbRes.next();
//	    return check;
//	}
	
	public String findNextAvailableIdRestaurant() throws SQLException {
        String sql = "SELECT RID FROM restaurant";
        PreparedStatement prep = this.dbConn.prepareStatement(sql);
        ResultSet resultSet = prep.executeQuery();

        List<String> existingIds = new ArrayList<>();

        while (resultSet.next()) {
            existingIds.add(resultSet.getString("RID"));
        }

        // Schleife, um die n�chste verf�gbare ID zu finden
        int counter = 1;
        while (true) {
            String potentialId = "R" + counter;
            if (!existingIds.contains(potentialId)) {
                return potentialId; // Die n�chste verf�gbare ID gefunden
            }
            counter++;
        }
    }
	
	public void restaurantAnlegen() throws SQLException {
		this.idRestaurant = findNextAvailableIdRestaurant();
		String sql = "insert into restaurant (RID, vegetarian, vegan, pescetarian, halal, kosha) values (?,?,?,?,?,?)";
		System.out.println(sql);
		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		prep.setString(1, this.idRestaurant);
		prep.setBoolean(2, this.vegetarian);
		prep.setBoolean(3, this.vegan);
		prep.setBoolean(4, this.pescetarian);
		prep.setBoolean(5, this.halal);
		prep.setBoolean(6, this.kosha);
		prep.executeUpdate();
		System.out.println();
	}
	
	
	
	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getHotel() {
		return hotel;
	}

	public void setHotel(String hotel) {
		this.hotel = hotel;
	}

	public String getAirbnb() {
		return airbnb;
	}

	public void setAirbnb(String airbnb) {
		this.airbnb = airbnb;
	}

	public String getMotel() {
		return motel;
	}

	public void setMotel(String motel) {
		this.motel = motel;
	}

	public String getCityName() {
		return cityName;
	}

	public void setCityName(String cityName) {
		this.cityName = cityName;
	}

	public String getPlz() {
		return plz;
	}

	public void setPlz(String plz) {
		this.plz = plz;
	}

	public String getPopulation() {
		return population;
	}

	public void setPopulation(String population) {
		this.population = population;
	}

	public Connection getDbConn() {
		return dbConn;
	}

	public void setDbConn(Connection dbConn) {
		this.dbConn = dbConn;
	}

	public String getIdAccommodation() {
		return idAccommodation;
	}

	public void setIdAccommodation(String idAccommodation) {
		this.idAccommodation = idAccommodation;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public boolean isAnimals() {
		return animals;
	}

	public void setAnimals(boolean animals) {
		this.animals = animals;
	}

	public boolean isChildcare() {
		return childcare;
	}

	public void setChildcare(boolean childcare) {
		this.childcare = childcare;
	}

	public boolean isRestaurant() {
		return restaurant;
	}

	public void setRestaurant(boolean restaurant) {
		this.restaurant = restaurant;
	}

	public String getIdRestaurant() {
		return idRestaurant;
	}

	public void setIdRestaurant(String idRestaurant) {
		this.idRestaurant = idRestaurant;
	}

	public boolean isVegan() {
		return vegan;
	}

	public void setVegan(boolean vegan) {
		this.vegan = vegan;
	}

	public boolean isVegetarian() {
		return vegetarian;
	}

	public void setVegetarian(boolean vegetarian) {
		this.vegetarian = vegetarian;
	}

	public boolean isHalal() {
		return halal;
	}

	public void setHalal(boolean halal) {
		this.halal = halal;
	}

	public boolean isPescetarian() {
		return pescetarian;
	}

	public void setPescetarian(boolean pescetarian) {
		this.pescetarian = pescetarian;
	}

	public boolean isKosha() {
		return kosha;
	}

	public void setKosha(boolean kosha) {
		this.kosha = kosha;
	}

	
	public String getAddCityDiv() {
		String addCityDiv = "	<div id='content'>\n"
						+ "			<form action='../appls/AddCityAppl.jsp' method='get'>" + 
						"			<table>\n" +   
						"				<tr>\n" + 
						"					<td>\n" + 
						"						Name der Stadt:\n" + 
						"					</td>\n" + 
						"					<td>\n" + 
						"						<input type='text' name='plz' value=''>\n" + 
						"					</td>\n" + 
						"				</tr>\n" + 
						"				<tr>\n" + 
						"					<td>\n" + 
						"						Postleitzahl:\n" + 
						"					</td>\n" + 
						"					<td>\n" + 
						"						<input type='text' name='plz' value=''>\n" + 
						"					</td>\n" + 
						"				</tr>\n" +  
						"				<tr>\n" + 
						"					<td>\n" + 
						"						Einwohneranzahl:\n" + 
						"					</td>\n" + 
						"					<td>\n" + 
						"						<input type='text' name='population' value=''>\n" + 
						"					</td>\n" +
						"				</tr>\n" + 
						"				<tr>\n" + 
						"					<td colspan=2 align=center>\n" + 
						"						<input class='button' type='submit'  name='backBttn' value='Zurueck'>\n" +
						"						<input class='button' type='submit'  name='confirmBttn' value='Anlegen'>\n" + 
						"					</td>\n" + 
						"				</tr>\n" + 
						"			</table>\n" + 
						"		</form>" + 
						"		</div>";
		return addCityDiv;
	}
	
	
	//Von Kai Angelegt
		public String getAllCitysName() throws SQLException {
			String output = "";
			String sql = "SELECT * FROM city";
			ResultSet dbRes = this.dbConn.prepareStatement(sql).executeQuery();
			while(dbRes.next()) {
				output += "<option value="+ dbRes.getString("name") +">" + dbRes.getString("name") + " - " + dbRes.getString("plz") + "</option>\n<br>";
			}
			return output;
		}

		public String getAllCitysPLZ() throws SQLException {
			String output = "";
			String sql = "SELECT* FROM city";
			ResultSet dbRes = this.dbConn.prepareStatement(sql).executeQuery();
			while(dbRes.next()) {
				output += "<option value="+ dbRes.getString("plz") +">" + dbRes.getString("plz") + " - " + dbRes.getString("name") + "</option>\n<br>";
			}
			return output;
		}
		
		public void selectCityWithPLZ(String plz) throws SQLException {
			String sql = "SELECT * FROM city WHERE plz = ?";
			PreparedStatement prep = this.dbConn.prepareStatement(sql);
			prep.setString(1, plz);
			ResultSet dbRes = prep.executeQuery();
			while(dbRes.next()) {
				setPlz(dbRes.getString("plz"));
				setCityName(dbRes.getString("name"));
				setPopulation(dbRes.getString("population"));
			}
		}
		
		public void selectCityWithName(String name) throws SQLException {
			String sql = "SELECT * FROM city WHERE name = ?";
			PreparedStatement prep = this.dbConn.prepareStatement(sql);
			prep.setString(1, name);
			ResultSet dbRes = prep.executeQuery();
			while(dbRes.next()) {
				setPlz(dbRes.getString("plz"));
				setCityName(dbRes.getString("name"));
				setPopulation(dbRes.getString("population"));
			}
		}
	
	


	
}
