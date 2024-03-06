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
							+"				<nav id='navbar'>\n"
							+"					<a class='nav' id='left' href='../appls/CentralAppl.jsp?btnHome=btnHome'><img class='nav' src='../content/Home.png' alt='Home'></a>\n";
		//Check ob eingelogt über die LoginBean, wenn ja kommt ein anderer Link als wenn nicht
				framework += "					<script type='text/javascript'>\n"
						    +"						buttonCheck();\n"
						    + "					</script>\n";
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
					+ "		test\n"
					+ "	</footer>\n";
		return footer;
	}
	
	
}
