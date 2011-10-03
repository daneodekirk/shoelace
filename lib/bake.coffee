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

app.get '/step/width', (request, response) ->
  response.render 'width'
  
app.get '/step/scaffolding/:width?', (request, response) ->
  width = request.param 'width'
  response.render 'scaffolding', width:width

app.post '/grid/:size?', (request, response) ->
  size = request.param 'size'
  console.log size
  response.send JSON.stringify size:size

app.post '/shoelaces', (request, response) ->
  size = request.param 'settings'
  console.log size
  response.send JSON.stringify size:size

app.get '/:script.js', (request, response) ->
  response.header 'Content-Type', 'application/x-javascript'
  file = fs.readFileSync "#{STATIC}/js/#{request.param 'script'}.coffee", "ascii"
  response.send coffee.compile file

app.listen 1123
console.log "Server running on port #{app.address().port}"
