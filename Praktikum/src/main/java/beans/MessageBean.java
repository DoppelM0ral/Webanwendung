package beans;

public class MessageBean {

	String mainMessage;
	String secondaryMessage;
	
	public MessageBean() {
		this.setGeneralWelcome();
	}
	
	//Generelle Begrüßung
	public void setGeneralWelcome(){
		this.mainMessage = "<h2>Um unseren Stadtguide zu nutzen muss man angemeldet sein</h2>";
		this.secondaryMessage = "Bitte melde dich daher hier an";
	}
	
	//Anmeldung erfolgreich Begrüßung
	public void setLoginWelcome() {
		this.mainMessage = "<h2>Du bist jetzt angemeldet!</h2>";
		this.secondaryMessage = "Viel Spaß mit unserem Stadtguide";
	}
	
	//AccountView Begrüßung
	public void setAccountWelcome() {
		this.mainMessage = "<h2>Hier findest du Informationen zu deinem Account</h2>";
		this.secondaryMessage = "Du kannst sie auch ändern";
	}
	
	//CentralView Begrüßung
	public void setCentralHelloMessage() {
		this.mainMessage = "<h2>Du kannst loslegen</h2>";
		this.secondaryMessage = "Suche eine Stadt und schau dir an was sie zu bieten hat oder erweitere sie sogar";
	}
	
	//Restaurant ist schon angelegt Message
	public void setRestExists() {
		this.mainMessage = "<h2>An dieser Adresse wurde schon ein Restaurant angelegt</h2>";
		this.secondaryMessage = "Du kannst gerne noch andere Anlegen";
	}
	
	//Unterkunft ist schon angelegt Message
	public void setAccExists() {
		this.mainMessage = "<h2>An dieser Adresse wurde schon eine Unterkunft angelegt</h2>";
		this.secondaryMessage = "Du kannst gerne noch andere Anlegen";
	}
	
	//Restaurant wurde angelegt Message
	public void setAddResSuccess() {
		this.mainMessage = "<h2>Dein Restaurant wurde angelegt</h2>";
		this.secondaryMessage = "Du kannst es jetzt über die Suche finden";
	}
	
	//Unterkunft wurde angelegt Message
	public void setAddAccSuccess() {
		this.mainMessage = "<h2>Deine Unterkunft wurde angelegt</h2>";
		this.secondaryMessage = "Du kannst sie jetzt über die Suche finden";
	}
	
	//Probleme beim Login Message
	public void setLoginProblem() {
		this.mainMessage = "<h2>Die Kombination aus Nickname und Passwort existiert nicht</h2>";
		this.secondaryMessage = "Versuche es nocheinmal oder registriere dich";
	}
	
	//RegisterView Begrüßung
	public void setRegisterWelcome() {
		this.mainMessage = "<h2>Hier kannst du dich registrieren</h2>";
		this.secondaryMessage = "Einfach deine Daten eingeben und loslegen";
	}
	
	//Account wurde angelegt Message
	public void setRegisterSuccess() {
		this.mainMessage = "<h2>Dein Account wurde erstellt</h2>";
		this.secondaryMessage = "Jetzt musst du dich nur noch anmelden";
	}
	
	//Nutzername ist schon angelegt Message
	public void setUsernameTaken() {
		this.mainMessage = "<h2>Dieser Nickname ist bereits vergeben</h2>";
		this.secondaryMessage = "Versuche es mit einem anderen nocheinmal";
	}
	
	//Email ist schon angelegt Message
	public void setEmailTaken() {
		this.mainMessage = "<h2>Diese EMail ist bereits vergeben</h2>";
		this.secondaryMessage = "Versuche es mit einer anderen nocheinmal";
	}
	
	//Fehler Message
	public void setBug() {
		this.mainMessage = "<h2>Es gab einen Fehler</h2>";
		this.secondaryMessage = "Versuche es nocheinmal oder Kontaktiere eine zuständige Person";
	}

	//Getter und Setter
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
