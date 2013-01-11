class Book::BooksController < ApplicationController
  access_control do
    action :new do
      allow Settings.roles.admin, Settings.roles.moderate
    end
  end
  
  def cap_name(compressed)
    compressor = compressed.split("-")
    name = Array.new
    compressor.each do |cp|
      name << cp.capitalize
    end
    name.join(" ")
  end
  
  def show
    @book = Book.where('name like ?',"%#{cap_name(params[:book])}%").first
    
    if @book
      if params[:format] == 'json'
        render :text => @book.to_json(:except => [:created_at,
                                                  :updated_at, 
                                                  :book_id,
                                                  :location_id
                                                 ])
      else
        render 'books/show'
      end
      
    else
      @message = "No such book"
      #render 'errors/404'
    end
    
  end
end
