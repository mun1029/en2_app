$(function() {

  function deleteChild(){
    $(".child_li").remove();
    $(".child_category").remove();
  }

  function deleteGrandChild(){
    $(".grand_child_li").remove();
    $(".grand_child_category").remove();
  }

  $(".cate-title").on("mouseenter", function() {
    $(this).attr({"style": "color: blue;"});
    $(".parents_list").attr({"style": "display:block;"});
  });
  $(".category_list").on("mouseleave", function() {
    $(".now-selected-parent").removeClass("now-selected-parent")
    $(".cate-title").attr({"style": "color: black;"});
    $(".parents_list").attr({"style": "display:none;"});
    $(".children_list").attr({"style": "display:none;"});
    $(".grand_children_list").attr({"style": "display:none;"});
    deleteChild();
    deleteGrandChild();
  });
  // 子カテゴリーを追加するための処理です。
  function buildChildHTML(child){
    var html =`<li class="child_li"><a class="child_category" id="${child.id}" 
                href="/posts/${child.id}/select_category_index">${child.name}</a></li>`;
    return html;
  }

  $(".parent_category").on("mouseenter", function() {
    console.log(this.id);
    var id = this.id//どのリンクにマウスが乗ってるのか取得します
    $(".now-selected-parent").removeClass("now-selected-parent")//赤色のcssのためです
    $('#' + id).addClass("now-selected-parent");//赤色のcssのためです
    deleteChild();
    deleteGrandChild();
    $(".grand_children_list").attr({"style": "display:none;"});
    $.ajax({
      type: 'GET',
      url: '/categories/new',//とりあえずここでは、newアクションに飛ばしてます
      data: {parent_id: id},//どの親の要素かを送ります　params[:parent_id]で送られる
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {//帰ってきた子カテゴリー（配列）
        var html = buildChildHTML(child);//HTMLにして
        $(".children_list").append(html);//リストに追加します
      })
      $(".children_list").attr({"style": "display:block;"});
    });
  });

  // 孫カテゴリを追加する処理です　基本的に子要素と同じです！
  function buildGrandChildHTML(child){
    var html =`<li class="grand_child_li"><a class="grand_child_category" id="${child.id}"
              href="/posts/${child.id}/select_category_index">${child.name}</a></li>`;
    return html;
  }

  $(document).on("mouseenter", ".child_category", function () {//子カテゴリーのリストは動的に追加されたHTMLのため
    var id = this.id
    $(".now-selected-child").removeClass("now-selected-child");
    $('#' + id).addClass("now-selected-child");
    $.ajax({
      type: 'GET',
      url: '/categories/new',
      data: {parent_id: id},
      dataType: 'json'
    }).done(function(children) {
      children.forEach(function (child) {
        var html = buildGrandChildHTML(child);
        $(".grand_children_list").append(html);
      })
      $(".grand_children_list").attr({"style": "display:block;"});
    });
    $(document).on("mouseenter", ".child_category", function () {
      deleteGrandChild();
    });
  }); 

  $(document).on("mouseenter", ".grand_child_category", function () {
    var id = this.id
    $(".now-selected-grand-child").removeClass("now-selected-grand-child");
    $('#' + id).addClass("now-selected-grand-child");
  }); 
});