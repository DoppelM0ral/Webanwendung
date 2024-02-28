package beans;

public class MessageBean {

	String infoMessage;
	String actionMessage;
	
	public MessageBean() {
		this.setGeneralWelcome();
	}
	
	
	public String getMainMessage() {
		String message=""; 
		return message;
	}

	public void setGeneralWelcome(){
		this.infoMessage = "Willkommen beim<br>"
						+"OpenSource Stadtguide";
		this.actionMessage = "Bitte melden Sie sich an";
	}
	public String getMessageHtml(){
		String html = "";
		html += "<h2>" + this.getInfoMessage() + "</h2>";
		html += "<h4>" + this.getActionMessage() + "</h4>";
		return html;
	}

	public String getInfoMessage() {
		infoMessage = "		<div id='mainmsg'>\n"
			   	  	+ "				<h2>Platzhalter für<br> tatsächliche Infomessage <br>(Funktion wird noch eingeführt)</h2>\n"
			   	  	+ "			</div>";
		return infoMessage;
	}
	public void setInfoMessage(String infoMessage) {
		this.infoMessage = infoMessage;
	}
	public String getActionMessage() { 
		actionMessage = "		<div id='actionmsg'>\n"
		   	  	+ "				<p>Platzhalter für<br> tatsächliche Actionmessage <br>(Funktion wird noch eingeführt)</p>\n"
		   	  	+ "			</div>";
		return actionMessage;
	}
	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}
}
