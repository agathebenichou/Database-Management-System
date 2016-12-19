function render_graph(names, data){

var height = 200;

var svg = d3.select('#graph').append("svg:svg").attr("class", "chart").attr("height",400).attr("width",700);
var dataArray = data;
var nameArray = names;

var margin = {left:200, top:30}

var x = d3.scaleLinear()
            .domain([0,100])
            .range([0,400]);

var xAxis = d3.axisBottom(x);

var y = d3.scaleOrdinal()
			.domain(nameArray)
			.range([25, 85, 145]);

var yAxis = d3.axisLeft(y);

var chartGroup = svg.append("g").attr("transform","translate("+margin.left+","+margin.top+")");
chartGroup.selectAll("rect")
      .data(dataArray)
      .enter().append("svg:rect")
                .attr("height", 50)
                .attr("width", x)
                .attr("fill", "blue")
                .attr("y",function(d,i){ return i*60; });


chartGroup.append("g")
      .attr("class","x axis")
      .attr("transform","translate(0,175)")
      .call(xAxis);

chartGroup.append("g")
      .attr("class","y axis hidden")
      
      .call(yAxis);

chartGroup.append("text")
	.attr("class", "x label")
	.attr("text-anchor", "end")
	.attr("x", 220)
	.attr("y", 210)
	.text("Percent");

}