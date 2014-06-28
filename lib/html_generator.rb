require "erb_generator"

class HTMLGenerator < ERBGenerator

  # def a method with one parameter
  # run each method
  # replace output of each method with "yield"
  # "yield" is part of string that will get passed as a parameter
  # use layout? :layout, nil

  def initialize(layout = nil)
    @layout = {:locals => {:layout => layout}}
  end

  def section(text)
    puts @gender
    template = "<section><%= awesome_text %></section>"
    options_hash = {:locals => {:awesome_text => text}}
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
    options_hash = {:locals => {:html_items => items}}
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
    options_hash = {:locals => {:button_text => item, :button_text2 => item2}}
    erb(template, options_hash)
  end

  def wrap(content)
    if @layout != nil
      @layout.gsub("YIELD", content)
    else
      content
    end

  end

end

# context "with a layout" do
#   it "returns wraps all html in the layout by replacing yield" do
#
#     gender_variable = "male"
#     html_generator = HTMLGenerator.new("<main><%= yield %></main>")
#     html = strip_whitespace(
#       html_generator.section("section_text")
#     )
#     expect(html).to eq("<main><section>section_text</section></main>")
#
#     html_generator = HTMLGenerator.new("<div><%= yield %></div>")
#     html = strip_whitespace(
#       html_generator.unordered_list(["an-item"])
#     )
#     expect(html).to eq("<div><ul><li>an-item</li></ul></div>")
#
#     html_generator = HTMLGenerator.new("<section><%= yield %></section>")
#     html = strip_whitespace(
#       html_generator.button("button-in-a-section")
#     )
#     expect(html).to eq("<section><button>button-in-a-section</button></section>")
#   end
# end
# end