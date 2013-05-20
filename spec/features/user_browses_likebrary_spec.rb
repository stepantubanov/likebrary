require 'spec_helper'

feature 'User browses likebrary' do
  scenario 'users sees all the books with ratings' do
    visit root_path

    Book.all.each do |book|
      page.should have_content book.title
      page.should have_content book.isbn
      page.should have_content book.rating
    end
  end
end
