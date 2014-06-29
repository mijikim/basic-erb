require "erb_generator"

class HTMLGenerator < ERBGenerator

  def initialize(layout = nil)
    @layout = layout
  end

  def section(text)
    template = "<section><%= awesome_text %></section>"
    options_hash = {:locals => {:awesome_text => text}, layout: @layout}
    erb template, options_hash
  end

  def unordered_list(items)
    # allows multi line string
  template = <<-TEMPLATE
  <ul>
    <% html_items.each do |item| %>
    <li><%= item %></li>
    <% end%>
  </ul>
    TEMPLATE
    options_hash = {:locals => {:html_items => items}, layout: @layout}
    erb(template, options_hash)
  end

  def button(item, item2 = "")
    template = <<-TEMPLATE
<% if button_text2 == "" %>
<button><%= button_text %></button>
<% else %>
<button class='<%= button_text2[:class] %>'><%= button_text %></button>
<% end %>
TEMPLATE
    template = template.split("\n").join
    options_hash = {:locals => {:button_text => item, :button_text2 => item2}, layout: @layout}
    erb(template, options_hash)
  end

end
