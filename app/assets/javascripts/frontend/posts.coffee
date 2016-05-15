# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', () ->
  $("#new_comment_submit").click ->
    $("#new_comment_submit").attr("disabled", true)
    $.ajax
      url: $("#new_comment").attr("action"),
      type: "POST",
      data: $("#new_comment").serialize(),
      dataType: "json",
      success: (result) ->
        Turbolinks.visit result.url
      error: (result) ->
        template = Handlebars.compile $('#new-comment-error').html()
        $("#new-comment-errors ul").html ""
        $.each result.responseJSON.message, (index, value) ->
          $("#new-comment-errors ul").append template { 'message': value }
        $("#new-comment-errors").removeClass("hide")
        $("#new_comment_submit").attr("disabled", false)
        grecaptcha.reset()
