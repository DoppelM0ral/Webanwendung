
function showHideFields() {
    var accommodationRadio = document.getElementById("accommodationRadio");
    var accommodationFields = document.getElementById("accommodationFields");
    var restaurantRadio = document.getElementById("restaurantRadio");
    var restaurantFields = document.getElementById("restaurantFields");

    // Wenn "Unterkunft" ausgewählt ist, zeigen Sie die Unterkunftsfelder an und verstecken Sie die Restaurantfelder
    if (accommodationRadio.checked) {
        accommodationFields.style.display = "block";
        restaurantFields.style.display = "none";
    }
    // Wenn "Restaurant" ausgewählt ist, zeigen Sie die Restaurantfelder an und verstecken Sie die Unterkunftsfelder
    else if (restaurantRadio.checked) {
        accommodationFields.style.display = "none";
        restaurantFields.style.display = "block";
    }
}