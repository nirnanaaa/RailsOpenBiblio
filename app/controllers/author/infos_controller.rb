class Author::InfosController < ApplicationController

  def show
    #there should be only one author
    #render :text => params[:format]
    #puts "123"
    @author = Author.where('name like ?', "%#{params[:author].split('-').join(' ')}%").first
    
    respond_to do |f|
      f.html { render }
      f.xml { render :xml => @author}
      f.json { render :text => render_json_output(@author)}
    end
  end
  def render_json_output(author)
    
    author.to_json(:except => [:created_at,
                               :updated_at, 
                               :author_id,
                               :avatar_updated_at,
                               :avatar_content_type,
                               :avatar_file_name,
                               :avatar_file_size
                               ])
  end
end
