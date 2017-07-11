'use strict';

function check(){
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
// window.onload = function () {
//   var = form = document.forms;
//   switch (form) {
//     case form.name =="": alert("件名が未入力です!");
//       break;
//     case form.title =="": alert("用件が未入力です!");
//       break;
//     case form.body =="": alert("あなた何しているのですか???");
//       break;
//     case form =="": alert("全部入力されていません!");
//   };
// };
