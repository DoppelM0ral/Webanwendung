package beans;

public class MessageBean {

	String mainMessage;
	String secondaryMessage;
	
	public MessageBean() {
		this.setGeneralWelcome();
	}
	
	public void setGeneralWelcome(){
		this.mainMessage = "<h2>Um unseren Stadtguide zu nutzen muss man angemeldet sein</h2>";
		this.secondaryMessage = "Bitte melde dich daher hier an";
	}
	
	public void setLoginWelcome() {
		this.mainMessage = "<h2>Du bist jetzt angemeldet!</h2>";
		this.secondaryMessage = "Viel Spaß mit unserem Stadtguide";
	}
	
	public String getMessageHtml(){
		String html = "";
		html += "<h2>" + this.getMainMessage() + "</h2>";
		html += "<h4>" + this.getSecondaryMessage() + "</h4>";
		return html;
	}

	public String getMainMessage() {
		return mainMessage;
	}
	public void setMainMessage(String mainMessage) {
		this.mainMessage = "<h2> " + mainMessage +" </h2>";

	}
	public String getSecondaryMessage() { 
		return secondaryMessage;
	}
	public void setSecondaryMessage(String secondaryMessage) {
		this.secondaryMessage = secondaryMessage;
	}
}
