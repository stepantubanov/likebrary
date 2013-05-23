require 'spec_helper'

feature 'Browsing' do
  background do
    [
      ["To Kill a Mockingbird", "0061120081"],
      ["Pride and Prejudice", "0679783261"],
      ["Jane Eyre", "0142437204"],
      ["The Little Prince", "0156012197"]
    ].each do |title, isbn|
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
