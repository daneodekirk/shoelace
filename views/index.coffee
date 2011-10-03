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
    script src: 'app.js'

  body ->
    div '.topbar', ->
      div '.topbar-inner', ->
        div '.container', ->
          a '.brand', href:'#', -> "Bootstrap"
          ul '.nav', ->
          form '#prevnext.pull-right', ->
            button '.prev.btn', 'data-step':'scaffolding', -> 'Previous'
            button '.next.btn.info', 'data-step':'scaffolding', -> 'Next'
    
    div '.container', ->
      div '.content', ->
        div '.mask', ->
          # Site Width
          section '#site-width', ->
            div '.page-header', ->
              h1 ->
                text 'Site Width '
                small 'Adjust site width'

              div '.row controls', ->
                span '.span4' , ->
                  h2 -> small 'Columns'
                span '.span12' , ->
                  div '#columns', ->
                    span ''
              div '.row controls', ->
                span '.span4' , ->
                  h2 -> small 'Column Width'
                span '.span12' , ->
                  div '#column-width', ->
                    span ''
              div '.row controls', ->
                span '.span4' , ->
                  h2 -> small 'Column Gutters'
                span '.span12' , ->
                  div '#column-gutter', ->
                    span ''

            div '#preview', ->
              div '.row.show-grid', 'data-span':16, ->
                span '#current-width.span16', style:'height:150px;', ->
                  h2 '940px'
              div '.row.show-grid', 'data-span':1, ->
                (span '.span1', -> '1') for num in [16..1]
              div '.row.show-grid', 'data-span':2, ->
                (span '.span2', -> '8') for num in [8..1]
              #div '.row.show-grid', ->
              #  (span '.span3', -> '3') for num in [5..1]
              #  span '.span1.column', -> '1'
              div '.row.show-grid', 'data-span':4, ->
                (span '.span4', -> '4') for num in [4..1]
              #div '.row.show-grid', ->
              #  (span '.span-one-third', -> '1/3') for num in [3..1]
              #div '.row.show-grid', ->
              #  span '.span-one-third', -> '1/3'
              #  span '.span-two-thirds', -> '2/3'
              #div '.row.show-grid', ->
              #  span '.span4', -> '4'
              #  (span '.span6', -> '6') for num in [2..1]
              #div '.row.show-grid', ->
              #  (span '.span8', -> '8') for num in [2..1]
              #div '.row.show-grid', ->
              #  span '.span5', -> '5'
              #  span '.span11', -> '11'
              div '.row.show-grid', 'data-span':16, ->
                span '.span16', -> '16'

          # Site Scaffolding
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


          # Site Colors
          section '#site-colors', ->
            div '.page-header', ->
              h1 ->
                text 'Colors '
                small 'Roll your own'
              div '.row.controls', ->
                div '.span4', ->
                  text 'Pick the span you wish to use'
                div '.span11', ->
                  text 'these are the controls'
