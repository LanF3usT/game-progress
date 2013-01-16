# Dépendances

mongoose = require('mongoose')
Jeux     = mongoose.model('Jeux')


# GET

exports.index = (req, res) ->
  Jeux.find (err, jeux, count) ->
    res.render 'index',
      title: "Mes jeux"
      jeux: jeux


# POST

exports.create = (req, res) ->
  jeu = new Jeux
    titre : req.body.titre
    support: req.body.support

  jeu.save (err, jeu, count) ->
    res.redirect('/')


# DELETE

exports.destroy = (req, res) ->
  Jeux.findById req.params.id, (err, jeu) ->
    jeu.remove (err, jeu) ->
      res.redirect('/')
