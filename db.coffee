mongoose = require('mongoose')
Schema   = mongoose.Schema

Jeux = new Schema
  titre      : String   # Titre
  visuel     : String   # Image du jeu
  support    : String   # PS3, Wii, PC, etc…
  objectif   : String   # Objectif du jeu (terminé le jeu, 100%, être niveau 80, etc…)
  avancee    : Number   # Avancée du jeu (en segments)
  total      : Number   # Total de segments du jeu
  date_debut : Date     # Date de début du jeu
  date_fin   : Date     # Date de fin
  created_at :
    type : Date
    default : Date.now

mongoose.model('Jeux', Jeux)

mongoose.connect('mongodb://localhost/my_games')
