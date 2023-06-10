require 'rails_helper'

RSpec.describe Post, type: :model do
  let(:testuser) { User.new(name: 'Testuser', photo: 'www.photo', bio: 'Test bio', posts_counter: 0) }
  let(:subject) { Post.new author: testuser, title: 'title', comments_counter: 0, likes_counter: 0 }

  before do
    testuser.save
    subject.save
  end

  it 'titles should not be blank and less that 250 characters' do
    subject.title = nil
    expect(subject).to_not be_valid

    subject.title = 'a' * 251
    expect(subject).to_not be_valid
  end

  it 'comments_counter should integer and greater or equal to 0' do
    subject.comments_counter = nil
    expect(subject).to_not be_valid

    subject.comments_counter = -4
    expect(subject).to_not be_valid

    subject.comments_counter = 2.5
    expect(subject).to_not be_valid

    subject.comments_counter = 0
    expect(subject).to be_valid

    subject.comments_counter = 5
    expect(subject).to be_valid
  end

  it 'likes_counter should integer and greater or equal to 0' do
    subject.likes_counter = nil
    expect(subject).to_not be_valid

    subject.likes_counter = -4
    expect(subject).to_not be_valid

    subject.likes_counter = 2.5
    expect(subject).to_not be_valid

    subject.likes_counter = 0
    expect(subject).to be_valid

    subject.likes_counter = 5
    expect(subject).to be_valid
  end

  it 'update_user_counter updates the posts_counter in users' do
    expect(testuser.posts_counter).to be(1)
  end

  it 'should return the last 5 comments' do
    7.times { Comment.create user: testuser, post: subject, text: 'text' }
    expect(subject.comments.count).to be(7)
    expect(subject.recent_comments.count).to be(5)
  end
end
