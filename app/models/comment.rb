class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  
  def update_posts_counter
    posts.increment!(:comments_counter)
  end
end
