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
//= require_tree .



$(document).ready(function () {
  var svg = d3.select("svg");

  var g = svg.append("g");
  g.attr("transform", "translate(100, 50)");

  var gx = g.append("g")
  gx.attr("transform", "translate(0,400)");

  // var legend =  legend = svg.append("g")
  //   .attr("class","legend")
  //   .attr("transform","translate(50,30)")
  //   .style("font-size","12px")
  //   .call(d3.legend);
  //
//   //
//   var color_hash = {  0 : ["apple", "green"],
//   1 : ["mango", "orange"],
//   2 : ["cherry", "red"]
// }


  var x = d3.scale.linear()
      .domain([0, 1000000])
      .range([0, 850]);
  var y = d3.scale.linear()
      .domain([0, 2000000])
      .range([400, 0]);

  var y_axis = d3.svg.axis().scale(y).orient("left").ticks(4);
  g.call(y_axis);


  var x_axis = d3.svg.axis().scale(x).orient("bottom").ticks(5).tickFormat(d3.format("d"));
  gx.call(x_axis);


  d3.csv("avgexpenses.csv", function(data) {

    g.selectAll("circle")
        .data(data)
      .enter().append("circle")
        .attr("cx", function(d) {return x(d["Earnings_of_farms"]);} )
        .attr("cy", function(d) {return y(+d["average_farm_production_expenses"]);} )
        .attr("r", 10);
  });

});


// Leaftlet/map code

$(document).ready(function () {
  var map = L.map('map', 'crops')
  .setView([35.994, -78.898], 9);
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18,
    id: 'ebaiden.cigmgqf43027nurkrnufjii94',
    accessToken: 'pk.eyJ1IjoiZWJhaWRlbiIsImEiOiJjaWdtbHozMjEwMDA3bjlrb2gwaTY1ZThqIn0.w4-Mcgb3JXeCNLjFvigYDg',

  }).addTo(map);


  var markersLayer = new L.LayerGroup();
      map.addLayer(markersLayer);

      L.marker([35.994, -78.898]).addTo(map)
          .bindPopup('You are Here')
          .openPopup();

//
// var description = addressPoints[0].description,
//     testMarker = new L.Marker(new [34, -77], {weight: weight});
//     testMarker.bindPopup('weight' + weight);




  // L.mapbox.accessToken = 'pk.eyJ1IjoiZWJhaWRlbiIsImEiOiJjaWdtbHozMjEwMDA3bjlrb2gwaTY1ZThqIn0.w4-Mcgb3JXeCNLjFvigYDg';
  //
  // L.Control.Search = L.Control.extend({
  //
  //   options {
  //
  //     url: 'localhost:3000/crops.json',
  //     container: 'leaftlet-container',
  //     position: 'topleft',
  //     casesentitive: 'false',
  //     markerLocation: 'true'
  //
  //
  //   },
  //   addTo: function (map) {

		// if(this.options.container) {
		// 	this._container = this.onAdd(map);
		// 	this._wrapper = L.DomUtil.get(this.options.container);
		// 	this._wrapper.style.position = 'relative';
		// 	this._wrapper.appendChild(this._container);
		// }
		// else
		// 	L.Control.prototype.addTo.call(this, map);
    //
		// return this;
	// },
  // }).addTo(map);


  /*
  needed for code  L.mapbox.featureLayer
   */

  //L.mapbox.featureLayer

    //var crops = [];


        // var featureLayer = L.mapbox.tileLayer().addTo(map);


        // var layer = L.mapbox.tileLayer('')
        // layer.on('ready', function() {
        //
        // });




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

// https://api.mapbox.com/v4/{resource}.json?secure=1

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
