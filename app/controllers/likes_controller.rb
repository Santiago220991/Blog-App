class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = Like.new
    @like.author_id = current_user.id
    @like.post_id = params[:post_id]
     if @like.save
      redirect_back(fallback_location: root_path)
     end
  end
end
