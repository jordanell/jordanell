$(document).ready ->
  $('.hero-container i').click ->
    hero = $(".hero-container")
    $('html, body').animate({
      scrollTop: hero.offset().top + hero.outerHeight()
    }, 1200)
