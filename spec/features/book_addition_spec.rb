require 'spec_helper'

feature 'Book addition' do
  scenario 'user adds a new book' do
    visit root_path
    click_link 'Add book'

    fill_in 'book_title', with: 'The Hobbit'
    fill_in 'book_isbn', with: '0618260307'
    click_button 'Add'

    page.should have_content 'The Hobbit'
  end
end
