class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_create :update_posts_counter

  private

  def update_posts_counter
    post.increment!(:comments_counter)
  end
end
