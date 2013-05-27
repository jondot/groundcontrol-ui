
source   = $("#template-controls").html()
template = Handlebars.compile(source)

$.getJSON "/controls/all", (data)->
  context =
    controls: data

  html    = template(context)
  $("#controls-listing").html(html)

  actions = $("a[data-action]")

  actions.on 'click', ()->
    ctrl = $( this ).closest("li[data-control]").data('control')
    action = $( this ).data('action')

    console.log(ctrl,action)
    $.post "/controls/#{ctrl}/#{action}", (data)->
      console.log(data)
      alertify.log "Command sent."

    return true

