class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: :author_id
  belongs_to :post

  after_save :update_posts_counter

  private

  def update_comment_counter
    posts.increment!(:comments_counter)
  end
end
