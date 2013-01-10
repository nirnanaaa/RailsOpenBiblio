class FileFieldInput < SimpleForm::Inputs::FileInput
  def input
    "<div class='input-append' type='text'>\
    #{@builder.text_field("visual", :id => 'appendedInput', :value => ' ', :class => 'file-upload', 'data-source' => "#{attribute_name}-raw")}\
    <a href='#' class='add-on btn file-search-button' data-source=\"#{attribute_name}-raw\"> Search</a></div>\
    #{@builder.file_field(attribute_name, :id => "#{attribute_name}-raw",:class => 'hidden raw-file')}\
    \
    ".html_safe
    
  end
end
