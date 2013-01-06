class Book::BooksController < ApplicationController
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
      render 'books/show'
    else
      @message = "No such book found"
      render 'errors/404'
    end
    
  end
end
