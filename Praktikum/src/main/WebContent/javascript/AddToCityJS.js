function showFields(option) {
            var unterkunftFields = document.getElementById("unterkunftFields");
            var restaurantFields = document.getElementById("restaurantFields");

            if (option === "unterkunft") {
                unterkunftFields.style.display = "block";
                restaurantFields.style.display = "none";
            } else if (option === "restaurant") {
                unterkunftFields.style.display = "none";
                restaurantFields.style.display = "block";
            }
        }
function toggleRestaurantDetails() {
    var checkbox = document.getElementById("restaurantCheckbox");
    var restaurantDetails = document.getElementById("restaurantDetails");
    if (checkbox.checked) {
        restaurantDetails.style.display = "block";
    } else {
        restaurantDetails.style.display = "none";
    }
}