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
    within '.rating' do
      page.should have_checked_field '5'
    end
  end

  scenario 'user rates existing book the first time' do
    book = Book.create!(title: 'The Hobbit', isbn: '0618260307')

    visit root_path

    # Assuming there is only one book
    within '.rating' do
      choose '4'
    end
    click_button 'save'

    within '.rating' do
      page.should have_checked_field '4'
    end
  end

  scenario 'user changes a rating for a book' do
    book = Book.create!(title: 'The Hobbit', isbn: '0618260307')
    book.ratings.create!(user: user, value: 3)

    visit root_path
    within '.rating' do
      page.should have_checked_field '3'
    end

    # Assuming there is only one book
    within '.rating' do
      choose '4'
    end
    click_button 'save'

    within '.rating' do
      page.should have_checked_field '4'
    end
  end
end
