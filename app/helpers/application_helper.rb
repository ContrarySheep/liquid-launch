module ApplicationHelper
  
  def render_xml_as_html(plist)
    raw(CGI.escapeHTML(plist).gsub(/\n/, '<br>').gsub(/\t/,'&nbsp;&nbsp;'))
  end
  
  def argument_display(value)
    if @plist && @plist.send("argument_#{value}")
      !@plist.send("argument_#{value}").empty? ? 'style="display:block;"' : 'style="display:none;"'
    else
      'style="display:none;"'
    end
  end
  
end
