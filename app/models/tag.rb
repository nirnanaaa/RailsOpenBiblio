class Tag < ActiveRecord::Base
  attr_accessible :name, :description, :books_id
  
  validates :name           , :uniqueness => true, 
                              :presence => true
  
  belongs_to :books
end
