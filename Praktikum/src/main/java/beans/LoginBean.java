package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.PostgreSQLAccess;

public class LoginBean {

	String username;
	String password;
	boolean loggedIn;
	
	public LoginBean() {
		this.setLoggedIn(false);
	}
	//Wenn nicht eingeloggt weiterleitung zu Login
//	public String getLoginRedirect(){
//		String html = "";
//		if (!LoginBean.isLoggedIn()){
//			html = "<meta http-equiv='refresh' content='0; URL=../views/LoginView.jsp'>";
//		}
//		return html;
//	}
//	
	//Wenn Login erfolgreich veränderung der MessageBean und weiterleitung zu CentralView
	
	//Funktion um zu Überprüfen ob User und Passwort zusammen angelegt sind
	public boolean checkLogin() throws SQLException{
		String sql = "select username from account where username = ? and password = ?";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, this.username);
		prep.setString(2, this.password);
		ResultSet dbRes = prep.executeQuery();
		return dbRes.next();
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
	public boolean isLoggedIn() {
		return loggedIn;
	}
	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}

	//Div welche den Table zum Login beinhaltet	
	public String getLoginDiv() {
		String loginDiv = "		<div id='content'>\n"
						+ "				<form action='../appls/LoginAppl.jsp' method='get'>"
						+ "					<table>\n"
						+ "						<tr>\n"
						+ "							<td>Nickname:</td>\n"
						+ "							<td><input type='text' name='username' value='' /></td>\r\n"
						+ "						</tr>\n"
						+ "						<tr>\n"
						+ "							<td>Passwort:</td>\n"
						+ "							<td><input type='password' name='password' value='' /></td>\n"
						+ "						</tr>\n"
						+ "						<tr>\n"
						+ "							<td colspan=2 align=center>\n"
						+ "								<input class='button' type='submit' name='btnLogin' value='Anmelden' />\n"
						+ "								<input class='button' type='submit' name='btnToRegister' value='zum Registrieren'/>\n"
						+ "							</td>\n"
						+ "						</tr>\n"
						+ "						<tr>\n"
						+ "							<td colspan='2' align='center'>\n"
						+ "								Passwort vergessen?\n"
						+ "							</td>\n"
						+ "						</tr>\n"
						+ "					</table>\n"
						+ "				</form>\n"			
						+ "			</div>";
		return loginDiv;
	}

}
