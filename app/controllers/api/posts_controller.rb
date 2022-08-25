class Api::PostsController < ApplicationController
    def index
        @user_posts = Post.where(author_id: params[:user_id]).order(created_at: :asc)
        render json: @user_posts 
    end
end