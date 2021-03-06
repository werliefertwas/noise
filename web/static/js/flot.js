let plot = $.plot("#placeholder", [], {
  series: {
    shadowSize: 0	// Drawing is faster without shadows
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

  var data = [];
  for(var key in this.data){
    data.push(this.data[key])
  }

  this.setData(data)
  this.setupGrid()
  this.draw()
}

export default plot
