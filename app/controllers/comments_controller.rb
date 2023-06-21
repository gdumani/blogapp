class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post = Post.find(params[:id])
    @current_user = current_user
  end

  def create
    @comment = Comment.new user: current_user, post_id: params[:post_id], text: params[:text]
    if @comment.save
      redirect_to "/users/#{@comment.post.author_id}/posts/#{@comment.post.id}"
    else
      render "/comments/new/#{@comment.post.id}", status: :unprocessable_entity
    end
  end
end
