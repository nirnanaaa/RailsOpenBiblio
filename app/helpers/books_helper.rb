module BooksHelper
	def tag_generator(list)
		splitted = list.split(" ").join("").split(',')
		new = Array.new
		splitted.each do |s|
			new << [ link_to(s.capitalize, "/tag/#{s.downcase}") ]
		end
		new.join(" | ")
	end
	def name(book)
		book.name.split(" ").join("-").downcase
	end
	
end
