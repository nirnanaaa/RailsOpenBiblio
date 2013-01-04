class SplashesController < ApplicationController
	def show
		render 'index', :handlers => [:erb]
	end
end
