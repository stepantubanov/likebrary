require 'spec_helper'

feature 'Sign up' do
  scenario 'user creates an account' do
    visit root_path
    click_link 'Sign up'

    fill_in 'user_email', with: 'alice@example.com'
    fill_in 'user_password', with: 'password'
    fill_in 'user_password_confirmation', with: 'password'
    click_button 'Sign up'

    page.should have_content 'Sign out'
  end
end
