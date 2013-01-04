class AuthorsController < ApplicationController
	def create
		@author = Author.new(params[:author])
		
		if @author.save
			flash[:success] = "Author #{@author.name} created"
			redirect_to @author
		else
			flash[:error] = "Could not create author #{@author.name}"
			render 'new'
		end

	end
	def new
		@author = Author.new
	end
	
	def index
	
	end
	
	def show
		@author = Author.find(params[:id])
		@author.books.create(:name => "KillShot")
		render 'show'
	end
	
	def destroy
	
	end
	
	def edit
	
	end
end
