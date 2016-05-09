let plot = $.plot("#placeholder", [], {
  series: {
    shadowSize: 0	// Drawing is faster without shadows
  },
  yaxis: {
    min: 0,
    max: 1
  },
  xaxis: {
    show: false
  }
})

plot.addDataPoint = function(point) {
  if (this.data == undefined) {
    this.data = []
    this.count = 0
  }

  this.data.push([this.count++, point])

  if(this.data.length > 21) {
    this.data.shift(1)
  }

  this.setData([this.data])
  this.setupGrid()
  this.draw()
}

export default plot
