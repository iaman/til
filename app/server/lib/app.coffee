express = require 'express'
middleware = require '../../../lib/middleware'
app = express()

app.configure ->
  app.set('views', "#{__dirname}/../views")
  app.set('view engine', 'jade')
  app.use middleware

require("#{__dirname}/routes").run_paths(app)

port = process.env.PORT || 8080
app.listen port, ->
  console.log "Server up on port #{port}"
