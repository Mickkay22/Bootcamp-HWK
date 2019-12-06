// from data.js
var tableData = data;
// creating a variable for the button line 45
var button = d3.select("#filter-btn");
var resetButton = d3.select("#reset-btn");
// creating a variable for the tbody tag line 65
var tbody = d3.select("tbody");

// YOUR CODE HERE!
tableData.forEach((ufoData) => {
  var row = tbody.append("tr");
  Object.entries(ufoData).forEach(([key, value]) => {
    var cell = row.append("td");
    cell.text(value);
  });
});

resetButton.on("click",function(){
  tableData.forEach((ufoData) => {
    var row = tbody.append("tr");
    Object.entries(ufoData).forEach(([key, value]) => {
      var cell = row.append("td");
      cell.text(value);
    });
  });
})

button.on("click",function() {
  // Select the input element and get the raw HTML node
  d3.event.preventDefault();
  var inputElement = d3.select("#datetime");
  // Get the value property of the input element
  var inputValue = inputElement.property("value");
  //Debugging - seeing the inputValue in the console [INSPECT]
  console.log(inputValue);
  //Filtered data based off of the date input
  var filteredData = tableData.filter(sighting => sighting.datetime === inputValue);
  //Debugging - seeing the filtered Data in the console [INSPECT]
  console.log(filteredData[1]);

  tbody.html("");

  filteredData.forEach((ufoData) => {
    var row = tbody.append("tr");
    Object.entries(ufoData).forEach(([key, value]) => {
      var cell = row.append("td");
      cell.text(value);
    });
  });
});
