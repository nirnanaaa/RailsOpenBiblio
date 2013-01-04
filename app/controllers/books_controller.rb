class BooksController < ApplicationController
	def new
		@authors = Author.where('id < 100')
		@book = Book.new
	end
	def create
		@newbook = Author.new(params[:book])
		if @newbook.save
			render 'new'
		end
	end
	def show
	
	end
	def index
	
	end
	def destroy
	
	end
	def edit
	
	end
	
end
