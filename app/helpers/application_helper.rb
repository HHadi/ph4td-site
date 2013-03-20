module ApplicationHelper
  #Improvement over first iteration of the title
  def full_title(title)
    base_title = 'DigiTD'
    if title.empty?
      base_title
    else
      "#{base_title} | #{title}"
    end
  end
end
