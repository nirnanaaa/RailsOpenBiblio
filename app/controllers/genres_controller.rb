class GenresController < ApplicationController
  def index
    @genre = Genre.where('name like ?', "%#{params[:genre].split('-').join(' ')}%").first
    render 'show'
  end
  def show
    render 'index'
  end
  def new
    @genre = Genre.new
  end
  def create
    @genre = Genre.new(params[:genre])
    
    if @genre.save!
      render 'index'
    end
  end
end
