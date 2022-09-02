class UsersController < ApplicationController
  def index
    @users = User.all.order(:id)
  end

  def show
    @user = User.find(params[:id])
    @user_posts = @user.last_posts
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    redirect_to user_path(params[:id]) if @user.update(bio: params[:user][:bio], photo: params[:user][:photo])
  end
end
