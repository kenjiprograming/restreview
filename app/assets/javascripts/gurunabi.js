$(function () {
  var error1 = false;
  var error2 = false;

  $("input.rest_name").blur(function() {
    if ($(this).val() == "") {
      $(this).css("background-color", "#FEF4F8");	
      error1 = true;
    } else {
      $(this).css("background-color", "#FaFEFF");
      error1 = false;
    }
  })
  $("input.rest_freeword").blur(function() {
    if ($(this).val() == "") {
      $(this).css("background-color", "#FEF4F8");	
      error2 = true;
    }else {
      $(this).css("background-color", "#FaFEFF");
      error2 = false;
    }
  })

  $("form").submit(function() {
    if (error1 == true || error2 == true) {
      alert("入力エラーがあります");
      return false;
    }
  });
});
