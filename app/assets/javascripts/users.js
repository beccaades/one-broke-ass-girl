function getCoords(callback) {
  if (navigator.geolocation) {
    navigator.geolocation.getCurrentPosition(function(position){
      callback(position.coords.latitude, position.coords.longitude);
    });
  } else {
    alert('Your browswer does not support Geolocation');
  }
}