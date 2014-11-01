module ApplicationHelper
  
  def auth_token
      html = '<input type="hidden"'
      html +=       'name="authenticity_token"'
      html +=      'value="<%= form_authenticity_token %>">'

      html.html_safe
  end
  
  def submit(type)
      "<input type=\"submit\" value=\"Click to #{type}\">".html_safe
  end
  

  
  
  def display_flash(sym)
    html = ""
    if flash[sym]
      flash[sym].each do |element|
        html += element + "<br>"
      end
    end
    html.html_safe
  end
  
end
