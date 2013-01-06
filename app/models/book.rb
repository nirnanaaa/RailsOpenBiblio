# == Schema Information
#
# Table name: books
#
# id          :integer      not null, primary
# name        :string(255)
# release     :integer(10-11)
# kind        :text
# isbn        :integer(9-13)
# slogan      :text
# available   :boolean                         
# image       :image
# fullname    :string(255)
# description :text
# downloadable:boolean
#  
class Book < ActiveRecord::Base

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
	
  has_many :links
  has_and_belongs_to_many :tags
  
  validates_associated :links
  
end
