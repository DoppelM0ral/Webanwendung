package beans;

public class FrameworkBean {

	public FrameworkBean(){
		
	}

	public String getFramework(){
		String framework = 	 ""
							//Linke Sidebar
							+"	<div id='leftbar'>\n"
							+"		</div>\n"
							//Rechte Sidebar
							+"		<div id='rightbar'>\n"
							+"		</div>\n"
							//Header mit Buttons
							+"		<div id='navbar'>\n"
							+"			<header>\n"
							+"				<nav id='navibar'>\n"
							+"					<p id='nav'>OpenSource Stadt-Guide</p>\n"
							+"					<a class='nav' id='left' href='../appls/CentralAppl.jsp?btnHome=btnHome'><img class='nav' src='../content/Home.png' alt='Home'></a>\n";
		//Check ob eingelogt über die LoginBean, wenn ja kommt ein anderer Link als wenn nicht
				framework += "					<script type='text/javascript'>\n"
						    +"						buttonCheck();\n"
						    +"					</script>\n";
				framework += "				</nav>\n"	
							+"			</header>\n"
							+"			</div>\n"
		//Zentrale div mit dem tatsächlichem Content der Website
							+"		<div id='central'>\n";		
	return framework;
	}
	
	//Footer mit generellen Informationen
	public String getFooter() {
		String footer = ""
					+ "<footer>\n"
					+ "		test\n"
					+ "	</footer>\n";
		return footer;
	}
	
	
}
