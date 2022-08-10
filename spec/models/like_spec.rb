require 'rails_helper'

RSpec.describe Like, type: :model do
  context 'Testing Like Methods' do
    user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.',
                       posts_counter: 0)
    post = Post.create(author: User.first, title: 'Hello', text: 'This is my first post', comments_counter: 0,
                       likes_counter: 0)
    like = Like.create(post: Post.last, author: User.last)
    like.save

    it 'author_id should be equal to user_id' do
      expect(like.author_id).to eq(user.id)
    end

    it 'post_id should be equal to Post.id' do
      expect(like.post_id).to eq(post.id)
    end
  end
end
