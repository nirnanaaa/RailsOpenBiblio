class TagsController < ApplicationController
	def show
	  @tag = Tag.where(:name => params[:tag]).first
	  if @tag
	    render
	  else
	    @tag = Tag.new({
	      name: params[:tag]
	    })
	    if @tag.save
	     render
	    else
	      render 'errors/500'
	    end
	  end
		
	end
	def new
	  
	end
	def create
	  
	end
	def destroy
	  
	end
	def index
	  @tag = Tag.limit(Settings.tags.maxresults).find(:all)
	  
	end
end
