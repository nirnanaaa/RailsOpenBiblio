class Author < ActiveRecord::Base
	attr_accessible :name, :biography, :born, :died
	
	validates :name,						:presence => true,
											:lenght => { 
														:in => 5..40,
														:too_short => "must have at least %{count} characters",
														:too_long  => "must have at most %{count} characters"
														},
											:uniqueness => true
														
	validates :biography,					:lenght => { 
														:maximum => 200,
														:message  => "biography is too long! max 200 chars"
														}
	validates :born, :died,					:lenght => {
														:in => 10..11,
														:message => "unix timestamp is 10|11 ints long"
														},
											:numericality => { :only_integer => true }
	
	has_many :books
	validates_associated :books
end
