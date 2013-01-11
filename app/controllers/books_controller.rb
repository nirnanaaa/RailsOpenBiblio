class BooksController < ApplicationController
  access_control do
    action :new do
      allow Settings.roles.admin, Settings.roles.moderate, Settings.roles.book.new
    end
  end
  
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
	  render
	end
	
end
