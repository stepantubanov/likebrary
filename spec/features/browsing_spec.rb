require 'spec_helper'

feature 'Browsing' do
  background do
    [
      [ "To Kill a Mockingbird", "0061120081", 4.22 ],
      [ "Pride and Prejudice", "0679783261", 4.23 ],
      [ "Jane Eyre", "0142437204", 4.06 ],
      [ "The Little Prince", "0156012197", 4.21 ]
    ].each do |title, isbn, average_rating|
      Book.create!(title: title, isbn: isbn)
    end
  end

  scenario 'users sees all the books with ratings' do
    visit root_path

    Book.all.each do |book|
      page.should have_content book.title
      page.should have_content book.isbn
    end
  end
end
