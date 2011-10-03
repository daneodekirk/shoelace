$(document).ready ->
  settings =
    width: 960,
    cols: 16,
    colw: 40,
    gutter: 20
    basefont:13
    baseline:18
    blue:'#049cdB'
    darkblue:'#0064cd'
    green:'#46a546'
    red:'#9d261d'
    yellow:'#ffc40d'
    orange:'#f89406'
    pink:'#c3325f'
    purple:'#7a43b6'

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
            $(this).append("<span class='span#{val}'>#{index}</span>") for num in [val..1]
            $(this).append("<span class='span#{mod} appended'>#{mod}</span>") if mod isnt 0
            #if ui.value > settings.cols and ui.value >= 16 then $(this).append("<span class='span#{1} appended'>1</span>") else $(this).find('.appended:last').remove() 
            

          span = $(this).data 'span'
          width = settings.colw * span + (settings.gutter * (span - 1))
          $(this).find('span').not('.appended')
            .css 'width': width, 'margin-left':"#{settings.gutter}px"
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
  
  ### 
  # font size here
  ###

  $('#baseline, #basefont').bind 'keyup', (e) ->
    val = Number $(this).val()
    $(this).val(val+1) if e.keyCode is 38 
    $(this).val(val-1) if e.keyCode is 40
    settings.basefont = $('#basefont').val()
    settings.baseline = $('#baseline').val()
    $(this).closest('.row')
      .find('h1')
      .css( 'marginBottom', "#{settings.baseline}px",)
        .end()
      .closest('.row')
      .find('p')
      .css(
        'marginBottom': "#{settings.basefont / 2}px",
        'fontSize': "#{settings.basefont }px"
      )
      .find('small')
      .css('fontSize', "#{settings.basefont - 2}px")
        .end()
      .closest('.row')
      .find('.btn')
      .css('fontSize', "#{settings.basefont}px")

  ###
  # Button Colors
  ###

  $('#site-width')
    .find('.btn')
    .not('.gimme')
    .each ->
      $(this).bind 'click', () ->
        color = settings[$(this).data('color')]
        $('#colorpicker').insertAfter($(this))
          .fadeIn(200)
          .find('input')
          .val(color)

  $('#hex').bind 'blur', ->
    color = $(this).parent().siblings('button').data('color')
    val = $(this).val()
    settings[color] = val

  #$('#hex').bind 'focus', ->
  #  $('#colors').farbtastic('#hex')
  #
  $('.gimme').click ->
    $.post '/shoelaces', settings, (data) ->
      console.log settings
    return false

          
        

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

adjustWidth = (settings) ->
      sitewidth = (settings.cols * settings.colw) + (settings.gutter * (settings.cols - 1))
      $('#current-width').find('h2').html "#{sitewidth}px"

      $('#preview') 
        .css(
          'width': sitewidth + 20
          'margin-left': (940 - sitewidth)/2
        )
