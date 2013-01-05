class User < ActiveRecord::Base
  belongs_to :tags
  belongs_to :books
end
