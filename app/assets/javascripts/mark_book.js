$(document).ready(function(){
  $('#status_form').submit(function(e){
    e.preventDefault();
    var url = $(this).attr('action');
    var method = $(this).attr('method');
    var data = $(this).serializeArray();
    $.ajax({
      url: url,
      method: method,
      data: data,
      dataType: 'json',
      success: function() {
        if($('#status').attr('value') == 'read') {
          $('#status').val('unread');
          $('#btn_status').val('Unread');
          $('#btn_status').removeClass('btn-success');
          $('#btn_status').addClass('btn-default');
        } else if($('#status').attr('value') == 'unread') {
          $('#status').val('reading');
          $('#btn_status').val('Reading');
          $('#btn_status').removeClass('btn-default');
          $('#btn_status').addClass('btn-primary');
        } else if($('#status').attr('value') == 'reading') {
          $('#status').val('read');
          $('#btn_status').val('Read');
          $('#btn_status').removeClass('btn-primary');
          $('#btn_status').addClass('btn-success');
        }
      }
    });
  });
});
