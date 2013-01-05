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
	def cap_name(compressed)
		compressor = compressed.split("-")
		name = Array.new
		compressor.each do |cp|
			name << cp.capitalize
		end
		name.join(" ")
	end
	def name
		@book = Book.where('name like ?',"%#{cap_name(params[:book])}%").first
		
		if @book
			render 'show'
		else
			@message = "No such book found"
			render 'errors/404'
		end
		
	end
	def show
		render :text => params[:id]
	end
	def index
	
	end
	def destroy
	
	end
	def edit
	
	end
	
end
