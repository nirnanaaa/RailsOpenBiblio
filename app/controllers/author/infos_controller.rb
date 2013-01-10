class Author::InfosController < ApplicationController

  def show
    #there should be only one author
    #render :text => params[:format]
    #puts "123"
    @author = Author.where('name like ?', "%#{params[:author].split('-').join(' ')}%").first
    
    respond_to do |f|
      f.html { render }
      f.xml { render :xml => @author}
      f.json { render :text => @author.to_json}
    end
  end
end
