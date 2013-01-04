class Author < ActiveRecord::Base
	attr_accessible :name, :biography, :born, :died

														
	
	has_many :books
	validates_associated :books
end
