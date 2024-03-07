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
	
	public void setAccountWelcome() {
		this.mainMessage = "<h2>Hier findest du Informationen zu deinem Account</h2>";
		this.secondaryMessage = "Du kannst sie auch ändern";
	}
	
	public void setCentralHelloMessage() {
		this.mainMessage = "<h2>Du kannst loslegen</h2>";
		this.secondaryMessage = "Suche eine Stadt und schau dir an was sie zu bieten hat oder erweitere sie sogar";
	}
	
	public void setAddResSuccess() {
		this.mainMessage = "<h2>Dein Restaurant wurde angelegt</h2>";
		this.secondaryMessage = "Du kannst es jetzt über die Suche finden";
	}
	
	public void setAddAccSuccess() {
		this.mainMessage = "<h2>Deine Unterkunft wurde angelegt</h2>";
		this.secondaryMessage = "Du kannst sie jetzt über die Suche finden";
	}
	
	public void setLoginProblem() {
		this.mainMessage = "<h2>Die Kombination aus Nickname und Passwort existiert nicht</h2>";
		this.secondaryMessage = "Versuche es nocheinmal oder registriere dich";
	}
	
	public void setRegisterWelcome() {
		this.mainMessage = "<h2>Hier kannst du dich registrieren</h2>";
		this.secondaryMessage = "Einfach deine Daten eingeben und loslegen";
	}
	
	public void setRegisterSuccess() {
		this.mainMessage = "<h2>Dein Account wurde erstellt</h2>";
		this.secondaryMessage = "Jetzt musst du dich nur noch anmelden";
	}
	
	public void setUsernameTaken() {
		this.mainMessage = "<h2>Dieser Nickname ist bereits vergeben</h2>";
		this.secondaryMessage = "Versuche es mit einem anderen nocheinmal";
	}
	
	public void setEmailTaken() {
		this.mainMessage = "<h2>Diese EMail ist bereits vergeben</h2>";
		this.secondaryMessage = "Versuche es mit einer anderen nocheinmal";
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
