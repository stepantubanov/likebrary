class Rating < ActiveRecord::Base
  belongs_to :book, inverse_of: :ratings
  belongs_to :user, inverse_of: :ratings
end
