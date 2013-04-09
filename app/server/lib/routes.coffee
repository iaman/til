fs = require('fs')
exports.run_paths = (app) ->
  app.get '/', (req, res) ->
    res.render 'index.jade',
      title: 'Motherfucking Knowledge Gain',
      page: 'Home'

  app.get '/styleguide', (req, res) ->
    res.render 'styleguide.jade',
      title: 'Check out deez styles',
      page: 'Styleguide'