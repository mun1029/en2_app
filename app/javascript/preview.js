window.addEventListener('DOMContentLoaded', function(){
  $('#post-text-area').on('keyup', function() {
    var text = $('#post-text-area').val();
    console.log(text);
    $.ajax({
      url: '/api/posts/preview',
      dataType: 'json',
      type: 'GET',
      data: { body: text }
    })

    .done(function(html) {   
      $('#post-text-preview').empty();
      $('#post-text-preview').append(html.body);
    })
  });
});
