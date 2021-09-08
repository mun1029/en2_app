class PostsController < ApplicationController

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
end
