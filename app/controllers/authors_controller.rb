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
	
	def name
	
	end
	
	def index
		@count = Author.count+1
		if params[:end]
			@end = params[:end]
		else	
			@end = @count
		end
		if params[:start]
			@start = params[:start]
		else
			@start = 0
		end
		@author = Author.where('id < ? AND id > ?',@end, @start)
		
	end
	
	def show
		@author = Author.find(params[:id])
		render 'show'
	end
	
	def destroy
	
	end
	
	def edit
	
	end
end
