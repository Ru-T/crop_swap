var svg = d3.select("svg");

var g = svg.append("g");
g.attr("transform", "translate(100,50)");

var gx = g.append("g")
gx.attr("transform", "translate(0,400)");

var x = d3.scale.linear()
    .domain([0, 1000000])
    .range([0, 800]);
var y = d3.scale.linear()
    .domain([0, 2000000])
    .range([400, 0]);

var y_axis = d3.svg.axis().scale(y).orient("left").ticks(4);
g.call(y_axis);


var x_axis = d3.svg.axis().scale(x).orient("bottom").ticks(5).tickFormat(d3.format("d"));
gx.call(x_axis);


d3.csv("avgexpenses.csv", function(data) {

  .row(function(d) { return {key: d.key, value: +d.value}; })
   .get(function(error, rows) { console.log(rows); });
  g.selectAll("circle")
      .data(data)
    .enter().append("circle")
      .attr("cx", function(d) {return x(d["Earnings_of_farms"]);} )
      .attr("cy", function(d) {return y(d["average_farm_production_expenses"]);} )
      .attr("r", 10);
});
