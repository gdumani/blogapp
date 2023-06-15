require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  before do
    @usr = User.create name: 'Testuser', photo: 'www.photo', bio: 'Test bio', posts_counter: 0
    @pst = Post.create author: @usr, title: 'title', comments_counter: 0, likes_counter: 0
  end

  describe 'GET /index and retrieve place holder page' do
    it 'returns http success' do
      get "/users/#{@usr.id}/posts"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body.include?('List of posts for a given user')).to be true
    end
  end

  describe 'GET /show retrieve place holder page' do
    it 'returns http success' do
      get "/users/#{@usr.id}/posts/#{@pst.id}"
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body.include?('Given post of given user')).to be true
    end
  end
end
