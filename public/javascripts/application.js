// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
    $('#spinner')
        .hide() // hide initially
        .ajaxStart(function(){
            $(this).show();
        })
        .ajaxStop(function(){
            $(this).hide();
        })
});
