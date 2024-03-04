
/*LoginCheck wenn nicht angemeldet weiterleitung auf Login Seite*/
function loginFalseCheck(){
	if(document.getElementById("loginCheck").value == "false"){
		document.redirect.submit();
	}
}

/*LoginCheck wenn angemeldet weiterleitung auf Central Seite*/
function loginTrueCheck(){
	if(document.getElementById("loginCheck").value == "true"){
		document.redirect.submit();
	}
}

