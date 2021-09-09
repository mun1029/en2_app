window.addEventListener('DOMContentLoaded', function(){
  $('#post-text-area').on('input', function() {
    var content = $('#post-text-area').val();
    console.log(content);

    $.ajax({
      url: 'preview_posts',
      dataType: 'json',
      type: 'GET',
      data: { body: content }
    })

    .done(function(html) {
      // ajax成功したら、テキストエリアを非表示にする。
      $('post-preview').append(html.body);
      // markdownボタンとpreviewボタンのdisabledを入れ替える。
    })
  });
});
