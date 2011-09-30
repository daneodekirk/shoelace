express = require 'express'
less = require 'less'
app = express.createServer()
fs = require 'fs'

ONEWEEK = 2629743000
STATIC = "#{process.cwd()}/static"

app.set 'view options', { layout : false }
app.set 'view engine', 'coffee'
app.register '.coffee', require('coffeekup').adapters.express

app.use express.static "#{STATIC}", { maxAge: ONEWEEK }
app.use express.bodyParser()
app.use express.errorHandler()
app.use express.compiler { src:"#{STATIC}", enable: ['less'] }

app.get '/', (request, response) ->
  response.render 'index', foo: 'bar'

#app.get '/bootstrap?:step?', (request, response) ->
app.get '/bootstrap/:step?', (request, response) ->
  step = request.param 'step'
  response.send """
    @import '/bootstrap/lib/reset.less';
    @import '/bootstrap/lib/variables.less';
    @import '/bootstrap/lib/mixins.less';

    @import '/bootstrap/lib/#{step}.less';
  """


app.listen 1123
console.log "Server running on port #{app.address().port}"
