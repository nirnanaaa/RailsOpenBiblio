class Location < ActiveRecord::Base
	attr_accessible :name, :comment
	
	validates :name, 	:presence => true

end
