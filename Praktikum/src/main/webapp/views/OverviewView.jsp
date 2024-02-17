<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<link rel="stylesheet" type="text/css" href="../content/test.css">
		<title>Stadtguide</title>
	</head>
	<body>
		<div class="left">
		</div>
		<div class="right">
		</div>
		<div class="central">
			<div>
			</div>
			<div>
				Willkommen zum OpenSource Stadt-Guide
			</div>
			<div>
				<table>
					<tr>
						<td width="20%">
							Was suchen sie?<br>
									<select name="gesucht" onChange="showOption(this)">
										<option value="">Auswählen</option>
										<option value="restaurant">Restaurant</option>
										<option value="unterkunft">Unterkunft</option>
										<option value="kultur">Kultur</option>
										<option value="aktivitaet">Aktivität</option>
									</select>
						</td>
					</tr>
				</table>
			</div>
			<div>
				<table>
				</table>
			</div>
		</div>
	</body>
</html>