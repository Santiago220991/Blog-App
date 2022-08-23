require 'rails_helper'

RSpec.describe 'Users index', type: :feature do
  describe 'index page' do
    User.create(name: 'user1', photo: 'https://www.test.com/user1.png', bio: 'teacher1', posts_counter: 0)
    User.create(name: 'user2', photo: 'https://www.test.com/user2.png', bio: 'teacher2', posts_counter: 0)
    User.create(name: 'user3', photo: 'https://www.test.com/user3.png', bio: 'teacher3', posts_counter: 0)
  end
  it 'See usernames of all users' do
    visit root_path
    expect(page).to have_content('user1')
    expect(page).to have_content('user2')
    expect(page).to have_content('user3')
  end
  it 'See all profile pictures' do
    visit root_path
    images = page.find_all('img')
    expect(images[0]).to have_xpath("//img[contains(@src,'https://www.test.com/user1.png')]")
    expect(images[1]).to have_xpath("//img[contains(@src,'https://www.test.com/user2.png')]")
    expect(images[2]).to have_xpath("//img[contains(@src,'https://www.test.com/user3.png')]")
  end
  it 'See the number of posts each user has written' do
    visit root_path
    user1 = page.find_all('div', id: 'user1').first
    user2 = page.find_all('div', id: 'user2').first
    user3 = page.find_all('div', id: 'user3').first

    expect(user1).to have_content('Number of posts')
    expect(user2).to have_content('Number of posts')
    expect(user3).to have_content('Number of posts')
  end
  it "On user click should redirect to user's page" do
    visit root_path
    user1 = page.find_all('div', id: 'user1').first

    user1.click

    expect(page).to have_content('user1')
  end
end
