class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  scope :update_likes_counter, ->(post, count) { post.update(likes_counter: count) }
end
