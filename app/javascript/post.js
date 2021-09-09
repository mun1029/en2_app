$(function(){

  function appendOption(category){
    var html = `<option value="${category.name}" datacategory="${category.id}">${category.name}</option>`;
    return html;
  }

  function appendChildrenBox(insertHTML){
    var childSelectHtml = '';
    childSelectHtml = `<div class='listing-select-wrapper__added' id= 'children_wrapper'>
                        <div class='listing-select-wrapper__box'>
                          <select class="listing-select-wrapper__box--select" id="child_category" name="category_id">
                            <option value="---" data-category="---">---</option>
                            ${insertHTML}
                          <select>
                        </div>
                      </div>`;
    $('.listing-product-detail__category').append(childSelectHtml);
  }

　//孫カテゴリーのビュー作成
  function appendGrandchildrenBox(insertHTML){
    var grandchildSelectHtml = '';
    grandchildSelectHtml = `<div class='listing-select-wrapper__added' id= 'grandchildren_wrapper'>
                              <div class='listing-select-wrapper__box'>
                                <select class="listing-select-wrapper__box--select" id="grandchild_category" name="category_id">
                                  <option value="---" data-category="---">---</option>
                                  ${insertHTML}
                                </select>
                              </div>
                            </div>`;
    $('.listing-product-detail__category').append(grandchildSelectHtml);
  }

  //親カテゴリーが選択された時の処理（子カテゴリーの表示）
  $("#parent_category").on('change', function(){
    //選択された親カテゴリーの値を取得
    var parentCategory = document.getElementById('parent_category').value;
    console.log(parentCategory)
    //選択された親カテゴリーが"---"（初期設定）のままだとfalse、変わっているとtrue
    if (parentCategory != "---"){
      $.ajax({
        url: 'get_category_children',
        type: 'GET',
        //コントローラーに飛ばす値です。
        data: { parent_name: parentCategory },
        dataType: 'json'
      })
      .done(function(children){
        //まず、既に表示されている子、孫カテゴリーを削除
        $('#children_wrapper').remove();
        $('#grandchildren_wrapper').remove();
        //insertHTMLという変数にカテゴリーのセレクトボックスの選択肢を入れる。（一番最初の段落で設けた変数）
        var insertHTML = '';
        children.forEach(function(child){
          insertHTML += appendOption(child);
        });
        //2段落目で設定した子カテゴリーのビューの呼び出し
        appendChildrenBox(insertHTML);
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#children_wrapper').remove();
      $('#grandchildren_wrapper').remove();
    }
  });

  //子カテゴリーが選択された時の処理（孫カテゴリーの表示）
  $('.listing-product-detail__category').on('change', '#child_category', function(){
    var childId = document.getElementById('child_category').value; 
    console.log(childId)
    // $('#child_category option:selected').data('category');
    if (childId != "---"){
      $.ajax({
        url: 'get_category_grandchildren',
        type: 'GET',
        data: { child_name: childId },
        dataType: 'json'
      })
      .done(function(grandchildren){
        if(grandchildren.length != 0) {
          $('#grandchildren_wrapper').remove();
          $('#size_wrapper').remove();
          $('#brand_wrapper').remove();
          var insertHTML = '';
          grandchildren.forEach(function(grandchild){
            insertHTML += appendOption(grandchild);
          });
          appendGrandchildrenBox(insertHTML);
        }
      })
      .fail(function(){
        alert('カテゴリー取得に失敗しました');
      })
    }else{
      $('#grandchildren_wrapper').remove();
      $('#size_wrapper').remove();
      $('#brand_wrapper').remove();
    }
  });
});


