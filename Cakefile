fs   = require 'fs'
express = require 'express'

parser = require('uglify-js').parser
uglify = require('uglify-js').uglify

less   = require 'less'
lessparser = new less.Parser

{exec} = require 'child_process'

task 'bake', 'Run the server', ->
  require './lib/bake'
