class Book < ActiveRecord::Base
  validates_presence_of :title, :isbn
  validates_uniqueness_of :title, :isbn

  has_many :ratings, inverse_of: :book, autosave: true, dependent: :delete_all
  accepts_nested_attributes_for :ratings

  def rating_for(user)
    ratings.where(user_id: user.id).first || Rating.new(book: self, user: user)
  end

  def rating_by(user)
    if ratings.loaded?
      ratings.find { |r| r.user_id == user.id }
    else
      ratings.find_by_user_id(user.id)
    end
  end
end
