require 'spec_helper'

feature 'Rating books' do
  let(:user) { User.create!(email: 'bob@example.com', password: '12345678') }

  background do
    login(user)
  end

  scenario 'user rates a book while adding it' do
    click_link 'Add book'

    fill_in 'book_title', with: 'The Hobbit'
    fill_in 'book_isbn', with: '0618260307'
    within '.rating' do
      choose '5'
    end
    click_button 'Add'

    page.should have_content 'The Hobbit'
    page.should have_content 'Average Rating: 5'
  end
end
