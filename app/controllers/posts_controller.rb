class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @user_posts = Post.where(author_id: params[:user_id]).order(created_at: :asc)
    @comments = Comment.all
  end

  def show
    @post = Post.where(author_id: params[:user_id]).order(created_at: :asc).find(params[:id])
    @comments = Comment.where(post_id: params[:id])
    @user = User.find(@post.author_id)
  end
  
  def new
    @post=Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id=self.current_user.id
    @post.comments_counter=0
    @post.likes_counter=0
    if @post.save
      redirect_to user_posts_path(@post.author_id)
    else
      render :new
    end
  end

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
