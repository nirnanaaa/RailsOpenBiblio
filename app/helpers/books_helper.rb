module BooksHelper
	def tag_generator(list)
		splitted = list.split(" ").join("").split(',')
		new = Array.new
		splitted.each do |s|
			new << [ link_to(s.capitalize, "/tag/#{s.downcase}",:class => "btn") ]
		end
		new.join()
	end
	def name(book)
		book.name.split(" ").join("-").downcase
	end
	def perform_link(book,action)
	  perform_book_link(book,action)
	end
	def perform_book_link(book,action)
	   "#{Settings.urls.book_url}#{book.name.downcase.split(' ').join('-')}/#{action}"
	end
end
