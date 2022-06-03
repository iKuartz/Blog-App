require 'rails_helper'

RSpec.describe 'Posts views', type: :system do
  describe 'Index' do
    it 'shows the correct content' do
      visit user_posts_path(user_id: 1)
      expect(page).to have_content('Posted?')
    end
  end

  describe 'Show' do
    it 'shows the correct content' do
      id = 1
      post = 2
      visit user_post_path(id, post)
      expect(page).to have_content("Post-it, #{id}, with your post number #{post}")
    end
  end
end