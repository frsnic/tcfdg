#= require bxslider/jquery.bxslider.min
# require_self

ready = ->
  $('.bxslider').show().bxSlider
    auto: true
    slideWidth: 1010
    autoControls: true
    pause: 2000
  return

$(document).ready(ready)
$(document).on('page:load', ready)
