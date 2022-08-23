require 'rails_helper'

RSpec.describe 'testing posts_controller', type: :request do
  before :each do
    Comment.destroy_all
    Like.destroy_all
    Post.destroy_all
    User.destroy_all
    @user = User.create(name: 'Tom', photo: 'https://unsp', bio: 'Teacher from Mexico.', posts_counter: 0)
    @post = Post.create(author: @user, title: 'Hello', text: 'Post', comments_counter: 0, likes_counter: 0)
    @post.save
  end
  context ' testing posts#index' do
    it 'return a http status 200' do
      get "/users/#{@user.id}/posts/"
      expect(response).to have_http_status(200)
    end

    it 'should render index view' do
      get "/users/#{@user.id}/posts/"
      expect(response).to render_template('index')
    end

    it 'render should have a posts_container class' do
      get "/users/#{@user.id}/posts/"
      expect(response.body).to include('post_title')
    end
  end

  context 'testing posts#show' do
    it 'return a http status 200' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to have_http_status(200)
    end

    it 'should render index view' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response).to render_template('show')
    end

    it 'render should have a posts_container class' do
      get "/users/#{@user.id}/posts/#{@post.id}"
      expect(response.body).to include('post_title')
    end
  end
end
