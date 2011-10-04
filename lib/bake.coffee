express = require 'express'
less = require 'less'
app = express.createServer()
fs = require 'fs'
coffee = require 'coffee-script'

ONEWEEK = 2629743000
STATIC = "#{process.cwd()}/static"

app.set 'view options', { layout : false }
app.set 'view engine', 'coffee'
app.register '.coffee', require('coffeekup').adapters.express

app.use express.static "#{STATIC}", { maxAge: ONEWEEK }
app.use express.bodyParser()
app.use express.errorHandler()
#app.use express.compiler { src:"#{STATIC}", enable: ['less'] }

app.get '/', (request, response) ->
  response.render 'index', foo: 'bar'

app.post '/shoelaces', (request, response) ->
  settings = request.param 'settings'
  console.log settings
  response.header 'Content-Type: text/css'
  variables = """ 
    // Links
    @linkColor:         #0069d6;
    @linkColorHover:    darken(@linkColor, 15);

    // Accent Colors
    @blue:              #{settings.blue};
    @blueDark:          #{settings.darkblue};
    @green:             #{settings.green};
    @red:               #{settings.red};
    @yellow:            #{settings.yellow};
    @orange:            #{settings.orange};
    @pink:              #{settings.pink};
    @purple:            #{settings.purple};

    // Baseline grid
    @basefont:          #{settings.basefont}px;
    @baseline:          #{settings.baseline}px;

    // Griditude
    @gridColumns:       #{settings.cols};
    @gridColumnWidth:   #{settings.colw}px;
    @gridGutterWidth:   #{settings.gutter}px;
    @extraSpace:        (@gridGutterWidth * 2);
    @siteWidth:         (@gridColumns * @gridColumnWidth) + (@gridGutterWidth * (@gridColumns - 1));
  """
  cssfiles = [
    "#{STATIC}/bootstrap/lib/reset.less",
    "#{STATIC}/bootstrap/lib/variables.less",
    "#{STATIC}/bootstrap/lib/mixins.less",
    "#{STATIC}/bootstrap/lib/scaffolding.less",
    "#{STATIC}/bootstrap/lib/type.less",
    "#{STATIC}/bootstrap/lib/forms.less",
    "#{STATIC}/bootstrap/lib/tables.less",
    "#{STATIC}/bootstrap/lib/patterns.less",
  ]

  lesscss = new Array remaining = cssfiles.length
  for file, index in cssfiles then do (file, index) ->
    fs.readFile "#{file}", 'utf8', (err, fileContents) ->
      throw err if err
      lesscss[index] = fileContents
      process() if --remaining is 0
  process = ->
    lesscss.splice 2, 0, variables
    cssstring = lesscss.join('\n\n')
    parser = new less.Parser
    parser.parse cssstring, (err, tree) ->
      throw err if err
      response.send tree.toCSS(compress:settings.minify)

app.get '/:script.js', (request, response) ->
  response.header 'Content-Type', 'application/x-javascript'
  file = fs.readFileSync "#{STATIC}/js/#{request.param 'script'}.coffee", "ascii"
  response.send coffee.compile file

app.listen 1123
console.log "Server running on port #{app.address().port}"
