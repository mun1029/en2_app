class UsersController < ApplicationController
  before_action :authenticate_user!, only: :show
  before_action :set_category_list, only: :show
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order("created_at DESC").page(params[:page]).per(10)
  end
end
