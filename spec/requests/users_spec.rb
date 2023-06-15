require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index and render place holder page' do
    it 'returns http success' do
      get '/users'
      expect(response).to have_http_status(:success)
      expect(response.body.include?('List of users')).to be true
    end
  end

  describe 'GET /show and render place holder page' do
    it 'returns http success' do
      @usr = User.create name: 'Testuser', photo: 'www.photo', bio: 'Test bio', posts_counter: 0
      get "/users/#{@usr.id}"
      expect(response).to have_http_status(:success)
      expect(response.body.include?('Given user with recent posts')).to be true
    end
  end
end
