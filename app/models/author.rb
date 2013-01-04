class Author < ActiveRecord::Base
	attr_accessible :name, :biography, :born, :died, :avatar
	
	has_attached_file :avatar, 			:styles => { :medium => "400x400>", :thumb => "100x100>" }
	
	validates_attachment :avatar,		:size => {:in => 0..RPO::Application.config.image.maxfilesize.kilobytes}
	
	validates :name						, :presence => true, :uniqueness => true
	
	validates :born						, :numericality => { :only_integer => true}
	validates :died						, :numericality => { :only_integer => true}
	
	has_many :books
	validates_associated :books
end
