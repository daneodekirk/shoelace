# Site Width
section '#site-width', ->
  div '.page-header', ->
  h1 ->
    text 'Site Width '
    small 'Adjust site width'

  div '.row controls', ->
    span '.span16' , ->
      div '#slider', ->

  div '.row.show-grid', ->
    span '#current-width.span16', style:'height:450px;', -> 'WIDTH'
