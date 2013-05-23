require 'spec_helper'

feature 'Guest' do
  scenario 'guest user can not add books' do
    visit root_path

    page.should_not have_link 'Add book'
  end

  scenario 'guest user can not rate existing books' do
    book = Book.create!(title: 'The Harry Potter and the Goblet of Fire', isbn: 'unknown')

    visit root_path

    page.should_not have_css '.rating'
  end
end
