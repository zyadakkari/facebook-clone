class UsersController < ApplicationController
  def show
      @user = User.find(params[:id])
      @post = Post.new
  end

  def index
      @posts = current_user.posts.order(created_at: :desc)
  end
end
