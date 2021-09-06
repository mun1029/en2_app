$(function() {
  $(".cate-select").change(function(){
    var l = $('option:selected').val();
    console.log(l);

    switch (l){
      case '2':
        console.log('住所は');
         $(".post-cate").append('<%= f.collection_select(:l_cate_id, L_cate.all, :id, :name, {}, {class:"cate-select"}) %>');
         break;
      default:
        console.log('住所はその他です');
    }
    
  });
});