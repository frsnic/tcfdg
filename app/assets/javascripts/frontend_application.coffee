#= require bxslider/jquery.bxslider.min
# require_self

$(document).on 'ready page:load', ->
  $('.bxslider').bxSlider
    auto: true
    slideWidth: 1010
    autoControls: true
    pause: 2000
  return
