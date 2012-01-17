// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$(function() {
    $('#spinner')
        .hide() // hide initially
        .ajaxSubmit(function(){
            $(this).show();
        })
        .ajaxComplete(function(){
            $(this).hide();
        })
});



