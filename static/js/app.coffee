$ ->
  settings =
    width: 960,
    cols: 16,
    colw: 40,
    gutter: 20

  #$('.row.show-grid').each ->
  #    $(this).data('span', $(this).attr('data-span'))
  #      .removeAttr('data-span')

  width = 940
  grid = $('.row.show-grid span')
  #$.get '/step/width', (data) ->
  $('.content')
    #.prepend(data)
    .find('#slider')
    .slider
      value:settings.width,
      min: 780,
      max: 1100,
      step: 10,
      slide: ( event, ui ) ->
        $('#site-width').children('div')
          .css(
            'width': ui.value
            'margin-left': (940 - ui.value)/2 + 20
          )
          .find('h2')
          .html("#{ui.value}px")

  $('#columns')
    .slider
      value:settings.cols,
      min: 0,
      max: 32,
      step: 1,
      slide: (event, ui) ->
        $('#columns span').html(ui.value)
        $('.row.show-grid').each (index, element) ->
          currentspan = $(this).data 'span'
          if index is 0 or index is 4
            $(this).data 'span', ui.value
          else
            $(this).empty()
            val = Math.floor ui.value / $(this).data 'span'
            mod = ui.value % val
            console.log mod
            $(this).append("<span class='span#{val}'>#{index}</span>") for num in [val..1]
            $(this).append("<span class='span#{mod} appended'>#{mod}</span>") if mod isnt 0
            #if ui.value > settings.cols and ui.value >= 16 then $(this).append("<span class='span#{1} appended'>1</span>") else $(this).find('.appended:last').remove() 
            

          span = $(this).data 'span'
          width = settings.colw * span + (settings.gutter * (span - 1))
          $(this).find('span').not('.appended')
            .css 'width', width
        settings.cols = ui.value
        adjustWidth settings

  $('#column-width')
    .slider
      value:settings.colw,
      min: 0,
      max: 80,
      step: 1,
      slide: (event, ui) ->
        settings.colw = ui.value
        $('#column-width span').html(ui.value)
        $('.row.show-grid').each ->
          span = $(this).data('span')
          width = settings.colw * span + (settings.gutter * (span - 1))
          $(this).find('span').not('.appended')
            .css 'width', width
        adjustWidth settings
        
  $('#column-gutter')
    .slider
      value: settings.gutter,
      min: 0,
      max: 40,
      step: 1,
      slide: (event, ui) ->
        settings.gutter = ui.value
        $(this).find('span').html(ui.value)
        $('.row.show-grid').each ->
          span = $(this).data('span')
          width = settings.colw * span + (settings.gutter * (span - 1))
          $(this).find('span').not('.appended')
            .css 'width': width, 'margin-left':"#{ui.value}px"
        adjustWidth settings

adjustWidth = (settings) ->
      sitewidth = (settings.cols * settings.colw) + (settings.gutter * (settings.cols - 1))
      $('#current-width').find('h2').html "#{sitewidth}px"

      $('#preview') 
        .css(
          'width': sitewidth + 20
          'margin-left': (940 - sitewidth)/2
        )
    



$ ->
  steps = ['width', 'scaffolding']
  $('#prevnext').submit ->
    return false

  $('.next').click (e) ->
    width = $('.content section').width() + 400
    $('.mask')
      .animate
        marginLeft:"+=#{-1*width}"
      , 300
    return false

  $('.prev').click (e) ->
    width = $('.content section').width() + 400
    $('.mask')
      .animate
        marginLeft:"-=#{-1*width}"
      , 300
    return false
