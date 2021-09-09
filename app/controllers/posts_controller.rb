class PostsController < ApplicationController
  before_action :set_category_list, only: [:index]

  def index
    @posts = Post.all.order("created_at DESC")
    
  end

  def new
    
  end

  def create
  end

  def edit
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to user_path(current_user.id)
  end

  def select_category_index
    # カテゴリ名を取得するために@categoryにレコードをとってくる
    @category = Category.find_by(id: params[:id])

    # 親カテゴリーを選択していた場合の処理
    if @category.ancestry == nil
      # Categoryモデル内の親カテゴリーに紐づく孫カテゴリーのidを取得
      category = Category.find_by(id: params[:id]).indirect_ids
      # 孫カテゴリーに該当するpostsテーブルのレコードを入れるようの配列を用意
      @posts = []
      # find_itemメソッドで処理
      find_post(category)

    # 孫カテゴリーを選択していた場合の処理
    elsif @category.ancestry.include?("/")
      # Categoryモデル内の親カテゴリーに紐づく孫カテゴリーのidを取得
      @posts = Post.where(category_id: params[:id])

    # 子カテゴリーを選択していた場合の処理
    else
      category = Category.find_by(id: params[:id]).child_ids
      # 孫カテゴリーに該当するitemsテーブルのレコードを入れるようの配列を用意
      @posts = []
      # find_itemメソッドで処理
      find_post(category)
    end
  end

  private

  def find_post(category)
    category.each do |id|
      post_array = Post.includes(:user).where(category_id: id)
      if post_array.present?
        post_array.each do |post|
          if post.present?
          else
            @posts.push(post)
          end
        end
      end
    end
  end
end

