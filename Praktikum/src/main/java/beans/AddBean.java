package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;

import jdbc.NoConnectionException;
import jdbc.PostgreSQLAccess;

public class AddBean {
	
	String search; 		
	String name;
	String street; 		
	String housenumber; 	
	String price; 	
	boolean veg;		
	boolean vegan; 		
	boolean pesc; 		
	boolean halal; 	
	boolean kosha;	
	String type; 	
	boolean pets; 	
	boolean kids; 	
	boolean rest;
	String plz;
	int ID;
	String btnAdd;
	Connection dbConn;	
	
	
	public AddBean() throws NoConnectionException{
		this.dbConn = new PostgreSQLAccess().getConnection();
	}
	

	
	//Funktion Unterkunft anlegen
	public void createAccommodation() throws SQLException {
		String sql = "INSERT INTO accommodation (type, animals, childcare, restaurant) values (?,?,?,?)";
		PreparedStatement prep = this.dbConn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		prep.setString(1, this.type);
		prep.setBoolean(2, this.pets);
		prep.setBoolean(3, this.kids);
		prep.setBoolean(4, this.rest);
		prep.executeUpdate();
		System.out.println("Unterkunft " + this.name +  " erfolgreich angelegt");
		
		ResultSet dbRes = prep.getGeneratedKeys();

		while(dbRes.next()) {
			this.ID = dbRes.getInt("refid");
		}
	}
	
	//Funktion Restaurant in Datenbank anlegen
	public void createRestaurant() throws SQLException {
		String sql = "INSERT INTO restaurant (vegetarian, vegan, pescetarian, halal, kosha) values (?,?,?,?,?)";
		PreparedStatement prep = this.dbConn.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);
		prep.setBoolean(1, this.veg);
		prep.setBoolean(2, this.vegan);
		prep.setBoolean(3, this.pesc);
		prep.setBoolean(4, this.halal);
		prep.setBoolean(5, this.kosha);
		prep.executeUpdate();
		System.out.println("Restaurant " + this.name +  " erfolgreich angelegt");
		
		ResultSet dbRes = prep.getGeneratedKeys();

		while(dbRes.next()) {
			this.ID = dbRes.getInt("refid");
		}
		
	}
	
	//Funktion Basisinformationen anlegen
	public void createBase() throws SQLException {
		String sql = "INSERT INTO base (refid, reference, name, plz, street, housenumber, prices) values (?,?,?,?,?,?,?)";
		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		prep.setInt(1, this.ID);
		prep.setString(2, this.search);
		prep.setString(3, this.name);
		prep.setString(4, this.plz);
		prep.setString(5, this.street);
		prep.setString(6, this.housenumber);
		prep.setString(7, this.price);
		prep.executeUpdate();
		System.out.println("Base " + this.name +  " erfolgreich angelegt");
	}
	
	//Check ob schon angelegt
	public boolean checkAdressExist() throws SQLException{
		String sql = "SELECT * FROM base WHERE (plz, street, housenumber) = (?,?,?)";
		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		prep.setString(1, this.plz);
		prep.setString(2, this.street);
		prep.setString(3, this.housenumber);
		ResultSet dbRes = prep.executeQuery();	
		return dbRes.next();
	}
	
	//Setzt alle Strings auf null, Ints auf 0, und Booleans auf false
	public void whipeValues(){
		this.search 	 = null; 		
		this.name 		 = null;
		this.street 	 = null; 		
		this.housenumber = null; 	
		this.price 		 = null; 	
		this.veg 		 = false;		
		this.vegan 		 = false; 		
		this.pesc 		 = false; 		
		this.halal 		 = false; 	
		this.kosha 		 = false;	
		this.type 		 = null; 	
		this.pets 		 = false; 	
		this.kids 		 = false; 	
		this.rest		 = false;
		this.plz 		 = null;
		this.ID 		 = 0;
		this.btnAdd		 = null;
	}
	
	//Getter und Setter
	public String getPlz() {
		return plz;
	}

	public void setPlz(String plz) {
		this.plz = plz;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getStreet() {
		return street;
	}

	public void setStreet(String street) {
		this.street = street;
	}

	public String getHousenumber() {
		return housenumber;
	}

	public void setHousenumber(String housenumber) {
		this.housenumber = housenumber;
	}

	public String getPrice() {
		return price;
	}

	public void setPrice(String price) {
		this.price = price;
	}

	public boolean isVeg() {
		return veg;
	}

	public void setVeg(boolean veg) {
		this.veg = veg;
	}

	public boolean isVegan() {
		return vegan;
	}

	public void setVegan(boolean vegan) {
		this.vegan = vegan;
	}

	public boolean isPesc() {
		return pesc;
	}

	public void setPesc(boolean pesc) {
		this.pesc = pesc;
	}

	public boolean isHalal() {
		return halal;
	}

	public void setHalal(boolean halal) {
		this.halal = halal;
	}

	public boolean isKosha() {
		return kosha;
	}

	public void setKosha(boolean kosha) {
		this.kosha = kosha;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public boolean isPets() {
		return pets;
	}

	public void setPets(boolean pets) {
		this.pets = pets;
	}

	public boolean isKids() {
		return kids;
	}

	public void setKids(boolean kids) {
		this.kids = kids;
	}

	public boolean isRest() {
		return rest;
	}

	public void setRest(boolean rest) {
		this.rest = rest;
	}

	public String getBtnAdd() {
		return btnAdd;
	}

	public void setBtnAdd(String btnAdd) {
		this.btnAdd = btnAdd;
	}
	
}
