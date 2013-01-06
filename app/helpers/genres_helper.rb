module GenresHelper
  def perform_link(genre,action)
    "#{Settings.urls.genre_url}#{genre.name.downcase.split(' ').join('-')}#{action}"
  end
end
