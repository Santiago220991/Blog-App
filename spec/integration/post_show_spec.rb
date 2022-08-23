require 'rails_helper'

RSpec.describe 'Post show', type: :feature do
  describe 'show page' do
    user1 = User.create(name: 'user5', photo: 'https://www.test.com/user5.png', bio: 'teacher5', posts_counter: 0)
    post1 = Post.create(title: 'Sample Title', text: 'a', comments_counter: 0, likes_counter: 0,
                        author: user1)
    Post.create(title: 'Sample Title', text: 'a', comments_counter: 0, likes_counter: 0,
                author: user1)
    Post.create(title: 'Sample Title', text: 'a', comments_counter: 0, likes_counter: 0,
                author: user1)
    Post.create(title: 'Sample Title', text: 'a', comments_counter: 0, likes_counter: 0,
                author: user1)
    comment1 = Comment.create(post: post1, author: user1, text: 'Hi Tom first!')
    comment2 = Comment.create(post: post1, author: user1, text: 'Hi Tom second')
    comment3 = Comment.create(post: post1, author: user1, text: 'Hi Tom third')
    Like.create(post: post1, author: user1)
    Like.create(post: post1, author: user1)

    it 'I can see who wrote the post.' do
      visit user_post_path(user_id: user1.id, id: post1.id)
      expect(page).to have_content("by #{user1.name}")
    end
    it 'See how many comments it has.' do
      visit user_post_path(user_id: user1.id, id: post1.id)
      post_info = page.find('.post_full_info')
      expect(post_info).to have_content('Comments: 3')
    end

    it 'See how many likes it has' do
      visit user_post_path(user_id: user1.id, id: post1.id)
      post_info = page.find('.post_full_info')
      expect(post_info).to have_content('Likes: 2')
    end

    it 'See all the post body' do
      visit user_post_path(user_id: user1.id, id: post1.id)
      post = page.find('.post_full_info')
      expect(post).to have_content(post1.text)
    end
    it 'See the username of each commentor.' do
      visit user_post_path(user_id: user1.id, id: post1.id)
      comment_container = find_all('.comments_container').first
      expect(comment_container).to have_content(comment1.author.name)
      expect(comment_container).to have_content(comment2.author.name)
      expect(comment_container).to have_content(comment3.author.name)
    end
    it 'See the comment each commentor left' do
      visit user_post_path(user_id: user1.id, id: post1.id)
      comment_container = find_all('.comments_container').first
      expect(comment_container).to have_content(comment1.text)
      expect(comment_container).to have_content(comment2.text)
      expect(comment_container).to have_content(comment3.text)
    end
  end
end
