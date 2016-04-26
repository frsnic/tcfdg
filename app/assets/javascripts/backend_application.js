//= require_directory ./backend
//= require ckeditor/init
//= require jquery.blockUI/jquery.blockUI.min.js

$(document).on('ready page:load', function() {

  $("#sidebar_nav li.active").parent().parent().addClass('open');

});
