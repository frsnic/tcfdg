# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', ->

  $('.bxslider').bxSlider
    auto: true
    slideWidth: 1010
    autoControls: true
    pause: 2000
    onSliderLoad: ()->
      $("ul.bxslider li").show()
  return
