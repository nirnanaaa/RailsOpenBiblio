class Author < ActiveRecord::Base
  
	attr_accessible                :name, 
	                               :biography, 
	                               :born, 
	                               :died, 
	                               :avatar

	has_attached_file :avatar, 			:styles => { 
	                                             :medium => "400x400>", 
	                                             :thumb => "100x100>",
	                                             :small => "",
	                                             :large => "" 
	                                           }

	validates_attachment :avatar,		:size => {
	                                             :in => 0..Settings.image.max_filesize.kilobytes
	                                         }
	
	
	validates :name						    , :uniqueness => true,
	                                :on => :create
	                                
  validates :name               , :presence => true,
                                  :on => :save
                                

	validates :born						, :numericality => { :only_integer => true, :allow_nil => true}
	validates :died						, :numericality => { :only_integer => true, :allow_nil => true}
	
	has_many :books
	validates_associated :books
end
