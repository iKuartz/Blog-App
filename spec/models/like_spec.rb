require 'rails_helper'

RSpec.describe Like, type: :model do
  subject(:like) do
    user = User.create!(id: 1, name: 'Babi', photo: 'https://randomuser.me/api/portraits/men/3.jpg',
                        bio: 'I used to spend hours writing creative copy', email: 'b@g.com', password: '123456',
                        created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')
    new_post = Post.create(author: user, title: 'Hello 1 (Terrosvaldo)', text: 'This is my first post')
    Like.new(author: user, post: new_post)
  end

  before { like.save }

  describe 'validations' do
    it 'does not validate without an author' do
      like.author = nil
      expect(like).to_not be_valid
    end

    it 'does not validate without an author' do
      like.post = nil
      expect(like).to_not be_valid
    end
  end

  describe '#increment_post_likes_counter' do
    it 'should increment the post.comments_counter by one' do
      curr_post = like.post
      prev_likes_counter = curr_post.likes_counter

      Like.create(author: curr_post.author, post: curr_post)

      expect(curr_post.likes_counter).to eq(prev_likes_counter + 1)
    end
  end

  describe '#decrement_post_likes_counter' do
    it 'decrement the posts.comments_counter by one' do
      post = like.post
      like.destroy
      expect(post.likes_counter).to eq(0)
    end
  end
end
