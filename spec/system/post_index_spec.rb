require 'rails_helper'

RSpec.describe 'PostIndexPage', type: :system do
  before :all do
    @user1 = User.create!(name: 'Babi', photo: 'https://randomuser.me/api/portraits/men/3.jpg',
                          bio: 'I used to spend hours writing creative copy', email: 'b@g.com', password: '123456',
                          created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')

    @user2 = User.create!(name: 'Jhon', photo: 'https://randomuser.me/api/portraits/men/4.jpg',
                          bio: 'Condimentum mattis pellentesque id nibh tortor.', email: 'a@g.com', password: '123456',
                          created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')

    @user3 = User.create!(name: 'Alemayehu', photo: 'https://randomuser.me/api/portraits/men/5.jpg',
                          bio: 'Condimentum mattis pellentesque id nibh tortor.', email: 'al@g.com', password: '123456',
                          created_at: '2022-06-15 06:29:35.011315', confirmed_at: '2022-06-15 18:08:24.835529')

    @post1 = Post.create!(author_id: 1, title: 'Sample post1', text: 'Sample Text Content 1')
    @post2 = Post.create!(author_id: 1, title: 'Sample post2', text: 'Sample Text Content 2')
    @post3 = Post.create!(author_id: 1, title: 'Sample post3', text: 'Sample Text Content 3')
    @post4 = Post.create!(author_id: 1, title: 'Sample post3', text: 'Sample Text Content 3')
    @post5 = Post.create!(author_id: 2, title: 'Sample post4', text: 'Sample Text Content 4')
    @post6 = Post.create!(author_id: 2, title: 'Sample post4', text: 'Sample Text Content 1')
    @post7 = Post.create!(author_id: 1, title: 'Sample post2', text: 'Sample Text Content 2')
    @post8 = Post.create!(author_id: 3, title: 'Sample post3', text: 'Sample Text Content 3')
    @post9 = Post.create!(author_id: 3, title: 'Sample post4', text: 'Sample Text Content 4')

    @comment1 = Comment.create!(author_id: 1, post_id: 1, text: 'Comment-1')
    @comment1 = Comment.create!(author_id: 2, post_id: 5, text: 'Comment-1')
    @comment1 = Comment.create!(author_id: 3, post_id: 1, text: 'Comment-1')

    @like1 = Like.create!(author_id: 1, post_id: 1)
    @like2 = Like.create!(author_id: 2, post_id: 1)
    @like3 = Like.create!(author_id: 3, post_id: 1)
  end
  # rubocop:disable Metrics/BlockLength
  context 'testing' do
    before :each do
      visit root_path
      fill_in 'user_email', with: 'a@g.com'
      fill_in 'user_password', with: '123456'
      click_button 'Log in'
      page.all('li').first.click
      click_link 'See all posts'
    end

    it 'I can see the user\'s profile picture.' do
      expect(page.has_xpath?("//img[@src = '#{@user1.photo}' ]"))
    end

    it 'I can see the user\'s username.' do
      expect(page).to have_content @user2.name
    end

    it 'I can see the post\'s title' do
      expect(page).to have_content 'Sample post'
    end

    it 'I can see the number of posts the user has written.' do
      expect(page).to have_content('Number of posts: 2')
    end

    it 'I can see some of the post\'s body.' do
      expect(page).to have_content @post5.text
    end

    it 'I can see the first comments on a post.' do
      expect(page).to have_content @post5.comments.first.text
    end

    it 'I can see how many comments a post has.' do
      expect(page).to have_content '1'
    end

    it 'I can see how many likes a post has.' do
      expect(page).to have_content '1'
    end

    it 'When I click on a post, it redirects me to that post\'s show page.' do
      visit '/users/2/posts/4'
      expect(page).to have_current_path(user_post_path(user_id: @user2.id, id: @post4.id))
    end
  end
end
# rubocop:enable Metrics/BlockLength
