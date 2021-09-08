$(function() {
  $(document).on('change', '#l-cate', function(){
    var l = $("option:selected").val();
    console.log(l)
  

    $.ajax({
      url: '/posts/new',  
      type: 'GET',
      dataType: 'json',
      data: {
         waka: l
      },
    });
  });
  
});


