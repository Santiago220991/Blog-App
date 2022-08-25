class Api::CommentsController < ApplicationController
  before_action :authorize_request

  def index
    @post = Post.find(params[:post_id])
    @comments = @post.comments
    render json: @comments
  end

  def create
    @post = Post.find(params[:post_id])
    @user = @post.author_id
    @comment = Comment.new(comment_params)
    @comment.author_id = @post.author_id
    @comment.post_id = params[:post_id]
    if @comment.save
      render json: @comment, status: :created
    else
      render json: { errors: @comment.errors.full_messages },
             status: :unprocessable_entity
    end
  end

  def comment_params
    params.permit(:text)
  end
end
