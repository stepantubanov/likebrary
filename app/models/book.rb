class Book < ActiveRecord::Base
  validates_presence_of :title, :isbn
  validates_uniqueness_of :title, :isbn

  has_many :ratings, inverse_of: :book, autosave: true
  accepts_nested_attributes_for :ratings

  def average_rating
    ratings.first.try(:value)
  end
end
