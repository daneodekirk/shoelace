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
        settings.width = ui.value
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
        $('#column-value').html(ui.value)
        $('.row.show-grid').each (index, element) ->
          currentspan = $(this).data 'span'
          if index is 0 or index is 4
            $(this).data 'span', ui.value
          else
            $(this).empty()
            val = Math.floor ui.value / $(this).data 'span'
            mod = ui.value % val
            modclone = $('#preview').find('.row').eq(mod).find('span').first().clone()
            modclone.addClass('appended')
            $(this).append("<span class='span#{val}' style='margin-left:20px;'>#{index}</span>") for num in [val..1]
            $(this).append(modclone) while mod--
            console.log $(this) if mod is 0 and index is 3
            

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
        $('#width-value').html("#{ui.value}px")
        $('.row.show-grid').each ->
          span = $(this).data('span')
          width = settings.colw * span + (settings.gutter * (span - 1))
          classname = $(this).find('span').not('.appended')
            .css('width', width)
            .attr('class')
          $('#preview').find(".#{classname}.appended").css 'width', width
        adjustWidth settings
        
  $('#column-gutter')
    .slider
      value: settings.gutter,
      min: 0,
      max: 40,
      step: 1,
      slide: (event, ui) ->
        settings.gutter = ui.value
        $('#gutter-value').html("#{ui.value}px")
        $('.row.show-grid').each ->
          span = $(this).data('span')
          width = settings.colw * span + (settings.gutter * (span - 1))
          classname = $(this).find('span').not('.appended')
            .css('width': width, 'margin-left':"#{ui.value}px")
            .attr('class')
          $('#preview').find(".#{classname}.appended").css('width': width, 'margin-left':"#{ui.value}px")
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

  $('.gimme').click ->
    settings.minify = $(this).data 'minify'
    $.post '/shoelaces', {'settings':settings}, (data) ->
      $('#code').html(data)
    return false

  $('#code').click ->
    doc = document
    text = $(this).get(0)
    if doc.body.createTextRange
        range = document.body.createTextRange()
        range.moveToElementText(text)
        range.select()
    else if window.getSelection
        selection = window.getSelection()
        if selection.setBaseAndExtent
            selection.setBaseAndExtent(text, 0, text, 1)
        else
            range = document.createRange()
            range.selectNodeContents(text)
            selection.removeAllRanges()
            selection.addRange(range)

  $('#code-direction').click -> $('#code').trigger 'click'
    

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

  $('#code-wrapper').hover ->
    $(this).find('.twipsy').fadeToggle()

adjustWidth = (settings) ->
      sitewidth = (settings.cols * settings.colw) + (settings.gutter * (settings.cols - 1))
      $('#current-width').find('h2').html "#{sitewidth}px"
      settings.width = sitewidth

      $('#preview')
        .css(
          'width': sitewidth + 20
          'margin-left': (940 - sitewidth)/2
        )
