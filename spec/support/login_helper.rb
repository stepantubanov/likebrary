module LoginHelper
  def login(user)
    visit new_user_session_url
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    click_button 'Sign in'
  end
end
