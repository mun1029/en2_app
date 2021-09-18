class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :destroy, :edit, :update]
  before_action :set_category_list, only: [:index, :new,:show, :edit, :update, :select_category_index, :keyword_search]
  before_action :set_post, only: [:edit, :update, :destroy, :show]
  before_action :set_user, only: [:index, :select_category_index, :keyword_search]
  before_action :set_category_select, only:[:edit, :update]
  before_action :move_to_index, only: [:edit, :update, :destory]

  def index
    @posts = Post.all.order("created_at DESC").includes(:user).page(params[:page]).per(10)
    @favorite_posts = Post.includes(:favorite_users).sort {|a,b| b.favorite_users.size <=> a.favorite_users.size}.first(10)
  end

  def new
    @post = Post.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

  def show
    @favorite = Favorite.new
    
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find_by(id: "#{params[:children_id]}").children
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path
    else
      render :index
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to root_path
    else
      @post = Post.find(params[:id])
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to user_path(current_user.id)
  end
  
  def select_category_index
    @category = Category.find_by(id: params[:id])
    if @category.ancestry == nil
      category = Category.find_by(id: params[:id]).indirect_ids
      @posts = []
      find_post(category)
      @message = "『 #{@category.name} 』の検索結果 : #{@posts.length}件"
    elsif @category.ancestry.include?("/")
      @posts = Post.where(category_id: params[:id])
      @message = "『 #{@category.root.name} 』 > 『 #{@category.parent.name} 』 > 『 #{@category.name} 』の検索結果 : #{@posts.length}件"
    else
      category = Category.find_by(id: params[:id]).child_ids
      @posts = []
      find_post(category)
      @message = "『 #{@category.root.name} 』 > 『 #{@category.name} 』の検索結果 : #{@posts.length}件"
    end
    @posts = sort_post(@posts)
    @posts = Kaminari.paginate_array(@posts).page(params[:page])
    render :index
  end

  def keyword_search
    @posts = Post.search_keyword(params[:keyword])
    @posts = sort_post(@posts)
    @message = "『 #{params[:keyword]} 』の検索結果 : #{@posts.length}件"
    @posts = Kaminari.paginate_array(@posts).page(params[:page])
    render :index
  end

  private
  def set_user
    if user_signed_in?
      @user = User.find(current_user.id)
    else
      @user = User.new
    end
  end

  def set_post
    @post = Post.find(params[:id])
  end

  def set_category_select
    grandchild_category = @post.category
    child_category = grandchild_category.parent

    @category_parent_array = []
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end

    @category_children_array = []
    Category.where(ancestry: child_category.ancestry).each do |children|
      @category_children_array << children
    end

    @category_grandchildren_array = []
    Category.where(ancestry: grandchild_category.ancestry).each do |grandchildren|
      @category_grandchildren_array << grandchildren
    end
  end

  def move_to_index
    if current_user.id != @post.user.id
      redirect_to action: :index
    end
  end

  def find_post(category)
    category.each do |id|
      post_array = Post.includes(:user).where(category_id: id)
      if post_array.present?
        post_array.each do |post|
          if post.present?
            @posts.push(post)
          else
            
          end
        end
      end
    end
  end

  def post_params
    params.permit(:title, :text).merge(user_id: current_user.id, category_id: params[:grandchildren_id] )
  end

  def sort_post(posts)
    posts.sort_by{|post| post.created_at}.reverse!
  end

  
end

