# == Schema Information
#
# Table name: genre
#
# id          :integer      unsigned, not null, primary
# name        :string(255)
# description :text
#  
class Genre < ActiveRecord::Base
  attr_accessible :name, :description
  
  validates :name         , :uniqueness => true, :presence => true
  
  has_many :books
end
