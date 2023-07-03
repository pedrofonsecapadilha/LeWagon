def tag(tag_name, attributes = nil)
  # TODO: Build HTML tags around content given in the block
  #       The method can be called with an optional HTML attribute inputted as [attr_name, attr_value]
  if attributes.nil?
    "<#{tag_name}>#{yield}</#{tag_name}>"
  else
    "<#{tag_name} #{attributes[0]}=\"#{attributes[1]}\">#{yield}</#{tag_name}>"
    # ACHO QUE O MAIS CORRETO SERIA AUTOMATIZAR OS ATTRIBUTES
  end
end

# " R: <h1>Hello world</h1>"
# tag_name = "h1"
# attributes = nil
# yield = texto fornecido "Hello world"
# "<#{tag_name}>Hello world</#{tag_name}>"

# R: "<h1 style=\"color: red\">Hello world</h1>"
# tag_name = "h1"
# attributes = ["style", "color: red"]
# yield = texto fornecido "Hello world"

# R: "<div class=\"kitt-container\"><a href=\"https://kitt.lewagon.com\"><h2>KITT</h2></a></div>"
# tag_name = "div"
# attributes = ["class", "kitt-container"]
# yield = texto fornecido "KITT"
