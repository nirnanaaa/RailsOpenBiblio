class SplashesController < ApplicationController
	def show
		#@author = Author.new(:name => "Vince Flynn", :born => -126230400)
		#@author.save()
		#@poh = @author.books.create(:name => "Kill Shot")
		#splash = new Book(:)
		@author = Author.where("name = ?","Vince Flynn")
		#@poh = @author.books.create(:name => "KillShot")
		#@poh.save
		render 'index', :handlers => [:erb]
	end
end
