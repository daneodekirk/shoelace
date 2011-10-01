doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    title -> 'Cake'

    link rel: 'stylesheet', href: 'css/ui-lightness/jquery-ui-1.8.16.custom.css'
    link rel: 'stylesheet', href: 'css/docs.css'
    link id:'bootstrap', rel:'stylesheet/less', href:"/bootstrap/lib/bootstrap.less"
    script src: 'js/less.js'
    script src: 'http://code.jquery.com/jquery.min.js'
    script src: '/js/jquery-ui-1.8.16.custom.min.js'

  body ->
    div '.topbar', ->
      div '.topbar-inner', ->
        div '.container', ->
          a '.brand', href:'#', -> "Bootstrap"
          ul '.nav', ->
            li -> a href:"#overview", -> 'Overview'
            li -> a href:"#overview", -> 'Grid'
    
    div '.container', ->
      div '.content', ->


    coffeescript ->
      $ ->
        width = 940
        $.get '/step/width', (data) ->
          $('.content')
            .prepend(data)
            .find('#slider')
            .slider
              value:940,
              min: 780,
              max: 1100,
              step: 10,
              slide: ( event, ui ) ->
                $('#current-width').html("#{ui.value}px")
                  .css
                    'width': ui.value
                    'margin-left': (940 - ui.value)/2 + 20

        $.get "/step/scaffolding/#{width}", (data) ->
          $('.content')
            .prepend(data)
            .find('#slider')
            .slider
              value:940,
              min: 780,
              max: 1100,
              step: 10,
              slide: ( event, ui ) ->
                $('#current-width').html("#{ui.value}px")
                  .css
                    'width': ui.value
                    'margin-left': (940 - ui.value)/2 + 20
