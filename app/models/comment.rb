class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :c_counter

  def c_counter
    id = post_id
    post = Post.find(id)
    post.update(comments_counter: Comment.where(post_id: id).count)
  end
end
