require "erb_generator"

class HTMLGenerator < ERBGenerator

  def initialize(layout = nil)
    @layout = layout
  end

  def section(text)
    template = "<section><%= awesome_text %></section>"
    options_hash = {:locals => {:awesome_text => text}}
    erb template, options_hash
    wrap(erb template, options_hash)
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
    options_hash = {:locals => {:html_items => items}}
    erb(template, options_hash)
    wrap(erb template, options_hash)
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
    options_hash = {:locals => {:button_text => item, :button_text2 => item2}}
    erb(template, options_hash)
    wrap(erb template, options_hash)
  end

  def wrap(text)
    if @layout != nil
      @layout.gsub("<%= yield %>", text)
    else
      text
    end
  end

end
