module ApplicationHelper
FLASH_NOTICE_KEYS = [:error, :notice, :warning, :success]

  def flash_messages
    return unless messages = flash.keys.select{|k| FLASH_NOTICE_KEYS.include?(k)}
    formatted_messages = messages.map do |type|      
      content_tag :div, :class => type.to_s do
        message_for_item(flash[type], flash["#{type}_item".to_sym])
      end
    end
    formatted_messages.join
  end

  def message_for_item(message, item = nil)
    if item.is_a?(Array)
      message % link_to(*item)
    else
      message % item
    end
  end
  def paginations(dbresource, page = nil)
	count = dbresource.count
	if page.nil?
		dimensions = [0..30].to_a
	end
	dimensions
  end
  
  ##some settings
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
  def url_name_to_raw(url)
    url.split("-").join(" ")
  end
  def raw_name_to_url(name)
    name.split(" ").join("-")
  end
end
