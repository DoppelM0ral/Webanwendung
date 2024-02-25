package beans;

public class AccountBean {

	public void AccountBean() {
		

	}
	
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

}
