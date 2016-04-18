# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', () ->
  $("#new_comment").on("ajax:success", (e, data, status, xhr) ->
    Turbolinks.visit data.url
  ).on "ajax:error", (e, data, status, xhr) ->
    template = Handlebars.compile $('#new-comment-error').html()
    $("#new-comment-errors ul").html ""
    $.each data.responseJSON.message, (index, value) ->
      $("#new-comment-errors ul").append template { 'message': value }
    $("#new-comment-errors").removeClass("hide")
    grecaptcha.reset()
