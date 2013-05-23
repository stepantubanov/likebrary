require 'spec_helper'

feature 'Show ratings' do
  let(:user) { User.create!(email: 'bob@example.com', password: 'password') }
  let(:another_user) { User.create!(email: 'alice@example.com', password: 'password') }

  let(:book) { Book.create!(title: 'To Kill a Mockingbird', isbn: '0061120081') }

  background do
    book.ratings.create!(user: another_user, value: 4)

    login(user)
  end

  scenario 'user sees ratings by other users' do
    visit root_path

    within '.ratings' do
      page.should have_content '4'
    end
  end
end
