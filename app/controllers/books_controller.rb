class BooksController < ApplicationController
	def new
		@book = Book.new
	end
	def create
		@newbook = Book.new(params[:book])
		if @newbook.save!
			redirect_to @newbook
		else
			render "errors/500"
		end

	end

	def show
		render 'errors/404'
	end
	def index
	
	end
	def destroy
	
	end
	def edit
	
	end
	
end
