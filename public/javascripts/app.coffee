# Model Jeu

window.Jeu = Backbone.Model.extend(
  defaults:
    titre:  "LoL"
    visuel: null
    support: "PS3"
    objectif: "Terminé le jeu"
    avancee: 8
    total: 12
    date_debut: "2012/12/02"
    date_fin: null

  initialize: Jeu = ->
    console.log 'Jeu initialisé'

    @url = "/add"
)

# Collection Jeux

window.Jeux = Backbone.Collection.extend(
  model: Jeu
  initialize: ->
    console.log 'Collection de JEUX initialisée'
)



$.fn.reset = ->
  @find(':input')
    .not(':button, :submit, :reset, :hidden')
    .val('')
    .removeAttr('checked')
    .removeAttr('selected')


$(document).ready ->

  $('html').removeClass('no-js').addClass 'js'

  # Formulaire

  add_game = $('.add')
  add_game.hide()

  $('#add-game').click ->
    add_game.slideDown()
  $('.close-form').click ->
    add_game.reset()
    add_game.fadeOut()

  $('.submit-form').click ->

    if add_game.find('input[name="titre"]').val()
      $(@).parents('form').submit()

    off


  # Drag & Drop du visuel

  # dropbox = $(".drag-drop-img")

  # dropbox.bind "dragover", ->
  #   off

  # jQuery.event.props.push("dataTransfer")

  # z = -40
  # maxFiles = 5
  # errMessage = 0
  # dataArray = []

  # dropbox.on "drop", (e) ->
  #   files = e.dataTransfer.files
  #   file = files[0]
  #   img = "/images/jeux/" + file.name

  #   if file.type.match('image.*')

  #     $(@).html '<img src="' + img + '">'
  #     $(@).css "height", "auto"

  #   off
