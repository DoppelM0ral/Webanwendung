package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import jdbc.NoConnectionException;
import jdbc.PostgreSQLAccess;

public class AccountBean {

	//Initialisierung von Variablen 
	boolean loggedin;
	String username;
	String password;
	String language;
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
		this.language = "";
		this.email = "";
		this.loggedin = false;
	}
	
	
	//Funktion mit String für Register Feld
	public String getRegisterField() {
		String field = "<form action='../appls/RegisterAppl.jsp' method='get'>\n"
					 + "	<table>\n"
					 + "		<tr>\n"
					 + "			<td>Nickname:</td>\n"
					 + "			<td><input type='text' name='username' value=''\n"
					 + "			</td>\n"
					 + "			<td id='usernameMsg' class='fehlerfeld'></td>\n"
					 + "		</tr>\n"
					 + "		<tr>\n"
					 + "			<td>Passwort:</td>\n"
					 + "			<td><input id='passwordField' type='password' name='password' value=''\n"
					 + "				onkeyup='checkPassword(this.value)'\n"
					 + "			 />\n"
					 + "			</td>\n"
					 + "			<td><input type='button' name='showPw' value='showPw' \n"
					 + "				onclick='togglePw()'\n"
					 + "			</td>\n"
					 + "		</tr>\n"
					 + "		<tr>\n"
					 + "			<td>Sprache</td>\n"
					 + "			<td><input type='number' name='age'\n"
					 + "							value='' /></td>\n"
					 + "			<td id='ageMsg' class='fehlerfeld'></td>\n"
					 + "		</tr>\n"
					 + "		<tr>\n"
					 + "			<td>E-Mail:</td>\n"
					 + "			<td><input type='email' name='email'\n"
					 + "							value=''\n"
					 + "					/>\n"
					 + "			</td>\n"
					 + "			<td id='emailMsg' class='fehlerfeld'></td>\n"
					 + "		</tr>\n"
					 + "		<tr>\n"
					 + "			<td><input class='button' type='submit' name='btnToLogin' value='zum Login' \n"
					 + "					onclick='setButtonClicked(this.name)'\n"
					 + "			</td>\n"
					 + "			<td><input class='button' type='submit' name='btnRegister' value='Registrieren'\n"
					 + "					onclick='setButtonClicked(this.name)'\n"
					 + "				/>\n"
					 + "			</td>\n"
					 + "		</tr>\n"
					 + "	</table>\n"
					 + "</form>";			
		return field;
	}
	
	public boolean checkExists() {
		boolean exists = true;
		
		
		return exists;
	}
	
	
	//Legt Account an
	public void insertAccountNoCheck() throws SQLException{
		String sql = "insert into account (username, password, language, email) values (?,?,?,?)";
		System.out.println(sql);
		PreparedStatement prep = this.dbConn.prepareStatement(sql);
		prep.setString(1, this.username);
		prep.setString(2, this.password);
		prep.setString(3, this.language);
		prep.setString(4, this.email);

		prep.executeUpdate();
		System.out.println("Account " + this.username + " erfolgreich angelegt");
	}

	
	//Getter und Setter Methoden für die gegebenen Variablen
	public boolean isLoggedin() {
		return loggedin;
	}

	public void setLoggedin(boolean loggedin) {
		this.loggedin = loggedin;
	}
	
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

	public String getLanguage() {
		return language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
