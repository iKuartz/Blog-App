class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  scope :update_comments_counter, ->(post, count) { post.update(comments_counter: count) }
end
