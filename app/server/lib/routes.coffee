fs = require('fs')
exports.run_paths = (app) ->
  app.get '/', (req, res) ->
    res.render 'index.jade',
      title: 'Motherfucking Knowledge Gain',
      page: 'Home'
