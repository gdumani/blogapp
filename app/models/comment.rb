class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_posts_counter

  private

  def update_posts_counter
    posts.increment!(:comments_counter)
  end
end
