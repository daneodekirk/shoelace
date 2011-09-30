doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    title -> 'Cake'

    link rel: 'stylesheet', href: 'css/docs.css'
    script src: 'http://code.jquery.com/jquery.min.js'

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

        # Grid Section
        section '#grid-system', ->
          div '.page-header', ->
          h1 ->
            text 'Grid System '
            small 'Roll your own'
          div '.row.controls', ->
            div '.span4', ->
              text 'Pick the span you wish to use'
            div '.span11', ->
              text 'these are the controls'


          div '.row.show-grid', ->
            (span '.span1', -> '1') for num in [16..1]
          div '.row.show-grid', ->
            (span '.span2', -> '8') for num in [8..1]
          div '.row.show-grid', ->
            (span '.span3', -> '3') for num in [5..1]
            span '.span1.column', -> '1'
          div '.row.show-grid', ->
            (span '.span4', -> '4') for num in [4..1]
          div '.row.show-grid', ->
            (span '.span-one-third', -> '1/3') for num in [3..1]
          div '.row.show-grid', ->
            span '.span-one-third', -> '1/3'
            span '.span-two-thirds', -> '2/3'
          div '.row.show-grid', ->
            span '.span4', -> '4'
            (span '.span6', -> '6') for num in [2..1]
          div '.row.show-grid', ->
            (span '.span8', -> '8') for num in [2..1]
          div '.row.show-grid', ->
            span '.span5', -> '5'
            span '.span11', -> '11'
          div '.row.show-grid', ->
            span '.span16', -> '16'

    #link id:'bootstrap', rel:'stylesheet/less', href:"/bootstrap/scaffolding"
    style id:'test'

    script src: 'js/less.js'

    coffeescript ->
      $ ->
        style = $('#test')
        $.get '/bootstrap/scaffolding', (data) ->
          parser = less.Parser()
          parser.parse data, (err, tree) ->
            throw err if err
            style.html tree.toCSS compress:true





