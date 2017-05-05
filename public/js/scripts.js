$(document).ready(function() {

  $('.skip').click(function() {
    $('#overlay').fadeIn();
  });

  $('.ok-thanks span').click(function() {
    $('#overlay').fadeOut();
  });

});
