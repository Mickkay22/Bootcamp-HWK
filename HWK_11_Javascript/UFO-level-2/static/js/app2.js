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
  d3.event.preventDefault();
  // Select the input element and get the raw HTML node
  var dateInputElement = d3.select("#datetime");
  var cityInputElement = d3.select("#city");
  var stateInputElement = d3.select("#state");
  var countryInputElement = d3.select("#country");
  var shapeInputElement = d3.select("#shape");
  // Get the value property of the input element
  var dateInputValue = dateInputElement.property("value");
  var cityInputValue = cityInputElement.property("value");
  var stateInputValue = stateInputElement.property("value");
  var countryInputValue = countryInputElement.property("value");
  var shapeInputValue = shapeInputElement.property("value");
  
  //Debugging - seeing the inputValue in the console [INSPECT]
  
  console.log(cityInputValue);
  
  //Filtered data based off of the date input
  var filteredData = tableData;
  if (dateInputValue) {
    filteredData = filteredData.filter(sighting => sighting.datetime === dateInputValue);
    console.log(dateInputValue);
  }

  if (cityInputValue) {
    filteredData = filteredData.filter(sighting => sighting.city === cityInputValue);
  }

  if (stateInputValue) {
    filteredData = filteredData.filter(sighting => sighting.state === stateInputValue);
    console.log(stateInputValue);
  }

  if (countryInputValue) {
    filteredData = filteredData.filter(sighting => sighting.country === countryInputValue);
    console.log(countryInputValue);
  }

  if (shapeInputValue) {
    filteredData = filteredData.filter(sighting => sighting.shape === shapeInputValue);
    console.log(shapeInputValue);
  }

  //Debugging - seeing the filtered Data in the console [INSPECT]
  console.log(filteredData);

  tbody.html("");

  filteredData.forEach((ufoData) => {
    var row = tbody.append("tr");
    Object.entries(ufoData).forEach(([key, value]) => {
      var cell = row.append("td");
      cell.text(value);
    });
  });
});
