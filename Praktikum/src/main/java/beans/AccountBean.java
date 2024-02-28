package beans;

import java.sql.Connection;

import jdbc.NoConnectionException;
import jdbc.PostgreSQLAccess;

public class AccountBean {

	//Initialisierung von Variablen 
	String userid;
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
		this.userid = "";
		this.password = "";
		this.language = "";
		this.email = "";
	}
	
	
	//Funktion mit String für Register Feld
	public String getRegisterField() {
		String field = "<form action='./RegAppl.jsp' method='get'>\n"
					 + "	<table>\n"
					 + "		<tr>\n"
					 + "			<td>Nickname:</td>\n"
					 + "			<td><input type='text' name='userid' value=''\n"
					 + "			</td>\n"
					 + "			<td id='useridMsg' class='fehlerfeld'></td>\n"
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
	
	
	

	
	//Getter und Setter Methoden für die gegebenen Variablen
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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
