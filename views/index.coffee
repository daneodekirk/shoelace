doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    title -> 'Cake'

    link rel: 'stylesheet', href: 'css/ui-lightness/jquery-ui-1.8.16.custom.css'
    link rel: 'stylesheet', href: 'css/app.css'
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
          form '#prevnext.pull-right', ->
            button '.next.btn.info', 'data-step':'scaffolding', -> 'Next'
    
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
                $('#current-width')
                  .css(
                    'width': ui.value
                    'margin-left': (940 - ui.value)/2 + 20
                  )
                  .find('h2')
                  .html("#{ui.value}px")

  coffeescript ->
    $ ->
      steps = ['width', 'scaffolding']
      $('#prevnext').submit ->
        return false

      $('.next').click (e) ->
        step = $(this).data 'step'
        $.get "/step/#{step}", (data) ->
          width = $(window).width()
          $(data).find('section').css marginLeft:1.5*width
          $('.content section')
            .after(data)
            .animate
              marginLeft:-1*width
            , 300, -> $(this).hide()
        return false

        #$.get "/step/scaffolding/#{width}", (data) ->
        #  $('.content')
        #    .prepend(data)
        #    .find('#slider')
        #    .slider
        #      value:940,
        #      min: 780,
        #      max: 1100,
        #      step: 10,
        #      slide: ( event, ui ) ->
        #        $('#current-width').html("#{ui.value}px")
        #          .css
        #            'width': ui.value
        #            'margin-left': (940 - ui.value)/2 + 20
