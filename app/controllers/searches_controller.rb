class SearchesController < ApplicationController
	def search
		@authors = Author.where("name like ?","%#{params[:keyword]}%")
		@books = Book.where('name like ? or description like ? ',"%#{params[:keyword]}%","%#{params[:keyword]}%" )
		
		render 'display'
	end
	def index
			redirect_to :action => :search, :keyword => params[:keyword]
	end
end
