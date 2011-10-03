doctype 5
html ->
  head ->
    meta charset: 'utf-8'
    title -> 'Cake'

    link rel: 'stylesheet', href: 'css/ui-lightness/jquery-ui-1.8.16.custom.css'
    link rel: 'stylesheet', href: 'css/app.css'
    link rel: 'stylesheet', href: 'css/docs.css'
    link rel: 'stylesheet', href: 'farbastic/farbtastic.css'
    link id:'bootstrap', rel:'stylesheet/less', href:"/bootstrap/lib/bootstrap.less"
    script src: 'js/less.js'
    script src: 'http://code.jquery.com/jquery.min.js'
    script src: '/js/jquery-ui-1.8.16.custom.min.js'
    script src: 'farbastic/farbtastic.js'
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
              div '.row.show-grid', 'data-span':4, ->
                (span '.span4', -> '4') for num in [4..1]
              div '.row.show-grid', 'data-span':16, ->
                span '.span16', -> '16'

            div '.page-header', ->
              h1 ->
                text 'Typography '
                small "How big is big enough?"

            div '.row', ->
              div '.span4.font-controls', ->
                form '.form-stacked', ->
                  div '.clearfix', ->
                    div '.input', ->
                      label for:'basefont', -> 'Font Size'
                      div '.input-append', ->
                        input '.small', id:'basefont', name:'basefont', type:'text', value:13
                        span '.add-on', -> 'px'
                  div '.clearfix', ->
                    div '.input', ->
                      label for:'baseline', -> 'Base Height'
                      div '.input-append', ->
                        input '.small', id:'baseline', name:'baseline', type:'text', value:18
                        span '.add-on', -> 'px'
                  span '.help-block', ->
                    text 'Tip: arrow up and arrow down...'

              div '.span4', ->
                h1 -> "Heading 1"
                h2 -> "Heading 2"
                h3 -> "Heading 3"
                h4 -> "Heading 4"
                h5 -> "Heading 5"
              div '.span8', ->
                h1 ->
                  text 'Example heading', ->
                  small ' Has a sub-heading'
                h3 'Example Paragraph'
                p ->
                  text 'Nullam quis risus eget urna mollis ornare vel eu leo. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Nullam id dolor id nibh ultricies vehicula ut id elit. <br/>'
                  small 'Nullam quis risus eget urna mollis ornare vel eu leo'


            div '.page-header', ->
              h1 ->
                text 'Colors '
                small "Brighten it up a bit?"

            div '#colorpicker.input-append', style:'display:none', ->
              input '.small', id:'hex', name:'hex', type:'text', value:'#ffc40d', style:'width:85px', maxlength:7 
              span '.add-on', -> 'hex'
              div '#colors', ->

            div '.span16.well', ->
              span '.span3', ->
                button '.btn.info', 'data-color':'blue', -> 'Blue'
              span '.span3', ->
                button '.btn.primary', 'data-color':'darkblue', -> 'Dark Blue'
              span '.span3', ->
                button '.btn.success', 'data-color':'green', -> 'Green'
              span '.span3', ->
                button '.btn.danger', 'data-color':'red', -> 'Red'

            div '.span16.well', ->
              span '.span3', ->
                button '.btn', style:'background-color:#ffc40d', 'data-color':'yellow', -> 'Yellow'
              span '.span3', ->
                button '.btn',  style:'background-color:#f89406', 'data-color':'orange', -> 'Orange'
              span '.span3', ->
                button '.btn',  style:'background-color:#c3325f', 'data-color':'pink', -> 'Pink'
              span '.span3', ->
                button '.btn', style:'background-color:#7a43b6', 'data-color':'purple', -> 'Purple'
                
                


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
