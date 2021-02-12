$(function () {
  var error1 = false;

  $("input.user_search").blur(function() {
    if ($(this).val() == "") {
      $(this).css("background-color", "#FEF4F8");	
      error1 = true;
    } else {
      $(this).css("background-color", "#FaFEFF");
      error1 = false;
    }
  })

  $("form").submit(function() {
    if (error1 == true) {
      alert("最低1文字以上入力してください");
      return false;
    }
  });
});