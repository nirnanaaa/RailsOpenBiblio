class Book < ActiveRecord::Base
	attr_accessible :name, :release, :kind, :isbn, :slogan, :author_id, :available
	has_one :author
	has_and_belongs_to_many :genres
  
end
