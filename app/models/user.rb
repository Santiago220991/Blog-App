class User < ApplicationRecord
    has_many :likes
    has_many :comments
    has_many :posts

    def last_posts(id)
        Post.where(author: id).order(created_at: :desc).limit(3)
    end
end