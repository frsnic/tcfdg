#= require_directory ./backend
#= require ckeditor/init
#= require jquery.blockUI/jquery.blockUI.min
#= require jquery.noty/jquery.noty.packaged.min

window.msg = (text, delay = null) ->
  noty( { text: text, layout:'bottomRight', type:'success', timeout: 3000 } );

window.error_msg = (text, delay = null) ->
  noty( { text: text, layout:'bottomRight', type: 'error', timeout: false } );

window.info_msg = (text, delay = null) ->
  noty( { text: text, layout:'bottomRight', type: 'information', timeout: 3000 } );

window.warning_msg = (text, delay = null) ->
  noty( { text: text, layout:'bottomRight', type: 'warning', timeout: false } );

$(document).on 'ready page:load', ->
