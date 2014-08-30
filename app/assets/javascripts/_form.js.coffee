ready = ->
  $('.order_slip_table_number').hide();
  $('.order_slip_takeout_number').hide();
  $('.order_slip_takeout_type').hide();

  $('.order_slip_order_type input:radio').change ->
    type = $(".order_slip_order_type input:radio:checked").val();
    if (type == "Dine-In")
      $('.order_slip_table_number').show();
      $('.order_slip_takeout_number').hide();
      $('.order_slip_takeout_type').hide();

    else if (type == "Takeout")
      $('.order_slip_takeout_number').show();
      $('.order_slip_takeout_type').show();
      $('.order_slip_table_number').hide();
    else
      $('.order_slip_table_number').hide();
      $('.order_slip_takeout_number').hide();
      $('.order_slip_takeout_type').hide();

      

$(document).ready(ready)
$(document).on('page:load', ready)
