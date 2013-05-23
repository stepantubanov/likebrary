require 'spec_helper'
require 'controllers/shared_examples'

describe RatingsController do
  describe 'PUT update' do
    let(:perform_action) { put :update, id: 1, book_id: 1, rating: { value: 5 } }

    include_examples 'requires authentication'

    it 'only allow authorized users to change the rating' do
      alice = User.create(email: 'alice@example.com', password: 'password')
      book = Book.create!(title: 'The Hobbit', isbn: '0618260307')
      rating = Rating.create!(book: book, user: alice, value: 3)

      bob = User.create(email: 'bob@example.com', password: 'password')
      sign_in(bob)

      expect {
        put :update, id: alice.id, book_id: book.id, rating: { value: 5 }
      }.not_to change { rating.reload.value }

      response.status.should == 401
    end
  end
end
