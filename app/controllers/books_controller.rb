class BooksController < ApplicationController
  access_control do
    action :new do
      allow all
      allow Settings.roles.admin, Settings.roles.moderate #admins and mods and creators, groups ?
    end
    action :index do
      allow all
    end
    action :create do
      #allow all
      allow Settings.roles.admin, Settings.roles.moderate #admins and mods and creators, groups ?
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
		render :not_found
	end
	def index
	  render
	end
	
end
