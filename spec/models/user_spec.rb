require 'rails_helper'
require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation

RSpec.describe User, type: :model do
  subject(:user) { User.new(id: 1, name: 'Babi', photo: 'https://randomuser.me/api/portraits/men/3.jpg',
            bio: 'I used to spend hours writing creative copy', email: 'b@g.com', password: '123456',
            created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529') }

  before { user.save }

  describe 'validations' do
    it 'does not validate without a name' do
      user.name = nil
      expect(user).to_not be_valid
    end

    it 'does not validate if posts_counter is not >= 0' do
      user.posts_counter = -5
      expect(user).to_not be_valid
    end
  end

  describe '#three_recent_posts' do
    subject(:three_recent_posts) do
      Post.create(author: user, title: 'Hello 1 (Terrosvaldo)', text: 'This is my first post')
      Post.create(author: user, title: 'Hello 1 (Terrosvaldo)', text: 'This is my first post')
      Post.create(author: user, title: 'Hello 1 (Terrosvaldo)', text: 'This is my first post')
      Post.create(author: user, title: 'Hello 1 (Terrosvaldo)', text: 'This is my first post')
      user.three_recent_posts
    end

    it 'should be an instance of Post' do
      expect(three_recent_posts).to all(be_instance_of(Post))
    end

    it 'should return the last three recent posts for a user that has 4 posts' do
      expect(three_recent_posts.length).to eq(3)
    end
  end
end
