class Book < ActiveRecord::Base
  validates_presence_of :title, :isbn
  validates_uniqueness_of :title, :isbn
end
