package beans;

public class FrameworkBean {

	public FrameworkBean(){
		
	}

	public String getFramework(){
		String framework = 	 ""
		//Linke Sidebar
							+"	<div class='left'>\n"
							+"		</div>\n"
		//Rechte Sidebar
							+"		<div class='right'>\n"
							+"		</div>\n"
		//Header mit Buttons
							+"		<div class='nav'>\n"
							+"			<header>\n"
							+"				<nav>\n"
							+"					<a class='nav' id='left' href='CentralView.jsp'><img class='nav' src='../content/Home.png' alt='Home'></a>\n"
							+"					<a class='nav' id='back' href='javascript:history.back()'><img id='back' src='../content/Arrow.png' alt='Arrow'></a>\n";
		//Check ob eingelogt über die LoginBean, wenn ja kommt ein anderer Link als wenn nicht
			if(LoginBean.isLoggedIn()) {
				framework += "					<a class='nav' id='right' href='AccountView.jsp'><img class='nav' src='../content/User.png' alt='Key'></a\n";
			}else {
				framework += "					<a class='nav' id='right' href='LoginView.jsp'><img class='nav' src='../content/Key.png' alt='Key'></a\n";
			}
							
				framework += "					<p>OpenSource Stadt-Guide</p>\n"
							+"				</nav>\n"	
							+"			</header>\n"
							+"			</div>\n"
		//Zentrale div mit dem tatsächlichem Content der Website
							+"		<div class='central'>\n";
						
			

			
			
			
			
			
	return framework;
	}
	
	public String getFooter() {
		//Footer mit generellen Informationen
		String footer = ""
					+ "<footer>\n"
					+ "		<p>Generelle Innformationen muss noch gefüllt werden</p>\n"
					+ "		<p>Generelle Innformationen muss noch gefüllt werden</p>\n"
					+ "		<p>Generelle Innformationen muss noch gefüllt werden</p>\n"
					+ "		<p>Generelle Innformationen muss noch gefüllt werden</p>\n"
					+ "		<p>Generelle Innformationen muss noch gefüllt werden</p>\n"
					+ "		<p>Generelle Innformationen muss noch gefüllt werden</p>\n"
					+ "		<p>Generelle Innformationen muss noch gefüllt werden</p>\n"
					+ "		<p>Generelle Innformationen muss noch gefüllt werden</p>\n"
					+ "		<p>Generelle Innformationen muss noch gefüllt werden</p>\n"
					+ "	</footer>\n";
		return footer;
	}
	
	
}
