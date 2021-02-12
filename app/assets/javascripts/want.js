jQuery(document).on('turbolinks:load', function() {
  $('#list_form').hide();
  $('.list_btn').click(function () {
      $('#list_form').toggle();
  });
});
