class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  after_save :update_posts_counter

  private

  def update_posts_counter
    post.increment!(:likes_counter)
  end
end
