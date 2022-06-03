require 'rails_helper'

RSpec.describe 'Users views', type: :system do
  describe 'Index' do
    it 'shows the correct content' do
      visit users_path
      expect(page).to have_content('Hello users')
    end
  end

  describe 'Show' do
    it 'shows the correct content' do
      id = 1
      visit user_path(id)
      expect(page).to have_content("BEHOLD MY USERNESS OF ID #{id}")
    end
  end
end