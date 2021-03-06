require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject(:comment) do
    user = User.create!(id: 1, name: 'Babi', photo: 'https://randomuser.me/api/portraits/men/3.jpg',
                        bio: 'I used to spend hours writing creative copy', email: 'b@g.com', password: '123456',
                        created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')
    new_post = Post.create(author: user, title: 'Hello 1 (Terrosvaldo)', text: 'This is my first post')
    Comment.new(author: user, post: new_post, text: 'hey')
  end

  before { comment.save }

  describe 'validations' do
    it 'does not validate without an author' do
      comment.author = nil
      expect(comment).to_not be_valid
    end

    it 'does not validate without a title' do
      comment.post = nil
      expect(comment).to_not be_valid
    end

    it 'does not validate without a text' do
      comment.text = nil
      expect(comment).to_not be_valid
    end
  end

  describe '#increment_post_comments_counter' do
    it 'should increment the post.comments_counter by one' do
      curr_post = comment.post
      prev_comments_counter = curr_post.comments_counter

      Comment.create(author: curr_post.author, post: curr_post, text: 'test')

      expect(curr_post.comments_counter).to eq(prev_comments_counter + 1)
    end
  end

  describe '#decrement_post_comments_counter' do
    it 'decrement the posts.comments_counter by one' do
      post = comment.post
      comment.destroy
      expect(post.comments_counter).to eq(0)
    end
  end
end
