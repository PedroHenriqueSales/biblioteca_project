class Book < ActiveRecord::Base

  validates :title, :author, :edition, :isbn, :relesed_on, :publisher, :language, presence: true
  validates :synopsis , length: { minimum: 10 }
  validates :number_of_pages, numericality: { greater_than_or_equal_to: 0 }
  
end
