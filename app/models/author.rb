class Author < ActiveRecord::Base
	attr_accessible :name, :biography, :born, :died
	
	
	validates :name						, :presence => true, :uniqueness => true
	
	validates :born						, :numericality => { :only_integer => true}
	validates :died						, :numericality => { :only_integer => true}
	
	has_many :books
	validates_associated :books
end
