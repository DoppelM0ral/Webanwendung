<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
	<body>

		<div class='login'>
			<table>
				<tr>
					<td>Nickname:</td>
					<td><input type='text' name='userid' value='' /></td>
				</tr>
				<tr>
					<td>Passwort:</td>
					<td><input type='password' name='password' value='' /></td>
				</tr>
				<tr>
					<td colspan=2 align=center>
						<input class='button' type='submit' name='btnLogin' value='Anmelden' />
						<input class='button' type='submit' name='btnRegister' value='Registrieren'/>
					</td>
				</tr>
				<tr>
					<td colspan='2' align='center'>
						Passwort vergessen?
					</td>
				</tr>
			</table>
		</div>

	</body>
</html>