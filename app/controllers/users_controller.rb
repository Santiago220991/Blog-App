class UsersController < ApplicationController
  def index
    @users = User.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.last_posts
  end
end
