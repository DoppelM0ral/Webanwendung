
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
		document.getElementById("restaurant").style.display = "table-cell";
		document.getElementById("restaurant").removeAttribute("disabled");
		document.getElementById("accommodation").style.display = "none";
		document.getElementById("accommodation").setAttribute("disabled","disabled");
		document.getElementById("accKind").style.display = "none";
		document.getElementById("accKind").setAttribute("disabled","disabled");
	}else if(option.value == "Unterkunft"){
		document.getElementById("restaurant").style.display = "none";
		document.getElementById("restaurant").setAttribute("disabled","disabled");
		document.getElementById("accommodation").style.display = "table-cell";
		document.getElementById("accommodation").removeAttribute("disabled");
		document.getElementById("accKind").style.display = "table-row";
		document.getElementById("accKind").removeAttribute("disabled");
	}
	
	//Button Wert an ausgewählten Input anpassen
	document.getElementById("submit").value = ""+ option.value +" anlegen";
}
