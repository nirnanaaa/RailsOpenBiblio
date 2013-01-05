class Book < ActiveRecord::Base
	##
	##Add Image to /new!
	##
	##
	attr_accessible :name, :release, :kind, :isbn, :slogan, :author_id, :available, :image
	
	has_attached_file :image, 			:styles => 
												{ :medium => "400x400",
												  :thumb => "100x100#",
												  :small => "150x150>"
												},
										:convert_options => {
												  :thumb => "-quality 75 -strip" 
															}

	validates_attachment :image,		:size => {:in => 0..Settings.image.max_filesize.kilobytes}
	validates_length_of :isbn,			:in => 9..13, :allow_nil => true
	
	belongs_to :author
	has_and_belongs_to_many :genres
  
end
