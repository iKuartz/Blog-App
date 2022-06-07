class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :posts, dependent: :destroy
  has_many :likes, dependent: :nullify
  validates :name, presence: true
    scope :last_three_posts, ->(user) { Post.where(author: user).last(3) }
end
