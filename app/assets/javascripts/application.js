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
//= require mapbox.js
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
  .setView([35.994, -78.898], 9);
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18,
    id: 'ebaiden.cigmgqf43027nurkrnufjii94',
    accessToken: 'pk.eyJ1IjoiZWJhaWRlbiIsImEiOiJjaWdtbHozMjEwMDA3bjlrb2gwaTY1ZThqIn0.w4-Mcgb3JXeCNLjFvigYDg',


  }).addTo(map);

  L.mapbox.accessToken = 'pk.eyJ1IjoiZWJhaWRlbiIsImEiOiJjaWdtbHozMjEwMDA3bjlrb2gwaTY1ZThqIn0.w4-Mcgb3JXeCNLjFvigYDg';


    //var crops = [];

    L.marker([35.994, -78.898]).addTo(map)
        .bindPopup('Your Here')
        .openPopup();

        var featureLayer = L.mapbox.tileLayer().addTo(map);


$('#search').keyup(search);

;

// function search() {
//     // get the value of the search input field
//     var searchString = $('#search').val().toLowerCase();
//
//     csvLayer.setFilter(showState);

    // here we're simply comparing the 'state' property of each marker
    // to the search string, seeing whether the former contains the latter.


    // map.addControl( new L.Control.Search({layer: searchLayer}) );
    //   initialize: function  (options) {
    //     L.Util.setOptions(this, options);
    //   },
    //   onAdd: function (map) {
    //
    //   },
    //   onRemove: function (map) {
    //
      //  }

    // });

// https://api.mapbox.com/v4/{resource}.json?access_token=pk.eyJ1IjoiZWJhaWRlbiIsImEiOiJjaWdtZ3FnYjAwMjR5dWpsemRyYWNpdmlrIn0.XW3IoHY9t2AEg68CcrD2_Q


    // map.panTo(new L.LatLng(35.994, -78.898));
    // function searchByAjax(text, callResponse) {
    //   return $.ajax({
    //     url: '',
    //     data: {crops: text},
    //     dataType: 'json',
    //     success: function(json) {
    //         callResponse(json)
    //     }
    //   })
    // }

    	// map.addControl( new L.Control.Search({sourceData: searchByAjax, text:'Color...', markerLocation: true}) );
}); // end of the function
