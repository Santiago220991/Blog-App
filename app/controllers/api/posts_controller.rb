class Api::PostsController < ApplicationController
    before_action :authorize_request
    def index
        @user_posts = Post.where(author_id: params[:user_id]).order(created_at: :asc)
        render json: @user_posts 
    end
end