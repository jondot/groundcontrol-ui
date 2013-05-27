

source   = $("#template-health").html()
template = Handlebars.compile(source)

createSeries = (data, skey)->
  _.map data, (d)=>
    k = _.first(_.keys(d))

    {x: parseInt(k), y: d[k][skey]}


$.getJSON "/health", (data)=>
  recent = _.clone( _.first(_.values(_.first(data))))
  recent.loadAvg15 = recent.loadAvg15.toFixed(2)

  context =
    health: recent

  console.log "context", context

  html    = template(context)
  $("#health").html(html)



  series = []
  series.push( { data: createSeries(data, "loadAvg15").reverse(), color: 'rgba(255,255,255,0.15)', stroke: 'rgba(255,255, 255, 0.65)'} )
  # series.push( { data: createSeries(data, "cpuTemp").reverse(), color: 'rgba(96,170,255,0.5)',stroke: 'rgba(0,0,0,0.15)' } )


  console.log "series", series
  graph = new Rickshaw.Graph
      series: series,
      height: 80,
      renderer: 'area',
      stroke: true,
      element: document.querySelector('#graph')

  console.log "graph", graph

  graph.renderer.unstack = true
  graph.render()

  $(window).on 'resize', =>
    console.log "resize!"
    graph.configure(width: $('#graph').width(), height: $('#graph').height())
    graph.render()

  console.log "done"


