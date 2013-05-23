require 'spec_helper'

feature 'Login' do
  background do
    User.create!(email: 'bob@example.com', password: '12345678')
  end

  scenario 'user logs in to the site' do
    visit new_user_session_path

    fill_in 'user_email', with: 'bob@example.com'
    fill_in 'user_password', with: '12345678'
    click_button 'Sign in'

    page.should have_link 'log-out'
  end
end
