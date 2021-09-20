//フォームを入力・選択するまで送信ボタンを無効化

$(document).on('turbolinks:load', function() {
  //初期時、送信ボタンを無効化（注）ボタンのクラスにsendingを持たせておく事）
  $('#sending').prop("disabled", true);

  //inputを前方一致するidを持つ要素の入力欄の操作時
  $("[id^= input]").change(function () {
      //入力欄が空かどうか判定を定義するために、sendという変数を使ってフォームの中身の状態管理を行う。
      let send = true;
      //id=input~と指定している入力欄をひとつずつチェックする
      $("[id^= input]").each(function(index) {
        //フォームの値を順番に確認し、もしフォームの値が空の時はsend = false
        if ($("[id^= input]").eq(index).val() === "") {
          send = false;
        }
      });
      //フォームが全て埋まっていたら(send = trueの場合)
      if (send) {
          //送信ボタンを有効化
          $('#sending').prop("disabled", false);
      }
      // フォームが一つでも空だったら(send = falseの場合)
      else {
          //送信ボタンを無効化
          $('#sending').prop("disabled", true);
      }
  });
});