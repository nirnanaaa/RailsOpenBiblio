class User < ActiveRecord::Base

  has_many :tags
  has_many :books
  has_many :authors
  has_many :genres
  
  def validate_password(password, hash)
    
  end
  def crpytpassword(cleartype)
    
  end
  def leftrotate(value, shift)
    return ( ((value << shift) | (value >> (32 - shift))) & 0xffffffff)
  end
end
