class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]
    redirect_to user_posts_path(:author_id) if @like.save
  end
end
