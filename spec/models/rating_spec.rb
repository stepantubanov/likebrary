require 'spec_helper'

describe Rating do
  describe '.for' do
    it 'returns existing rating' do
      rating = Rating.create!(book_id: 1, user_id: 2)
      Rating.for(book_id: 1, user_id: 2).should == rating
    end

    it 'initializes a new rating' do
      rating = Rating.for(book_id: 1, user_id: 2)
      rating.should be_new_record
    end
  end
end
