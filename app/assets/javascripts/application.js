// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require leaflet
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
//
// $(document).ready(function() {
//   var map = L.map('map', {
//     center: [35.98, 78.90],
//     zoom: 13
//   });
//   L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
//       attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/search?query=durham%20nc#map=12/35.9940/-78.8986"',
//       maxZoom: 18
//   }).addTo(map);
//
//   //var marker = L.maker([35.98, 78.90]).addTo(map);
//
// });

$(document).ready(function () {
  var map = L.map('map', 'mapbox.streets')
  .setView([35.994, -78.898], 13);
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18,
    id: 'ebaiden.cigmgqf43027nurkrnufjii94',
    accessToken: 'pk.eyJ1IjoiZWJhaWRlbiIsImEiOiJjaWdtbHozMjEwMDA3bjlrb2gwaTY1ZThqIn0.w4-Mcgb3JXeCNLjFvigYDg'

  }).addTo(map);

  L.mapbox.map('map', 'ebaiden.cigmgqf43027nurkrnufjii94')
    .addControl(L.mapbox.geocoderControl('mapbox.places'));



  

    map.panTo(new L.LatLng(35.994, -78.898));
var marker = L.marker([35.994, -78.898]).addTo(map);
}); // end of the function
