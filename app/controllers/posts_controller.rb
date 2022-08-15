class PostsController < ActionController::Base
    def index
        @user=User.find(params[:user_id])
        @user_posts=Post.where(author_id: params[:user_id])
        @comments=Comment.all
    end

    def show
        @post=Post.find(params[:id])
        @post_num=Post.where(author_id: @post.author_id).index{|post| post.id==params[:id].to_i}
        @comments=Comment.where(post_id: params[:id])
        @user=User.find(@post.author_id)
    end
end
