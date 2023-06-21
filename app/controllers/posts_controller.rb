class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @posts = @user.posts
  end

  def show
    @user = User.find(params[:user_id])
    @post = @user.posts.includes(:comments).find(params[:id])
    @comments = @post.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new author: current_user, title: params[:title], text: params[:text], comments_counter: 0,
                     likes_counter: 0
    if @post.save
      redirect_to "/users/#{current_user.id}/posts/#{@post.id}"
    else
      render :new, status: :unprocessable_entity
      puts '********invalid post*********'
      puts @post.errors.messages
    end
  end
end
