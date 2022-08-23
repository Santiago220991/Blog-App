require 'rails_helper'

RSpec.describe 'Users index', type: :feature do
describe 'index page' do
user1=User.create(name: 'user3', photo: 'https://www.test.com/user3.png', bio: 'teacher3', posts_counter: 0)
post1 = Post.create(title: 'Sample Title', text: 'a' , comments_counter: 0, likes_counter: 0,
    author: user1)
post2 = Post.create(title: 'Sample Title', text: 'a' , comments_counter: 0, likes_counter: 0,
    author: user1)
post3 = Post.create(title: 'Sample Title', text: 'a' , comments_counter: 0, likes_counter: 0,
    author: user1)
post4 = Post.create(title: 'Sample Title', text: 'a' , comments_counter: 0, likes_counter: 0,
        author: user1)
it "See User's name" do 
    visit user_path(id: user1.id)
    expect(page).to have_content('user3')
end
it "See User's image profile" do
    visit user_path(id: user1.id)
    images = page.find('img')
    expect(page).to have_xpath("//img[contains(@src,'https://www.test.com/user3.png')]")
end
it "See Number of post the user hast written" do
    visit user_path(id: user1.id)
    info=page.find('div', id:user1.name)
    expect(info).to have_content("Number of posts")
end
it "See the users bio" do
    visit user_path(id: user1.id)
    expect(page).to have_content("Bio")
end

it "See the user's first 3 posts" do
    visit user_path(id: user1.id)
    posts=page.find_all('div', class: "post_info")
    expect(posts.length).to eq(3)
end

it "See button that redirects to user's post" do
    visit user_path(id: user1.id)
    expect(page).to have_content("See all Posts")
end

it "click a user's post, it redirects me to that post's show page" do
    visit user_path(id: user1.id)
    post=find_link(href: "/users/#{user1.id}/posts/#{post4.id}")
    post.click
    expect(page).to have_current_path(user_post_path(user_id: user1.id, id: post4.id))
end

it  "Click to see all posts redirects to the user's post's index page" do
    visit user_path(id: user1.id)
    button=page.find_link('See all Posts')
    button.click
    expect(page).to have_current_path(user_posts_path(user_id: user1.id))
end
end
end