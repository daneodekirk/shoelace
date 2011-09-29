express = require 'express'
app = express.createServer()

ONEWEEK = 2629743000
DIR = process.cwd()

app.set 'view options', { layout : false }
app.set 'view engine', 'coffee'
app.register '.coffee', require('coffeekup').adapters.express

app.use express.static "#{DIR}/petals", { maxAge: ONEWEEK }
app.use express.errorHandler()
app.use express.compiler { src:"#{DIR}/petals", enable: ['less'] }

app.get '/', (request, response) ->
  response.render 'index', foo: 'bar'

app.listen 1123
console.log "Server running on port #{app.address().port}"
