module ApplicationHelper
  def paginations(dbresource, page = nil)
	count = dbresource.count
	if page.nil?
		dimensions = [0..30].to_a
	end
	dimensions
  end
  ##some settings
  def copyright_show
    Settings.vars.copyright_text.html_safe
  end
  def copyright_show?
    Settings.settings.show_copyright
  end
  def version_show?
    Settings.settings.show_version
  end
  def version_show
    Settings.vars.version_string.html_safe
  end
  def ctrlbar_enabled?
    Settings.settings.user_control_bar_enabled
  end
  
  def page_logo
    Settings.page.logo
  end
  
  def page_author
    Settings.page.author
  end
  
  def page_encoding
    Settings.page.encoding
  end
  
  ##/some settings
  
  def order_by_link(sort, by = nil)
	link_to(by.singularize.capitalize, :action => :index, :sort_by => by)
  end
  
  ## replace whitespaces
  def url_name_to_raw(url)
    url.split("-").join(" ")
  end
  
  def raw_name_to_url(name)
    name.split(" ").join("-")
  end
  ##/replace whitespaces
  ##generators
  def generate_onclick(link)
    ##bare javascript
    "location.href='#{link}'"
  end
  ##/generators
end
