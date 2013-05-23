require 'spec_helper'

feature 'Login' do
  background do
    User.create!(email: 'bob@example.com', password: '12345678')
  end

  scenario 'user signs in to the site' do
    visit root_path
    click_link 'Sign in'

    fill_in 'user_email', with: 'bob@example.com'
    fill_in 'user_password', with: '12345678'
    click_button 'Sign in'

    page.should have_link 'Sign out'
  end
end
