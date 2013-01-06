class Book::LinksController < ApplicationController
  def index
    
  end
  def create
    @link = Link.new(params[:link])
    if @link.save!
      render :text => "ok"
    end
  end
  
  def new
    @link = Link.new
  end
  def edit
    
  end
end
