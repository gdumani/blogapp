require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:testuser) { User.new(name: 'Testuser', photo: 'www.photo', bio: 'Test bio', posts_counter: 0) }
  let(:testpost) { Post.new author: testuser, title: 'title', comments_counter: 0, likes_counter: 0 }
  let(:subject) { Comment.new(user: testuser, post: testpost, text: 'Comment text') }

  before do
    testuser.save
    testpost.save
    subject.save
  end

  it 'should increment comments_counter in posts' do
    expect(testpost.comments_counter).to eq(1)
  end
end
