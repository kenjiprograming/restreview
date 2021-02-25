jQuery(document).on('turbolinks:load', function() {
  var error1 = false;
  $('#form_controll').blur(function() {
    if ($(this).val() == '') {
      $(this).css('background-color', '#FEF4F8');	
      error1 = true;
    } else {
      $(this).css('background-color', '#FaFEFF');
      error1 = false;
    };
  });
  $('#search_btn').click(function() {
    if (error1 == true) {
      alert('最低1文字以上入力してください');
      return false;
    };
  });
});

// $(function (){
//   $("input#form_controll").hide();
// });

// $(function () {
//   //バリデーション
//   $("input#form_controll").on("blur", function () {
//     let error;
//     let value = $(this).val();
//     if (value == "" || !value.match(/[^\s\t]/)) {
//       error = true;
//     }

//     if (error) {
//       //エラー時の処理
//       alert('必須ですよ');
//     }
//   });
// });

// jQuery(document).on('turbolinks:load', function() {
//   $('#email').hide();
//   $('#search_btn').click(function () {
//     $('#email').toggle();
//   });
// });