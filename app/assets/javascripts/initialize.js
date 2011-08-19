$(function() {
  $('.date-field').datepicker({dateFormat: 'dd/mm/yy'});
});

var changeTime = function(field) {
  if($('.'+field+'_time')[0].value.trim() == '') {
    $('.'+field+'_hidden')[0].value = '';
    $($('.'+field+'_time')[0]).removeClass('error');
  }
  else {
    var time = new RegExp('^\\d{1,2}:\\d{2}$');
    if($('.'+field+'_time')[0].value.match(time)) {
      $('.'+field+'_hidden')[0].value =
        $('.'+field+'_time')[0].value + ' ' +
        $('.'+field+'_meridiem')[0].value;
      $($('.'+field+'_time')[0]).removeClass('error');
    }
    else {
      $($('.'+field+'_time')[0]).addClass('error');
    }
  }
};
