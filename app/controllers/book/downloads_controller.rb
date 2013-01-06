class Book::DownloadsController < ApplicationController
  def index
    @book = Book.where("name like ?", "%#{params[:book].split("-").join(" ")}%").first
    if @book
      if @book.downloadable
          render :text => "Downloading"
      end
      
    else
      render 'errors/404'
    end
  end
  def show
    #download book
  end
end
