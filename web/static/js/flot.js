let plot = $.plot("#placeholder", [], {
  series: {
    shadowSize: 0	// Drawing is faster without shadows
  },
  yaxis: {
    transform: function(v) { return Math.log(v); },
    inverseTransform: function (v) { return Math.exp(v); }
  },
  xaxis: {
    show: false
  }
})

plot.addDataPoint = function(point, label) {
  if(this.count == undefined) {
      this.count = {}
  }

  if (this.data == undefined) {
    this.data = {}
  }

  if(this.data[label] == undefined){
    this.data[label] = {
      "label": label,
      "data": []
    }
  }

  if(this.count[label] == undefined){
    this.count[label] = 0
  }

  this.data[label].data.push([this.count[label]++, point])

  if(this.data[label].data.length > 21) {
    for(var key in this.data){
      this.data[key].data.shift(1)
    }
  }

  var labels = Object.keys(this.data);
  var data = [];
  var self = this;
  labels.forEach(function(elem) {
    data.push(self.data[elem])
  });

  this.setData(data)
  this.setupGrid()
  this.draw()
}

export default plot
