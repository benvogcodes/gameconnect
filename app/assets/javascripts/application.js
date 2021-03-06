// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(document).ready(function(){
  $('.show_add_form').on('click', function(event){
    $('.add_game').show();
    $('.show_add_form').hide();
  });

  $('.add_game').on('submit',function(event){
    event.preventDefault();

    var request = $.ajax({
      url: '/games',
      type: 'POST',
      data: $('.add_game').serialize()
    });

    request.done(function(data){
      $('.show_add_form').show();
      $('.add_game').hide();
      $('.all_games').html(data);
    });

    var request2 = $.get('/games');

    request2.done(function(data){
      $('.add_game').html(data);
    });
  })

});
