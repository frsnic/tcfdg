//= require_directory ./backend
//= require ckeditor-jquery

$(document).on('ready page:load', function() {

  $("#sidebar_nav li.active").parent().parent().addClass('open');

});
