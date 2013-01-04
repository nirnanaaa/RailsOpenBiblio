class AuthorsController < ApplicationController
	before_filter :signed_in_filter
	def create
		@author = Author.new(params[:author])
		
		if @author.save
			flash[:success] = "Author #{@author.name} created"
		else
			flash[:error] = "Could not create author #{@author.name}"
			render 'new'
		end
	end
	def index
	
	end
	def show
	
	end
	def destroy
	
	end
	def edit
	
	end
end
