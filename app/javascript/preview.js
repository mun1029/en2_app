window.addEventListener('DOMContentLoaded', function(){
  $('#post-text-area').on('keyup ready', function() {
    var text = $('#post-text-area').val();
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

  $('#font-size').on('click', function(){
    markDownOption('**')
  });

  $('#font-Italic').on('click', function(){
    markDownOption('*')
  });
  $('#cancellation-line').on('click', function(){
    markDownOption('~~')
  });
  $('#bulleted-list').on('click', function(){
    markDownOption('* ')
  });
});

function markDownOption(fontValue) {
  var fontSize = fontValue
  let elm = $('#post-text-area')[0];
  var getText = String($("#post-text-area").val());
  var head = getText.slice(0,elm.selectionStart);
  var foot = getText.slice(elm.selectionEnd);
  var text = head + fontSize + foot
  $("#post-text-area").val(text);

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
}
