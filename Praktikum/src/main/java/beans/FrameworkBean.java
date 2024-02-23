package beans;

public class FrameworkBean {
	
	int loggedIn = 0;

	public FrameworkBean(){
		
	}

	public String getFramework(){
		String framework = ""
	//Linke Sidebar
						+"	<div class='left'>\n"
						+"		</div>\n"
	//Rechte Sidebar
						+"		<div class='right'>\n"
						+"		</div>\n"
	//Header mit Buttons
						+"		<div class='nav'>\n"
						+"			<nav>\n"
						+"				<a class='nav' id='left' href='CentralView.jsp'><img class='nav' src='../content/Home.png' alt='Home'></a>\n";
	//Check ob eingelogt über die LoginBean, wenn ja kommt ein anderer Link als wenn nicht
		if(loggedIn == 1) {
			framework += "				<a class='nav' id='right' href='LoginView.jsp'><img class='nav' src='../content/User.png' alt='Key'></a\n";
		}else {
				framework += "				<a class='nav' id='right' href='LoginView.jsp'><img class='nav' src='../content/Key.png' alt='Key'></a\n";
		}
						
				framework += "				<p>OpenSource Stadt-Guide</p>\n"
						+"			</nav>\n"			
						+"		</div>\n"
	//Zentrale div mit dem tatsächlichem Content der Website
						+"		<div class='central'>\n"
						+"		<div>\n"
						+"		</div>\n";
	return framework;
	}
	
	public String getFooter() {
		//Footer mit generellen Informationen
		String footer = ""
					+ "	<footer>\n"
					+ "		<p>Generelle Innformationen muss noch gefüllt werden</p>\n"
					+ "	</footer>\n";
		return footer;
	}
	
	
}
