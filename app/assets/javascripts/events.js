
$(document).ready(function(){

var locationTextField = document.getElementById('locationTextField')
var submit = document.getElementsByClassName("submit")[0]

  submit.addEventListener("click", function(){
    var location = locationTextField.value;
    $.ajax({url:"https://maps.googleapis.com/maps/api/geocode/json?address="+ location +"&key=AIzaSyDe9uhsXwvwMIFQPeblTTd9wJ5saGuppEk"}).then(function(resolve){
        console.log(resolve.results[0].geometry.location)
    })

  })

})
