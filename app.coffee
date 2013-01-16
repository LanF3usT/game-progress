# Modules

express   = require('express')
http      = require('http')
path      = require('path')

require('date-utils')

# Création du serveur Express

app = express()

# Mongoose setup

require('./db')

# Configuration du serveur

app.configure ->
  app.set('port', process.env.PORT || 3000)
  app.set('views', __dirname + '/views')
  app.set('view engine', 'ejs')
  app.use(express.favicon())
  app.use(express.logger('dev'))
  app.use(express.bodyParser())
  app.use(app.router)
  app.use(require('stylus').middleware(__dirname + '/public'))
  app.use(express.static(path.join(__dirname, 'public')))

app.configure 'development', ->
  app.use(express.errorHandler({ dumpExceptions : true, showStack : true }))

# Routes

routes = require('./routes')

app.get('/', routes.index)
app.post('/add', routes.create)
app.get('/delete/:id', routes.destroy)

# Démarre le serveur

http.createServer(app).listen app.get('port'), ->
  console.log("Express server listening on port %d in %s mode", app.get('port'), app.settings.env)
