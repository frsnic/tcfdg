# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on "ready page:load", () ->
  $(".ckeditor").ckeditor

  # category
  $("#category_form").submit (e) ->
    e.preventDefault()
    $("#new_category_btn").attr("disabled", true)
    $.ajax
      url: $("#category_form").attr("action"),
      type: "POST",
      data: $("#category_form").serialize(),
      dataType: "json",
      success: (result) ->
        $("#new-category").modal("hide")
        template = Handlebars.compile $("#new-category-item").html()
        $(".post_categories").prepend template result
        msg("新增成功")
      error: (result) ->
        error_msg("新增失敗")
      complete: ->
        $("#new_category_btn").attr("disabled", false)

  # tag
  tags = $("#post_tag_names").html()
  if typeof tags != "undefined"
    $("#post_tag_names").tagsInput({
      width: "100%",
      defaultText: "逗號分隔",
      onAddTag : (tag) ->
        $("#tag_form input[type=text]").val(tag)
        $.ajax
          url: $("#tag_form").attr("action"),
          type: "POST",
          data: $("#tag_form").serialize(),
          dataType: "json",
          success: (result) ->
            msg("新增成功")
            template = Handlebars.compile $("#new-tag-item").html()
            $(".post_tags").prepend template result
            arr = $("#post_post_meta_attributes_keywords").val().split(/, */).filter (n) -> n != ""
            arr.push(tag)
            $("#post_post_meta_attributes_keywords").val( arr.join(", ") )
          error: (result) ->
            error_msg("新增失敗")
      onRemoveTag: (tag) ->
        tag_id = String tag_hash[tag]
        $("#post_tag_ids_#{tag_id}").prop("checked", false)
    })
    $("#post_tag_names").importTags(tags)

  # preview
  $("#preview_btn").click (e) ->
    $("#preview_btn").attr("disabled", true)
    for instance of CKEDITOR.instances
      CKEDITOR.instances[instance].updateElement()
    $.ajax
      url: "/admin/previews",
      type: "POST",
      data: $("#post_form").serialize().replace(/_method=patch&/g, "_method=post"),
      success: (result) ->
        window.open("/preview/#{result.token}")
      error: (result) ->
        error_msg("預覽失敗")
      complete: ->
        $("#preview_btn").attr("disabled", false)
