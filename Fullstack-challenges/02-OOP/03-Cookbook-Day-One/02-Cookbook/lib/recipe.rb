# Model: what is the basic object you want to manipulate?

class Recipe
  attr_reader :name, :description

  def initialize(name, description)
    @name = name
    @description = description
  end
end
