class DatePickerInput < SimpleForm::Inputs::StringInput
  def input_html_options
    value = object.send(attribute_name)
    options = {
      class: 'date-picker'
    }
    # add all html option you need...
    super.merge options
  end
  def input_html_classes
    super.push('date_picker')
  end
end
