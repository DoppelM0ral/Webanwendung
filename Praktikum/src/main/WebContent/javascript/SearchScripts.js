
function showOption(option){
	//Entfernen von Auswählen Option
	if(document.getElementById("search").options[0].value == ""){
		document.getElementById("search").remove("");
	}
	
	document.getElementById("info").style.display = "block";
	if(option.value == "cityname"){
		document.getElementById("namesearch").style.display = "block";
		document.getElementById("plzsearch").style.display = "none";
		document.getElementById("plzsearch").setAttribute("disabled","disabled");
	}else if(option.value == "citycode"){
		document.getElementById("namesearch").style.display = "none";
		document.getElementById("namesearch").setAttribute("disabled","disabled");
		document.getElementById("plzsearch").style.display = "block";
	}
}