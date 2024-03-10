package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.NoConnectionException;
import jdbc.PostgreSQLAccess;

public class AccountBean {

	//Initialisierung von Variablen 
	String username;
	String password;
	String email;
	Connection dbConn;
 
	
	
	public AccountBean() throws NoConnectionException {
		this.dbConn = new PostgreSQLAccess().getConnection();
		this.initialize();
	}
	
	//Initialisierungsfunktion der Variablen
	public void initialize() {
		this.username = "";
		this.password = "";
		this.email = "";
	}	
	
	//Legt Account an
	public void insertAccount() throws SQLException{
			String sql = "INSERT INTO account (username, password, email) VALUES (?,?,?)";
			System.out.println(sql);
			PreparedStatement prep = this.dbConn.prepareStatement(sql);
			prep.setString(1, this.username);
			prep.setString(2, this.password);
			prep.setString(3, this.email);
			prep.executeUpdate();
			System.out.println("Account " + this.username + " erfolgreich angelegt");
	}
	
	//Funktion ob User existiert
	public boolean checkUserExist() throws SQLException{
		String sql = "SELECT username FROM account WHERE username = ?";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, this.username);
		ResultSet dbRes = prep.executeQuery();
		return dbRes.next();
		}
	
	//Funktion ob Email existiert
		public boolean checkEmailExist() throws SQLException{
			String sql = "SELECT username FROM account WHERE email = ?";
			System.out.println(sql);
			Connection dbConn = new PostgreSQLAccess().getConnection();
			PreparedStatement prep = dbConn.prepareStatement(sql);
			prep.setString(1, this.email);
			ResultSet dbRes = prep.executeQuery();
			return dbRes.next();
			}

	public String getAccountData() throws SQLException{
		String output="";
		String sql = "SELECT * FROM account WHERE username = ?";
		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		prep.setString(1, this.username);
		ResultSet dbRes = prep.executeQuery();
		
		while(dbRes.next()) {
			setUsername(dbRes.getString("username"));
			setEmail(dbRes.getString("email"));
			setPassword(dbRes.getString("password"));
		}	
		return output;
		
	}
	
	
	//Getter und Setter Methoden für die gegebenen Variablen	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
