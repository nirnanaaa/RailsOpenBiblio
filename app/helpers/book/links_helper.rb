module Book::LinksHelper
  def submit_url
    url = raw(Settings.urls.link[:new])
    url.split('!book').join(params[:book])
  end
end
