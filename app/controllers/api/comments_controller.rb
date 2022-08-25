class Api::CommentsController < ApplicationController
  before_action :authorize_request

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end

  # def create
  #   @post = Post.find(params[:post_id])
  #   @user = @post.author_id
  #   @comment = Comment.new(comment_params)
  #   @comment.author_id = @user.id
  #   @comment.post_id = params[:post_id]
  #   render json: @comments if @comment.save
  # end

  # def comment_params
  #   params.permit(:text)
  # end
end
