require 'rails_helper'

RSpec.describe Post, type: :system do
  before(:each) do
    @user1 = User.create(name: 'user1', photo: '/assets/1.png', bio: 'Mock bio', posts_counter: 0)
    @user2 = User.create(name: 'user2', photo: '/assets/2.png', bio: 'Mock bio 2', posts_counter: 0)
    @post1 = Post.create(author: @user1, title: 'Title', text: 'text of the post', comments_counter: 0,
                         likes_counter: 0)
    @comment = Comment.create(user: @user2, post: @post1, text: 'text')
    Like.create(user: @user1, post: @post1)
  end

  describe 'index page' do
    before(:each) do
      visit user_posts_path(@user1.id)
    end
    it "shows the user's profile picture" do
      expect(page).to have_xpath("//img[contains(@src,'/assets/1.png')]")
    end

    it "shows the user's username" do
      expect(page).to have_content(@user1.name)
    end

    it 'shows the number of posts the user has written' do
      expect(page).to have_content('Number of posts: 1')
    end

    it "shows a post's title" do
      expect(page).to have_content(@post1.title)
    end

    it "shows some of the post's body" do
      expect(page).to have_content(@post1.text)
    end

    it 'shows the first comments on a post' do
      expect(page).to have_content(@comment.text)
    end

    it 'shows how many comments a post has' do
      expect(page).to have_content('Comments: 1')
    end

    it 'shows how many likes a post has' do
      expect(page).to have_content('Likes: 1')
    end

    it 'shows a pagination section if there are more posts than fit on the view' do
      expect(page).to have_link('Pagination')
    end

    it "redirects to a post's show page when clicking on it" do
      click_link('>')
      expect(page).to have_current_path(user_post_path(@user1.id, @post1.id))
    end
  end

  describe 'post show page' do
    before(:each) do
      visit user_post_path(@user1.id, @post1.id)
    end

    it "shows post's title" do
      expect(page).to have_content(@post1.title)
    end

    it "shows post's author" do
      expect(page).to have_content(@user1.name)
    end

    it "shows comment's counter" do
      expect(page).to have_content("Comments: #{@post1.comments_counter}")
    end

    it "shows like's counter" do
      expect(page).to have_content("Likes: #{@post1.likes_counter}")
    end

    it "shows post's text" do
      expect(page).to have_content(@post1.text)
    end

    it "shows commentor's name" do
      expect(page).to have_content(@user2.name)
    end

    it "shows commentor's text" do
      expect(page).to have_content(@comment.text)
    end
  end
end
