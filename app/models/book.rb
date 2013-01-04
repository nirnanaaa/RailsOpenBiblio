class Book < ActiveRecord::Base
  attr_accessible :name, :description, :release, :kind, :slogan, :isbn, :available
  


  has_one :author
  has_one :location
  has_and_belongs_to_many :genres
  
end
