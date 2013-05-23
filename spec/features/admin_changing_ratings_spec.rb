require 'spec_helper'

feature 'Admin changing ratings' do
  let(:user) { User.create!(email: 'bob@example.com', password: 'password') }
  let(:book) { Book.create!(title: 'The Hobbit', isbn: '0618260307') }

  let(:admin) { User.create!(email: 'alice@example.com', password: 'password', admin: true) }

  background do
    book.ratings.create!(user: user, value: 3)

    login(admin)
  end

  def within_user_row(&block)
    within find('li', text: /#{Regexp.escape(user.email)}/), &block
  end

  scenario 'admin changes a rating by another user' do
    visit root_path
    within_user_row do
      page.should have_checked_field '3'
    end

    # Admin should see the rating controls
    within_user_row do
      choose '4'
      click_button 'save'
    end

    within_user_row do
      page.should have_checked_field '4'
    end
  end
end
