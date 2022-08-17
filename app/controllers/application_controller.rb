class ApplicationController < ActionController::Base
    def current_user
        @curent_user=User.first
        @current_user
    end
end
