class CommentsController < ApplicationController
  load_and_authorize_resource
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = @post.author_id
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:post_id]
    if @comment.save
      redirect_to user_post_path(@user, @comment.post_id)
    else
      render :new
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    redirect_to user_post_path(post.author_id, post.id) if Comment.destroy(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:text)
  end
end
