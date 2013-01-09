class DateTimeDisplay < SimpleForm::Inputs::DateTimeInput
  def input_datetime
    "template.content_tag(:div, super)"
  end
end