class FileFieldInput < SimpleForm::Inputs::StringInput
  def input
    "<div class='input-append'type='text'>#{@builder.text_field(attribute_name, :id => 'appendedInput', :value => '', :class => 'file-upload')}<a href='#' class='add-on btn'> Search</a></div>".html_safe
    
  end
end
