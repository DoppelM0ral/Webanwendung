
function showOption(option){
	//Entfernen von Auswählen Option
	if(document.getElementById("search").options[0].value == ""){
		document.getElementById("search").remove("");
		}
	
	document.getElementById("info").style.display = "block";
	if(option.value == "cityname"){
		document.getElementById("namesearch").style.display = "block";
		document.getElementById("namesearch").removeAttribute("disabled")
		document.getElementById("plzsearch").style.display = "none";
		document.getElementById("plzsearch").setAttribute("disabled","disabled");
	}else if(option.value == "citycode"){
		document.getElementById("namesearch").style.display = "none";
		document.getElementById("namesearch").setAttribute("disabled","disabled");
		document.getElementById("plzsearch").style.display = "block";
		document.getElementById("plzsearch").removeAttribute("disabled");
	}
}

function showSpecific(option){
	//Entfernen von Auswählen Option
	if(document.getElementById("search").options[0].value == ""){
		document.getElementById("search").remove("");
		
		for (const element of document.getElementsByClassName("basicinfo")){
  		element.style.display="table-cell";
	}
		}
	
	//Wechsel der angezeigten und genutzen Inputs
	if(option.value == "Restaurant"){
	
		for (const element of document.getElementsByClassName("restaurant")){
  		element.style.display="table-cell";
  		element.removeAttribute("disabled");
	}
		for (const element of document.getElementsByClassName("accommodation")){
  		element.style.display="none";
  		element.setAttribute("disabled","disabled");
	}


	}else if(option.value == "Unterkunft"){
		
		for (const element of document.getElementsByClassName("restaurant")){
  		element.style.display="none";
  		element.setAttribute("disabled","disabled");
	}
		for (const element of document.getElementsByClassName("accommodation")){
  		element.style.display="table-cell";
  		element.removeAttribute("disabled");
	}
	}
	
	//Button Wert an ausgewählten Input anpassen
	document.getElementById("submit").value = ""+ option.value +" anlegen";
}
