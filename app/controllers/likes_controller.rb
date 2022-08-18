class LikesController < ApplicationController
  def new
    @like=Like.new
  end

  def create
    @like=Like.new
    @like.author_id=self.current_user.id
    @like.post_id=params[:post_id]
    if @like.save
        redirect_to user_posts_path(:author_id)
    end
  end

end