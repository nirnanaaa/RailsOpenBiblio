class Book < ActiveRecord::Base
  attr_accessible :name, :description, :release, :kind, :slogan, :isbn, :available
  
	validates :name,							:lenght => {
															:maximum => 70,
															:too_long => "%{count} characters is the maximum allowed" }
															},
												presence => true

  has_one :author
  has_one :location
  has_and_belongs_to_many :genres
  
end
