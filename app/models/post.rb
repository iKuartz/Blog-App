class Post < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
    scope :update_posts_counter, ->(user, count) { user.update(posts_counter: count) }
  scope :last_five_comments, ->(post) { Comment.where(post:).last(5) }
end
