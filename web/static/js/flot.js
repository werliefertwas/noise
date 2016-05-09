$(function() {
  var updateInterval = 30;
  var setupGrid = false;

  // We use an inline data source in the example, usually data would
  // be fetched from a server
  var data = [],
    totalPoints = 300;
  function getRandomData() {
    if (data.length > 0)
      data = data.slice(1);
    // Do a random walk
    while (data.length < totalPoints) {
      var prev = data.length > 0 ? data[data.length - 1] : 50,
        y = prev + Math.random() * 10 - 5;
      if (y < 0) {
        y = 0;
      } else if (y > 100) {
        y = 100;
      }
      data.push(y);
    }
    // Zip the generated y values with the x values
    var res = [];
    for (var i = 0; i < data.length; ++i) {
      res.push([i, data[i]])
    }
    return res;
  }

  let plot = $.plot("#placeholder", [], {
    series: {
      shadowSize: 0	// Drawing is faster without shadows
    },
    yaxis: {
      min: 0,
      max: 100
    },
    xaxis: {
      show: true
    }
  });

  function update() {
    plot.setData([getRandomData()]);
    if(!setupGrid) {
      plot.setupGrid();
      setupGrid = true;
    }
    // Since the axes don't change, we don't need to call plot.setupGrid()
    plot.draw();
    setTimeout(update, updateInterval);
  }

  export default plot
});
