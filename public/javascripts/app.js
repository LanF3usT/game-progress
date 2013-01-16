(function() {
  var Jeu;

  window.Jeu = Backbone.Model.extend({
    defaults: {
      titre: "LoL",
      visuel: null,
      support: "PS3",
      objectif: "Terminé le jeu",
      avancee: 8,
      total: 12,
      date_debut: "2012/12/02",
      date_fin: null
    },
    initialize: Jeu = function() {
      console.log('Jeu initialisé');
      return this.url = "/add";
    }
  });

  window.Jeux = Backbone.Collection.extend({
    model: Jeu,
    initialize: function() {
      return console.log('Collection de JEUX initialisée');
    }
  });

  $.fn.reset = function() {
    return this.find(':input').not(':button, :submit, :reset, :hidden').val('').removeAttr('checked').removeAttr('selected');
  };

  $(document).ready(function() {
    var add_game;
    $('html').removeClass('no-js').addClass('js');
    add_game = $('.add');
    add_game.hide();
    $('#add-game').click(function() {
      return add_game.slideDown();
    });
    $('.close-form').click(function() {
      add_game.reset();
      return add_game.fadeOut();
    });
    return $('.submit-form').click(function() {
      if (add_game.find('input[name="titre"]').val()) {
        $(this).parents('form').submit();
      }
      return false;
    });
  });

}).call(this);
