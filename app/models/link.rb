class Link < ActiveRecord::Base
  attr_accessible :label, :url, :tooltip
  
  validates :label          , :presence => true,
                              :unique => true, 
                              :format => { :with => /\w+/}
                              
  validates :url            , :format => { :with => /^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/ }
  
  belongs_to :books
end