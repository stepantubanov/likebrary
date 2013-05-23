require 'spec_helper'
require 'controllers/shared_examples'

describe BooksController do
  describe 'GET new' do
    let(:perform_action) { get :new }
    include_examples 'requires authentication'
  end

  describe 'GET create' do
    let(:perform_action) { post :create, book: { title: 'Rework', isbn: 'unknown' } }
    include_examples 'requires authentication'
  end
end
