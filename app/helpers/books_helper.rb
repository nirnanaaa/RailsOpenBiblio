module BooksHelper
	def tag_generator(list)
		splitted = list.split(',')
		new = Array.new
		splitted.each do |s|
			new << [ link_to(s.capitalize, tags_path(s.downcase)) ]
		end
		new.join
	end
end
