class LikesController < ApplicationController
  def create
    @like = Like.create user: current_user, post_id: params[:id]
    redirect_to "/users/#{@like.post.author_id}/posts/#{@like.post_id}"
  end
end
