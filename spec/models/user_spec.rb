require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Testuser', photo: 'www.photo', bio: 'Test bio', posts_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'post_counter should integer and greater or equal to 0' do
    subject.posts_counter = nil
    expect(subject).to_not be_valid

    subject.posts_counter = -4
    expect(subject).to_not be_valid

    subject.posts_counter = 2.5
    expect(subject).to_not be_valid

    subject.posts_counter = 0
    expect(subject).to be_valid

    subject.posts_counter = 5
    expect(subject).to be_valid
  end

  it 'should return the last 3 posts' do
    subject.save
    5.times { Post.create author: subject, title: 'title', comments_counter: 0, likes_counter: 0 }
    expect(subject.posts.count).to be(5)
    expect(subject.recent_posts.count).to be(3)
  end
end
