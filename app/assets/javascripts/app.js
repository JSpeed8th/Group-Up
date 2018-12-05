// Autocomplete function for location inout in event create
function init() {
  var input = document.getElementById('locationTextField');
  var autocomplete = new google.maps.places.Autocomplete(input);
}
 
document.addEventListener('DOMContentLoaded', init);
        

let submitBtn = document.querySelector('.submit-btn');
let inputField = document.querySelector('.user_address');

// Geocode Function

function geocode() {

  axios.get('https://maps.googleapis.com/maps/api/geocode/json?', {
    params: {
      address: inputField.value,
      key: 'AIzaSyDe9uhsXwvwMIFQPeblTTd9wJ5saGuppEk'
    }
  }).then(function(response){
    // Log Full Response
    console.log(response);
    // Log Full Address
    console.log(response.data.results[0].formatted_address);
    // Log Latitude & Longitude
    console.log(response.data.results[0].geometry.location);

    // Stores longitude and latidude inside variables
    let longitude = response.data.results[0].geometry.location.lng;
    let latitude = response.data.results[0].geometry.location.lat;
    let longlat = `${latitude}, ${longitude}`;

    // Formatted Address
    let formattedAddress = response.data.results[0].formatted_address;
    let formattedAddressOutput = `
      <ul class="list-group">
        <li class="list-group-item"> ${formattedAddress} </li>
      </ul>
    `;

    // Output to App
    document.querySelector('.formatted-address').innerHTML = formattedAddressOutput;

    // Calling places function and passing it our longlat variable
    places(longlat)

  })
  // If error...
  .catch(function(error){
    console.log(error)
  })
}

// Event Listener for Submit Button
submitBtn.addEventListener('click', geocode);

//Function for Autocomplete feature
function activatePlacesSearch() {
  let autoComplete = new google.maps.places.Autocomplete(inputField);
}

document.addEventListener('DOMContentLoaded', activatePlacesSearch);

//Function for returning places

// location should be inputted like the following... -33.8670522,151.1957362
function places(longlat) {
  axios.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?rankby=distance&key=AIzaSyDe9uhsXwvwMIFQPeblTTd9wJ5saGuppEk", {
    params: {
      location: longlat,
      type: 'restaurant'
    }
  }).then(function(response){
    let placesResults = response.data.results;
    // console.log(placesResults[Math.floor(Math.random() * placesResults.length)]);

    placesResults.map(function(place, index) {
      // console.log(`${index + 1}. ${place.name}`)
      console.log(place);
    })

  }).catch(function(error){
    console.log(error)
  })
}
