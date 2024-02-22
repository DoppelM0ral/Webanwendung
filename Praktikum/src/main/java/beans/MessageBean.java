package beans;

public class MessageBean {

	String infoMessage;
	String actionMessage;
	
	public MessageBean() {
		this.setGeneralWelcome();
	}
	
	
	public String getMainMessage() {
		String message = "<p>Willkommen beim\n"
				+"OpenSource Stadtguide</p>";
		return message;
	}

	public void setGeneralWelcome(){
		this.infoMessage = "Willkommen beim\n"
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
		return infoMessage;
	}
	public void setInfoMessage(String infoMessage) {
		this.infoMessage = infoMessage;
	}
	public String getActionMessage() {
		return actionMessage;
	}
	public void setActionMessage(String actionMessage) {
		this.actionMessage = actionMessage;
	}
}
