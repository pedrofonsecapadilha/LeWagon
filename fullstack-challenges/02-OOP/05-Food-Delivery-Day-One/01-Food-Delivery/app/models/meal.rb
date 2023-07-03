# Each meal has an id, a name and a price

class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @price = attributes[:price]
  end
end
