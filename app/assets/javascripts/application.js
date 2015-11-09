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
//= require_tree .
//= require jquery
//= require bootstrap-sprockets

// $('#trade_type').bind('change', function() {
//   $('#crop_pic').hide();
//   $('#crop_pic input').attr('disabled', true);
//   var selection = $(this).val();
//   $('#crop_pic' + selection).show();
//   $('#crop_pic' + selection + ' input').attr('disabled', false);
// }).change();

//= require mapbox.js
//= require d3
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
  //
  var color_hash = {  0 : ["apple", "green"],
  1 : ["mango", "orange"],
  2 : ["cherry", "red"]
}
//
// var legend = svg.append("g")
// 	  .attr("class", "legend")
// 	  .attr("x", width - 65)
// 	  .attr("y", 25)
// 	  .attr("height", 100)
// 	  .attr("width", 100);

  //
  // legend.selectAll('circle')
  //     .data(dataset)
  //     .enter()

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

$(document).ready(function () {
  var map = L.map('map', 'crops')
  .setView([35.994, -78.898], 9);
  L.tileLayer('https://api.tiles.mapbox.com/v4/{id}/{z}/{x}/{y}.png?access_token={accessToken}', {
    attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery © <a href="http://mapbox.com">Mapbox</a>',
    maxZoom: 18,
    id: 'ebaiden.cigmgqf43027nurkrnufjii94',
    accessToken: 'pk.eyJ1IjoiZWJhaWRlbiIsImEiOiJjaWdtbHozMjEwMDA3bjlrb2gwaTY1ZThqIn0.w4-Mcgb3JXeCNLjFvigYDg',



  }).addTo(map);

  L.mapbox.accessToken = 'pk.eyJ1IjoiZWJhaWRlbiIsImEiOiJjaWdtbHozMjEwMDA3bjlrb2gwaTY1ZThqIn0.w4-Mcgb3JXeCNLjFvigYDg';



  /*
  needed for code  L.mapbox.featureLayer
   */

  //L.mapbox.featureLayer

    //var crops = [];

    L.marker([35.994, -78.898]).addTo(map)
        .bindPopup('You are Here')
        .openPopup();

        // var featureLayer = L.mapbox.tileLayer().addTo(map);


        // var layer = L.mapbox.tileLayer('')
        // layer.on('ready', function() {
        //
        // });


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

// $(document).ready(function () {
//   var margin = {top: 20, right: 30, bottom: 30, left: 40},
//       width = 960 - margin.left - margin.right,
//       height = 500 - margin.top - margin.bottom;
//
//   var x = d3.scale.ordinal()
//       .rangeRoundBands([0, width], .1);
//
//   var y = d3.scale.linear()
//       .range([height, 0]);
//
//   var xAxis = d3.svg.axis()
//       .scale(x)
//       .orient("bottom");
//
//   var yAxis = d3.svg.axis()
//       .scale(y)
//       .orient("left");
//
//   var chart = d3.select(".chart")
//       .attr("width", width + margin.left + margin.right)
//       .attr("height", height + margin.top + margin.bottom)
//     .append("g")
//       .attr("transform", "translate(" + margin.left + "," + margin.top + ")");
//
//   d3.csv("/avgexpenses.csv", type, function(error, data) {
//     x.domain(data.map(function(d) { return d.name; }));
//     y.domain([0, d3.max(data, function(d) { return d.value; })]);
//
//     chart.append("g")
//         .attr("class", "x axis")
//         .attr("transform", "translate(0," + height + ")")
//         .call(xAxis);
//
//     chart.append("g")
//         .attr("class", "y axis")
//         .call(yAxis);
//
//     chart.selectAll(".bar")
//         .data(data)
//       .enter().append("rect")
//         .attr("class", "bar")
//         .attr("x", function(d) { return x(d.name); })
//         .attr("y", function(d) { return y(d.value); })
//         .attr("height", function(d) { return height - y(d.value); })
//         .attr("width", x.rangeBand());
//   });
//
//   function type(d) {
//     d.value = +d.value; // coerce to number
//     return d;
//   };
//
// });
//
