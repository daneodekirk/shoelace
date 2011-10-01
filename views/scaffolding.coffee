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

    link id:'bootstrap', rel:'stylesheet/less', href:"/bootstrap/lib/bootstrap.less"
    script src: 'js/less.js'
