class UsersController < ActionController::Base
    def index
        @users=User.all
    end

    def show
        @user=User.find(params[:id])
        @user_posts=Post.where(author_id: params[:id])
    end
end
