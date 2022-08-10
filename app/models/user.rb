class User < ApplicationRecord
  has_many :likes 
  has_many :comments
  has_many :posts
  validates :name, presence: true, allow_blank: false
  validates :posts_counter, comparision: {greater_than_or_equal_to: 0}, numericality: { only_integer: true }
  def last_posts(id)
    Post.where(author: id).order(created_at: :desc).limit(3)
  end
end
