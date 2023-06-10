require 'rails_helper'

RSpec.describe Like, type: :model do
  let(:testuser) { User.new(name: 'Testuser', photo: 'www.photo', bio: 'Test bio', posts_counter: 0) }
  let(:testpost) { Post.new author: testuser, title: 'title', comments_counter: 0, likes_counter: 0 }
  let(:subject) { Like.new(user: testuser, post: testpost) }

  before do
    testuser.save
    testpost.save
    subject.save
  end

  it 'should increment likes_counter in posts' do
    expect(testpost.likes_counter).to be(1)
  end
end
