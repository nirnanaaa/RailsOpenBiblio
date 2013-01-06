class Book::DownloadsController < ApplicationController
  def index
    @book = Book.where("name like ?", "%#{params[:book]}%").first
    if @book
      if @book.downloadable
          render :text => "Downloading"
      end
      
    else
      render 'error/404'
    end
  end
  def show
    #download book
  end
end
