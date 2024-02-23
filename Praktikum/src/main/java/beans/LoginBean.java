package beans;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jdbc.PostgreSQLAccess;

public class LoginBean {

	String userid;
	String password;
	boolean loggedIn;
	
	public LoginBean() {
		this.setLoggedIn(false);
	}
	public String getLoginCheckRedirectHtml(){
		String html = "";
		if (!this.isLoggedIn()){
			html = "<meta http-equiv='refresh' content='0; URL=./PortalAppl.jsp'>";
		}
		return html;
	}
	public boolean checkUseridPassword() throws SQLException{
		//true: userid/pw Kombination existiert in der Datenbank
		//false: userid/pw Kombination existiert nicht in der Datenbank
		String sql = "select userid from account where userid = ? and password = ?";
		System.out.println(sql);
		Connection dbConn = new PostgreSQLAccess().getConnection();
		PreparedStatement prep = dbConn.prepareStatement(sql);
		prep.setString(1, this.userid);
		prep.setString(2, this.password);
		ResultSet dbRes = prep.executeQuery();
		return dbRes.next();
	}

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
	public boolean isLoggedIn() {
		return loggedIn;
	}
	public void setLoggedIn(boolean loggedIn) {
		this.loggedIn = loggedIn;
	}

	//Div welche den Table zum Login beinhaltet	
	public String getLoginDiv() {
		String loginDiv = "	<div class='login'>\n"
						+ "			<form action='./LoginAppl.jsp' method='get'>"
						+ "				<table>\n"
						+ "					<tr>\n"
						+ "						<td>Nickname:</td>\n"
						+ "						<td><input type='text' name='userid' value='' /></td>\r\n"
						+ "					</tr>\n"
						+ "					<tr>\n"
						+ "						<td>Passwort:</td>\n"
						+ "						<td><input type='password' name='password' value='' /></td>\n"
						+ "					</tr>\n"
						+ "					<tr>\n"
						+ "						<td colspan=2 align=center>\n"
						+ "							<input class='button' type='submit' name='btnLogin' value='Anmelden' />\n"
						+ "							<input class='button' type='submit' name='btnRegister' value='Registrieren'/>\n"
						+ "						</td>\n"
						+ "					</tr>\n"
						+ "					<tr>\n"
						+ "						<td colspan='2' align='center'>\n"
						+ "							Passwort vergessen?\n"
						+ "						</td>\n"
						+ "					</tr>\n"
						+ "				</table>\n"
						+ "			</form>"			
						+ "		</div>";
		return loginDiv;
	}

}
