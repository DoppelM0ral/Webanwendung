

function reloadCheck(){
	setTimeout(check, 3000);
	
}


function check(){
	if(document.getElementById("msgCheck").value == "<h2>Du bist jetzt angemeldet!</h2>"){
		document.reload.submit();
	}
}