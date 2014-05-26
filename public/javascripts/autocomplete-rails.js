/*
* Unobtrusive autocomplete
*
* To use it, you just have to include the HTML attribute autocomplete
* with the autocomplete URL as the value
*
*   Example:
*       <input type="text" autocomplete="/url/to/autocomplete">
* 
* Optionally, you can use a jQuery selector to specify a field that can
* be updated with the element id whenever you find a matching value
*
*   Example:
*       <input type="text" autocomplete="/url/to/autocomplete" id_element="#id_field">
*/

$(document).ready(function(){
  $('input[autocomplete]').each(function(i){
    $(this).autocomplete({
      source: $(this).attr('autocomplete'),
      select: function(event, ui) {
        if(bad_ids.length) {
            if(bad_ids.indexOf(parseInt(ui.item.id)) > -1) {
                alert('Alert! This Account is On Credit Hold!');
            }
        }
        if($(this).attr('id_element')) {
          $($(this).attr('id_element')).val(ui.item.id);
        }
		$(this).val(ui.item.value)
        return false;
      }
    });
  });
});