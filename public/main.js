'use strict';

function check() {
  var flag = 0;
  if (document.form.name.value == ""){
    flag = 1;
  }else if
    (document.form.title.value == ""){
      flag = 1;
  }else if
    (document.form.body.value == ""){
      flag = 1;
  };

  if (flag){
    window.alert('必須項目に未入力がありました');
      return false;
  }else{
    return true;
  };
}

// 本当はこっちの文を使いたい
// function check() {
//   var form = document.form
//   var flag = false;
//   switch (form) {
//     case form.name.value == "": flag = !flag;
//     alert("件名が未入力です!");
//       break;
//     case form.title.value == "": flag = !flag;
//     alert("用件が未入力です!");
//       break;
//     case form.body.value == "": flag = !flag;
//     alert("あなた何しているのですか???");
//       break;
//     default form.value == "": flag = !flag;
//     alert("全部入力されていません!");
//   };
// }
