ready = ->
  $("[data-toggle=tooltip]").tooltip();
  $.fn.datepicker.defaults.format = "yyyy-mm-dd";
  $.fn.datepicker.defaults.autoclose = true;

$(document).ready(ready)
$(document).on('page:load', ready)