// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults
$("*[data-spinner]").live('ajax:beforeSend', function(e){
  $($(this).data('spinner')).show();
  e.stopPropagation(); //Don't show spinner of parent elements.
});
$("*[data-spinner]").live('ajax:complete', function(){
  $($(this).data('spinner')).hide();
});