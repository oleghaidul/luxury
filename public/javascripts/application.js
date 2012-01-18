// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
    $('#spinner')
        .hide() // hide initially
        .ajaxSend(function(){
            $(this).show();
        })
        .ajaxComplete(function(){
            $(this).hide();
        })
});

$(document).ready(function() {
  $('#load_item').click(function(e) {
    var url = $(this).attr('href');
    var dialog_form = $('<div id="dialog-form">Loading form...</div>').dialog({
      autoOpen: false,
      width: 1220,
      height: 600,
      modal: true,
      open: function() {
        return $(this).load(url + ' #content');
      },
      close: function() {
        $('#dialog-form').remove();
      }
    });
    dialog_form.dialog('open');
    e.preventDefault();
  });
});


