class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]
    redirect_back(fallback_location: root_path) if @like.save
  end
end
