stylus = require 'stylus'
stitch = require 'stitch'
connect = require 'connect'
nib = require 'nib'

compiler = (str, path) ->
  stylus(str)
    .set('filename', path)
    .set('compress', true)
    .use nib()

jsDependencies = [
  "#{__dirname}/../public/js/thirdparty/jquery.js"
  "#{__dirname}/../public/js/thirdparty/underscore.js"
  "#{__dirname}/../public/js/thirdparty/backbone.js"
  "#{__dirname}/../public/js/toggle-grid.js"
]

stylusOptions =
  src: "#{__dirname}/../app/client/stylus"
  dest: "#{__dirname}/../public"
  compile: compiler
  debug: true

pkg = stitch.createPackage paths:[], dependencies:jsDependencies

jsMiddleware = (req, res, next) ->
  return next() unless '/js/application.js' == req.url
  pkg.createServer()(req, res, next)

stylusMiddleware = stylus.middleware stylusOptions
staticMiddleware = connect.static "#{__dirname}/../public"

module.exports = (req, res, next) ->
  jsMiddleware req, res, () ->
    stylusMiddleware req, res, () ->
      staticMiddleware req, res, () ->
        next()
