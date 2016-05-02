# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'ready page:load', () ->
  $(".ckeditor").ckeditor

  $("#category_form").submit (e) ->
    e.preventDefault()
    $("#new_category_btn").attr("disabled", true)
    $.ajax
      url: $("#category_form").attr("action"),
      method: "POST",
      data: $("#category_form").serialize(),
      dataType: "json",
      success: (result) ->
        $("#new-category").modal('hide')
        template = Handlebars.compile $('#new-category-item').html()
        $(".post_categories").prepend template result
        $("#new_category_btn").attr("disabled", false)
        msg("新增成功")
      error: (result) ->
        error_msg("新增失敗")
        $("#new_category_btn").attr("disabled", false)
