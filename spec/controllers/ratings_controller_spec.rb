require 'spec_helper'
require 'controllers/shared_examples'

describe RatingsController do
  describe 'PUT update' do
    let(:perform_action) { put :update, id: 1, book_id: 1, rating: { value: 5 } }
    include_examples 'requires authentication'
  end
end
