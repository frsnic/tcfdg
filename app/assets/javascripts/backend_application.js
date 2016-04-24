//= require_directory ./backend
//= require ckeditor/init

$(document).on('ready page:load', function() {

  $("#sidebar_nav li.active").parent().parent().addClass('open');

});
