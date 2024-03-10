
function buttonCheck(){
	if(document.getElementById("loginCheck").value == "false"){
		document.getElementById("navbar").innerHTML +=	"<a class='nav' id='right' href='../appls/LoginAppl.jsp?btnLog=btnLog'><img class='nav' src='../content/Key.png' alt='Key'></a>\n";
	}else if(document.getElementById("loginCheck").value == "true"){
		document.getElementById("navbar").innerHTML += "<a class='nav' id='right' href='../appls/AccountAppl.jsp?btnInfo=btnInfo'><img class='nav' src='../content/User.png' alt='Key'></a>\n";
	}
}
