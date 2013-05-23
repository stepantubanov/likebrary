class Rating < ActiveRecord::Base
  belongs_to :book, inverse_of: :ratings
  belongs_to :user, inverse_of: :ratings

  def self.for(attributes)
    where(attributes).first || new(attributes)
  end
end
