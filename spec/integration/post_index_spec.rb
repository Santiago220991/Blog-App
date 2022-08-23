require 'rails_helper'

RSpec.describe 'Posts index', type: :feature do
  describe 'index page' do
    user1 = User.create(name: 'user4', photo: 'https://www.test.com/user4.png', bio: 'teacher4', posts_counter: 0)
    post1 = Post.create(title: 'Sample Title', text: 'a', comments_counter: 0, likes_counter: 0,
                        author: user1)
    Post.create(title: 'Sample Title', text: 'a', comments_counter: 0, likes_counter: 0,
                author: user1)
    Post.create(title: 'Sample Title', text: 'a', comments_counter: 0, likes_counter: 0,
                author: user1)
    post4=Post.create(title: 'Sample Title', text: 'a', comments_counter: 0, likes_counter: 0,
                author: user1)
    comment1=Comment.create(post: post1, author: user1, text: 'Hi Tom first!')
    Comment.create(post: post1, author: user1, text: 'Hi Tom second')
    Comment.create(post: post1, author: user1, text: 'Hi Tom third')

    it "should have the user's profile picture" do
      visit user_posts_path(user_id: user1.id)
      images = page.find('img')
      expect(images).to have_xpath("//img[contains(@src,'https://www.test.com/user4.png')]")
    end
    it "Should have the user's name" do
      visit user_posts_path(user_id: user1.id)
      expect(page).to have_content(user1.name)
    end
    it 'See the number of posts each user has written' do
      visit user_posts_path(user_id: user1.id)
      user = page.find('.number_posts')
      expect(user).to have_content('Number of posts:')
    end

    it 'See some of the post body' do
      visit user_posts_path(user_id: user1.id)
      post = page.find_all('.post_info').first
      expect(post).to have_content("#{post4.text}...")
    end

    it 'I can see the first comments on a post' do
      visit user_posts_path(user_id: user1.id)
      comment_container = page.find_all('.comments_container').first
      comment = comment_container.find_all('p').last
      expect(comment).to have_content(comment1.text)
    end

    it 'See how many comments a post has.' do
      visit user_posts_path(user_id: user1.id)
      post = page.find_all('.post_info').first
      expect(post).to have_content('Comments:')
    end

    it 'see a section for pagination if there are more posts than fit on the view.' do
      visit user_posts_path(user_id: user1.id)
      expect(page).to have_content('Pagination')
    end

    it 'See how many likes a post has.' do
      visit user_posts_path(user_id: user1.id)
      post = page.find_all('.post_info').first
      expect(post).to have_content('Likes:')
    end

    it "click a user's post, it redirects me to that post's show page" do
      visit user_posts_path(user_id: user1.id)
      post = find_link(href: "/users/#{user1.id}/posts/#{post4.id}")
      post.click
      expect(page).to have_current_path(user_post_path(user_id: user1.id, id: post4.id))
    end
  end
end
