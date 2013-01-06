class TagsController < ApplicationController
	def show
		render :text => params[:tag]
	end
	def index
	  
	end
end
