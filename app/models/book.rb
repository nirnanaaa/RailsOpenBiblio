class Book < ActiveRecord::Base
	##
	##Add Image to /new!
	##
	##
	attr_accessible :name,
	                :release,
	                :kind, 
	                :isbn, 
	                :slogan, 
	                :author_id, 
	                :available, 
	                :image, 
	                :fullname, 
	                :description,
	                :downloadable

	has_attached_file :image, 			:styles => { :medium => Settings.image.medium,
                                               :thumb => Settings.image.thumb,
                                               :small => Settings.image.small
												                     },
										              :convert_options => {
												                       :thumb => "-quality #{Settings.image.thumb_quality} -strip" 
															                        }

	validates_attachment :image,		:size => {:in => 0..Settings.image.max_filesize.kilobytes}
	validates_length_of :isbn,			:in => 9..13, :allow_nil => true
	
	belongs_to :author
	belongs_to :genres
  
end
