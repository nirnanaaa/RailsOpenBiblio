class AuthorsController < ApplicationController
	def create
	  params[:author].delete(:visual)
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
		if params[:sort_by]
			order_by_link(authors_path, params[:sort_by])
		end
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
		if cookies[:sort_author_by]
			@query = Author.order("#{cookies[:sort_author_by]} #{cookies[:sort_author_by_order]}").find(:all)
		else
			@query = Author.find(:all)
		end
		
	end
	
	def show
		@author = Author.find(params[:id])
		render 'show'
	end
	
	def destroy
	
	end
	
	def edit
	
	end
	def order_by_link(sort, by = nil)
		cookies[:sort_author_by] = {
				:value => by,
				:expires => 1.year.from_now
		}
		if !cookies[:sort_author_by_order]
			cookies[:sort_author_by_order] = {
				:value => "ASC",
				:expires => 1.year.from_now
		}
		else
			cookie = cookies[:sort_author_by_order]
			if cookie == "ASC"
				cookies[:sort_author_by_order] = "DESC"
			else
				cookies[:sort_author_by_order] = "ASC"
			end
		end
  end
end
